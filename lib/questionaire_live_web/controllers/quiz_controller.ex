defmodule QuestionaireLiveWeb.QuizController do
  use QuestionaireLiveWeb, :controller
  alias QuestionaireLive.Quizes.Quiz
  alias QuestionaireLive.Repo

  def index(conn, _params) do
    quizes = Quiz.list_quizes()

    render(conn, "index.html", quizes: quizes)
  end

  def show(conn, %{"quiz_id" => quiz_id}) do
    quiz = Quiz.get_quiz!(quiz_id)
    IO.inspect(quiz)

    render(conn, "show.html", quiz: quiz)
  end

  def new(conn, _params) do
    changeset = Quiz.change_quiz(%Quiz{}, %{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"quiz" => quiz_params}) do
    changeset = Quiz.change_quiz(%Quiz{}, quiz_params)

    case Repo.insert(changeset) do
      {:ok, _quiz} ->
        conn
        |> put_flash(:info, "quiz created successfully.")
        |> redirect(to: Routes.quiz_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"quiz_id" => quiz_id}) do
    quiz = Quiz.get_quiz!(quiz_id)

    changeset = Quiz.change_quiz(quiz)
    render(conn, "edit.html", quiz: quiz, changeset: changeset)
  end

  def complete_edit(conn, %{"quiz" => quiz_params, "quiz_id" => quiz_id}) do
    quiz = Quiz.get_quiz!(quiz_id)

    changeset = Quiz.change_quiz(quiz, quiz_params)

    case Repo.update(changeset) do
      {:ok, _quiz} ->
        conn
        |> put_flash(:info, "quiz updated successfully.")
        |> redirect(to: Routes.quiz_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        render(conn, "edit.html", changeset: changeset)
    end
  end

  def delete_quiz(conn, %{"quiz_id" => quiz_id}) do
    quiz = Quiz.get_quiz!(quiz_id)

    case Quiz.delete_quiz(quiz) do
      {:ok, quiz} ->
        IO.inspect(quiz)

        conn
        |> put_flash(:info, "Quiz deleted successfully.")
        |> redirect(to: Routes.quiz_path(conn, :index))

      {:error, error} ->
        IO.inspect(error)

        conn
        |> put_flash(:info, "Quiz deleted successfully.")
        |> redirect(to: Routes.quiz_path(conn, :index))
    end
  end
end
