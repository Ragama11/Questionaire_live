defmodule QuestionaireLiveWeb.QuestionController do
  use QuestionaireLiveWeb, :controller
  alias QuestionaireLive.Quizes
  alias QuestionaireLive.Quizes.Question
  alias QuestionaireLive.Repo

  def index(conn, _params) do
    questions = Quizes.list_questions()

    render(conn, "index.html", questions: questions)
  end

  def show_question(conn, %{"question_id" => question_id}) do
    question = Quizes.get_question!(question_id)

    render(conn, "show.html", question: question)
  end

  def new_question(conn, %{"quiz_id" => quiz_id}) do
    changeset = Quizes.change_question(%Question{}, %{})
    quiz = Quizes.get_quiz!(quiz_id)
    render(conn, "new.html", changeset: changeset, quiz: quiz)
  end

  def create_question(conn, %{"question" => question_params, "quiz_id" => quiz_id}) do
    quiz = Quizes.get_quiz!(quiz_id)

    case Quizes.add_quiz_question(quiz, question_params) do
      {:ok, _question} ->
        conn
        |> put_flash(:info, "Question created successfully.")
        |> redirect(to: Routes.quiz_path(conn, :show, quiz))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit_question(conn, %{"question_id" => question_id, "quiz_id" => quiz_id}) do
    question = Quizes.get_question!(question_id)
    IO.inspect(question)
    quiz = Quizes.get_quiz!(quiz_id)
    changeset = Quizes.change_question(question)
    render(conn, "edit.html", question: question, changeset: changeset, quiz: quiz)
  end

  def complete_edit(conn, %{
        "question" => question_params,
        "question_id" => question_id,
        "quiz_id" => quiz_id
      }) do
    question = Quizes.get_question!(question_id)

    changeset = Quizes.change_question(question, question_params)
    quiz = Quizes.get_quiz!(quiz_id)

    case Repo.update(changeset) do
      {:ok, _question} ->
        conn
        |> put_flash(:info, "question updated successfully.")
        |> redirect(to: Routes.quiz_path(conn, :show, quiz))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        render(conn, "edit.html", changeset: changeset)
    end
  end

  def delete_question(conn, %{"quiz_id" => quiz_id, "question_id" => question_id}) do
    quiz = Quizes.get_quiz!(quiz_id)
    question = Quizes.get_question!(question_id)

    case Quizes.delete_question(question) do
      {:ok, _question} ->
        conn
        |> put_flash(:info, "Question deleted successfully.")
        |> redirect(to: Routes.quiz_path(conn, :show, quiz))

      {:error, _error} ->
        conn
        |> put_flash(:info, "Question deleted unsuccessfully.")
        |> redirect(to: Routes.quiz_path(conn, :show, quiz))
    end
  end
end
