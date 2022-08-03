defmodule QuestionaireLiveWeb.QuizController do
  use QuestionaireLiveWeb, :controller
  alias QuestionaireLive.Quizes
  alias QuestionaireLive.Quizes.Quiz
  alias QuestionaireLive.Repo

  def index(conn, _params) do
    quizes = Quizes.list_quizes()

    render(conn, "index.html", quizes: quizes)
  end

  def show(conn, %{"quiz_id" => quiz_id}) do
    quiz = Quizes.get_quiz!(quiz_id)
    IO.inspect(quiz)

    render(conn, "show.html", quiz: quiz)
  end

  def new(conn, _params) do
    changeset = Quizes.change_quiz(%Quiz{}, %{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"quiz" => quiz_params}) do

    changeset = Quizes.change_quiz(%Quiz{}, quiz_params)

    case Repo.insert(changeset) do
      {:ok, _quiz} ->
        conn
        |> put_flash(:info, "quiz created successfully.")
        |> redirect(to: Routes.quiz_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
