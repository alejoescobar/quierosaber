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

    resources "/sessions", ApiSessionController, only: [:show]

    scope "/sessions/:session_id", QuieroSaber do
      post "/participants", ApiParticipantController, :create
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", QuieroSaber do
  #   pipe_through :api
  # end
end
