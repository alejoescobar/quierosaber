defmodule QuieroSaber.Router do
  use QuieroSaber.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", QuieroSaber do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    # Admin CRUD
    resources "/sessions", SessionController
    resources "/questions", QuestionController
    resources "/options", OptionController
    resources "/participants", ParticipantController
    resources "/answers", AnswerController
    resources "/polls", PollController
  end

  scope "/api", QuieroSaber do
    pipe_through :api
    resources "/answers", ApiAnswerController, only: [:create]
    resources "/polls", ApiPollController, only: [:show]
    resources "/questions", ApiQuestionController, only: [:show]
    get "/sessions/find", ApiSessionController, :find
    resources "/sessions", ApiSessionController, only: [:show] do
      resources "/participants", ApiParticipantController, only: [:create]
      get "/questions/:id/results", ApiQuestionController, :results
    end
  end
end
