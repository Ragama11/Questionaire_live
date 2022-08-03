defmodule QuestionaireLiveWeb.AnswerController do
  use QuestionaireLiveWeb, :controller
  alias QuestionaireLive.Quizes
  alias QuestionaireLive.Quizes.Answer

  def index(conn, _params) do
    answers = Quizes.list_answers()

    render(conn, "index.html", answers: answers)
  end

  def show_awnswe(conn, %{"id" => id}) do
    answer = Quizes.get_answer!(id)

    render(conn, "show.html", answer: answer)
  end

  def new_answer(conn, %{"question_id"  => question_id, "quiz_id" => quiz_id}) do


    quiz = Quizes.get_quiz!(quiz_id)
    question = Quizes.get_question!(question_id)
    changeset = Quizes.change_answer(%Answer{}, %{})
    render(conn, "new.html", changeset: changeset,  question: question, quiz: quiz)
  end

  def create_answer(conn, %{"answer" => answer_params, "question_id" => question_id, "quiz_id" => quiz_id}) do

    question =
      Quizes.get_question!(question_id)
    quiz =
      Quizes.get_quiz!(quiz_id)



    case Quizes.add_question_answer(question, answer_params) do
      {:ok, _answer} ->
        conn
        |> put_flash(:info, "Answer created successfully.")
        |> redirect(to: Routes.quiz_path(conn, :show, quiz))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        render(conn, "new.html", changeset: changeset,question: question, quiz: quiz)
    end
  end
end
