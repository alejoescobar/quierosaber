# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     QuieroSaber.Repo.insert!(%QuieroSaber.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will halt execution if something goes wrong.

# Aliases preloaded for the iex console
alias QuieroSaber.Repo
alias QuieroSaber.Poll
alias QuieroSaber.Session
alias QuieroSaber.Question
alias QuieroSaber.Option
alias QuieroSaber.Participant
alias QuieroSaber.Answer

require Logger

# Clear all data before
Repo.delete_all Answer
Repo.delete_all Participant
Repo.delete_all Session
Repo.delete_all Option
Repo.delete_all Question
Repo.delete_all Poll

# Polls
poll = Repo.insert!(%Poll{
  name: "¿Qué rol tuviste en esta hackathon?"
})

# Questions with options
question = Repo.insert!(%Question{
  order: 1,
  title: "¿Qué rol tuviste en esta hackathon?",
  poll_id: poll.id
})

Repo.insert! %Option{question_id: question.id, order: 1, title: "Idea y negocio"}
Repo.insert! %Option{question_id: question.id, order: 2, title: "Diseño"}
Repo.insert! %Option{question_id: question.id, order: 3, title: "Desarrollo"}
Repo.insert! %Option{question_id: question.id, order: 4, title: "De todo un poco"}

question = Repo.insert!(%Question{
  order: 2,
  title: "¿Cómo te pareció esta versión respecto a otras hackathons?",
  poll_id: poll.id
})

Repo.insert! %Option{question_id: question.id, order: 1, title: "Superó a todas"}
Repo.insert! %Option{question_id: question.id, order: 2, title: "Dentro de las mejores"}
Repo.insert! %Option{question_id: question.id, order: 3, title: "Muy parecida a todas"}
Repo.insert! %Option{question_id: question.id, order: 4, title: "Han habido mejores"}

question = Repo.insert!(%Question{
  order: 3,
  title: "¿Saliste de tu zona de confort (herramientas, lenguajes...)?",
  poll_id: poll.id
})

Repo.insert! %Option{question_id: question.id, order: 1, title: "Casi todo nuevo (> 90%)"}
Repo.insert! %Option{question_id: question.id, order: 2, title: "Cerca de la mitad (~ 50%)"}
Repo.insert! %Option{question_id: question.id, order: 3, title: "Solo un par de cosas (< 30%)"}
Repo.insert! %Option{question_id: question.id, order: 4, title: "Solo tierras conocidas (< 10%)"}

question = Repo.insert!(%Question{
  order: 4,
  title: "¿Tu equipo supo planear el tiempo?",
  poll_id: poll.id
})

Repo.insert! %Option{question_id: question.id, order: 1, title: "Imposible, era mucho trabajo"}
Repo.insert! %Option{question_id: question.id, order: 2, title: "Perfecto, el tiempo apenas"}
Repo.insert! %Option{question_id: question.id, order: 3, title: "¡Casi!, nos faltó muy poco"}
Repo.insert! %Option{question_id: question.id, order: 4, title: "Sobrados, con tiempo de relajo"}

question = Repo.insert!(%Question{
  order: 5,
  title: "¿Asistieron a alguna charla o taller propuesto?",
  poll_id: poll.id
})

Repo.insert! %Option{question_id: question.id, order: 1, title: "A todos 🤓"}
Repo.insert! %Option{question_id: question.id, order: 2, title: "Casi a todos"}
Repo.insert! %Option{question_id: question.id, order: 3, title: "Solo uno o dos"}
Repo.insert! %Option{question_id: question.id, order: 4, title: "Ninguno"}
