defmodule QuestionaireLiveWeb.Router do
  use QuestionaireLiveWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {QuestionaireLiveWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :admin do
    plug QuestionaireLiveWeb.EnsureRolePlug, :admin
  end

  scope "/admin", QuestionaireLiveWeb do
    pipe_through [:browser, :admin]

    get "/quiz", QuizController, :index
    get "/quiz/new", QuizController, :new
    post "/quiz/new", QuizController, :create
    get "/quiz/:quiz_id", QuizController, :show

    # show answers
    get "/quiz/:quiz_id/new", QuestionController, :new_question
    post "/quiz/:quiz_id/new", QuestionController, :create_question
    get "/quiz/:quiz_id/:question_id", QuestionController, :show_question
    
    get "/quiz/:quiz_id/:question_id/edit", QuestionController, :edit_question
    post "/quiz/:quiz_id/:question_id/edit", QuestionController, :update_question

    get "/quiz/:quiz_id/:question_id/new/answer", AnswerController, :new_answer
    post "/quiz/:quiz_id/:question_id/new/answer", AnswerController, :create_answer
    get "/quiz/:quiz_id/:question_id/:answer_id", AnswerController, :show_answer
    get "/quiz/:quiz_id/:question_id/:answer_id/edit", AnswerController, :edit_answer
    post "/quiz/:quiz_id/:question_id/:answer_id/edit", AnswerController, :update_answer

    # ...
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
  end

  scope "/", QuestionaireLiveWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", QuestionaireLiveWeb do
    pipe_through [:browser, :protected]

    # Add your protected routes here
  end

  # Other scopes may use custom stacks.
  # scope "/api", QuestionaireLiveWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: QuestionaireLiveWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
