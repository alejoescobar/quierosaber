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
var channel = socket.channel('session:lobby', {}); // connect to chat "room"

let App = {
  subscribe: function () {
    // var channel = socket.channel('session:lobby', {}); // connect to chat "session"
    channel.on('subscribe', function (payload) { // listen to the 'shout' event
      var p = document.createElement("p");   // creaet new list item DOM element
      var name = payload.name || 'guest';    // get name from payload or set default
      p.innerHTML = '<b>' + name + '</b>';   // set li contents
      var div = document.getElementById('participants')
      div.appendChild(p);                    // append to list
    });
    channel.join(); // join the channel.
  },
  initVue: function () {
    return new Vue({
      el: '#app',
      data: {
        session: {},
        participant: {},
        step: 'onboard'
      },
      methods: {
        findSession: function () {
          let data = this.$data;
          let code = document.getElementById('code');
          fetch('/api/sessions/find?code=' + code.value).then(function (res) {
            code.value = '';
            return res.json();
          }).then(function (res) {
            data.session = res.session;
            data.step = 'assign_name';
          });
        },
        createParticipant: function () {
          let that = this
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
