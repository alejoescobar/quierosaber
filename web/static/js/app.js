// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import socket from "./socket"
import Chart from "chart.js"
var channel = socket.channel('session:lobby', {}); // connect to chat "room"

let App = {
  initVue: function () {
    return new Vue({
      el: '#app',
      data: {
        session: {},
        participant: {},
        step: 'onboard',
        questionIndex: 0,
        question: {},
        results: [],
        poll: {}
      },
      methods: {
        setSession: function (session) {
          this.$data.session = session
          this.fetchPoll();
        },
        fetchPoll: function () {
          let data = this.$data;
          fetch('/api/polls/' + data.session.poll_id).then(function (res) {
            return res.json();
          }).then(function (res) {
            data.poll = res.poll;
          });
        },
        findSession: function () {
          let that = this
          let data = this.$data;
          let code = document.getElementById('code');
          fetch('/api/sessions/find?code=' + code.value).then(function (res) {
            code.value = '';
            return res.json();
          }).then(function (res) {
            data.session = res.session;
            that.fetchPoll();
            data.step = 'assign_name';
          });
        },
        createParticipant: function () {
          let data = this.$data;
          let nickname = document.getElementById('nickname');
          let participantData = { participant: {nickname: nickname.value, device_id: 'testing', session_id: data.session.id} }
          fetch('/api/sessions/' + data.session.id + '/participants', {
            method: 'POST',
            body: JSON.stringify(participantData),
            headers: {
              'Content-Type': 'application/json'
            }
          }).then(function(res) {
            nickname.value = '';
            return res.json()
          }).then(function (res) {
            data.participant = res.participant;
            data.step = 'in_lobby';
            channel.join();
            channel.push('subscribe', { // send the message to the server on "shout" channel
            name: data.participant.nickname,     // get value of "name" of person sending the message
          });
        })
      },
      createAnswer: function (question_id, option_id) {
        let data = this.$data;
        let answerData = { answer: { session_id: data.session.id, participant_id: data.participant.id, question_id: question_id, option_id: option_id } }
        fetch('/api/answers', {
          method: 'POST',
          body: JSON.stringify(answerData),
          headers: {
            'Content-Type': 'application/json'
          }
        }).then(function (res) {
          return res.json()
        }).then(function (res) {
          data.step = 'answered';
        })
      },
      subscribe: function () {
        channel.on('subscribe', function (payload) { // listen to the 'shout' event
        var p = document.createElement("p");   // creaet new list item DOM element
        var name = payload.name || 'guest';    // get name from payload or set default
        p.innerHTML = '<b>' + name + '</b>';   // set li contents
        var div = document.getElementById('participants')
        div.appendChild(p);                    // append to list
      });
      channel.join(); // join the channel.
    },
    questionListener: function () {
      let that = this
      let data = that.$data;
      channel.on('next_question', function (payload) {
        if (data.step != 'question' && data.step != 'results') {
          let questionId = that.getQuestionId(data.questionIndex)
          that.fetchQuestion(questionId)
          data.step = 'question';
        } else {
          data.questionIndex++;
          let questionId = that.getQuestionId(data.questionIndex)
          that.fetchQuestion(questionId)
          data.step = 'question';
        }
      })
    },
    resultListener: function () {
      let that = this;
      let data = this.$data;
      channel.on('get_results', function (payload) {
        data.step = 'results';
        that.fetchResults();
      })
      
    },
    parseResultsForChart: function (results, type) {
      return {
        // The type of chart we want to create
        type: type,
        
        // The data for our dataset
        data: {
          labels: results.map(option => option.title),
          datasets: [{
            label: 'Participants response',
            backgroundColor: 'rgb(0, 235, 140)',
            borderColor: 'rgb(0, 235, 140)',
            data: results.map(option => option.count)
          }]
        },
        
        // Configuration options go here
        options: {
          scales: {
            yAxes: [{
              ticks: {
                stepSize: 1,
                beginAtZero: true
              }
            }]
          }
        }
      }
    },
    fetchResults: function () {
      let data = this.$data
      let self = this
      fetch('/api/sessions/' + data.session.id + '/questions/' + this.getQuestionId(data.questionIndex) + '/results').then(function (res) {
        return res.json();
      }).then(function (res) {
        data.results = res.results
        data.resultsChart = self.parseResultsForChart(data.results, 'bar')
        data.ctx = document.getElementById('results-chart').getContext('2d')
        data.chart = new Chart(data.ctx, data.resultsChart)
      });
    },
    fetchQuestion: function (questionId) {
      let data = this.$data;
      fetch('/api/questions/' + questionId).then(function (res) {
        return res.json();
      }).then(function (res) {
        data.question = res.question;
      });
    },
    getQuestionId: function (questionIndex) {
      return this.$data.poll.questions[questionIndex].id
    },
    showResults: function () {
      channel.push('get_results', {});
    },
    nextQuestion: function () {
      channel.push('next_question', {});
    }
  }
})
}
};

// Look for any onload messages, give it the App
// context
if (window.appConfig !== undefined) {
  window.appConfig.onLoad.call(this, App);
}
