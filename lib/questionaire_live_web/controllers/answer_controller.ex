defmodule QuestionaireLiveWeb.AnswerController do
  use QuestionaireLiveWeb, :controller
  alias QuestionaireLive.Quizes
  alias QuestionaireLive.Quizes.Answer
  alias QuestionaireLive.Repo

  def index(conn, _params) do
    answers = Quizes.list_answers()

    render(conn, "index.html", answers: answers)
  end

  def show_awnswe(conn, %{"id" => id}) do
    answer = Quizes.get_answer!(id)

    render(conn, "show.html", answer: answer)
  end

  def new_answer(conn, %{"question_id" => question_id, "quiz_id" => quiz_id}) do
    quiz = Quizes.get_quiz!(quiz_id)
    question = Quizes.get_question!(question_id)
    changeset = Quizes.change_answer(%Answer{}, %{})
    render(conn, "new.html", changeset: changeset, question: question, quiz: quiz)
  end

  def create_answer(conn, %{
        "answer" => answer_params,
        "question_id" => question_id,
        "quiz_id" => quiz_id
      }) do
    question = Quizes.get_question!(question_id)
    quiz = Quizes.get_quiz!(quiz_id)

    case Quizes.add_question_answer(question, answer_params) do
      {:ok, _answer} ->
        conn
        |> put_flash(:info, "Answer created successfully.")
        |> redirect(to: Routes.quiz_path(conn, :show, quiz))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        render(conn, "new.html", changeset: changeset, question: question, quiz: quiz)
    end
  end

  def edit_answer(conn, %{
        "question_id" => question_id,
        "quiz_id" => quiz_id,
        "answer_id" => answer_id
      }) do
    answer = Quizes.get_answer!(answer_id)
    quiz = Quizes.get_quiz!(quiz_id)
    question = Quizes.get_question!(question_id)

    changeset = Quizes.change_answer(answer)

    render(conn, "edit.html", question: question, changeset: changeset, quiz: quiz, answer: answer)
  end

  def complete_edit(conn, %{
        "answer" => answer_params,
        "question_id" => question_id,
        "quiz_id" => quiz_id,
        "answer_id" => answer_id
      }) do
    question = Quizes.get_question!(question_id)
    answer = Quizes.get_answer!(answer_id)
    changeset = Quizes.change_answer(answer, answer_params)
    quiz = Quizes.get_quiz!(quiz_id)

    case Repo.update(changeset) do
      {:ok, _answer} ->
        conn
        |> put_flash(:info, "answer updated successfully.")
        |> redirect(to: Routes.quiz_path(conn, :show, quiz, question))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end
  end

  def delete_answer(conn, %{
        "quiz_id" => quiz_id,
        "question_id" => question_id,
        "answer_id" => answer_id
      }) do
    quiz = Quizes.get_quiz!(quiz_id)
    question = Quizes.get_question!(question_id)
    answer = Quizes.get_answer!(answer_id)

    case Quizes.delete_answer(answer) do
      {:ok, _answer} ->
        conn
        |> put_flash(:info, "Answer deleted successfully.")
        |> redirect(to: Routes.quiz_path(conn, :show, quiz, question))

      {:error, _error} ->
        conn
        |> put_flash(:info, "Answer deleted unsuccessfully.")
        |> redirect(to: Routes.quiz_path(conn, :show, quiz, question))
    end
  end
end
