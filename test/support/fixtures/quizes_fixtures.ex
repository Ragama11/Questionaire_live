defmodule QuestionaireLive.QuizesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `QuestionaireLive.Try` context.
  """

  @doc """
  Generate a quiz.
  """
  def quiz_fixture(attrs \\ %{}) do
    {:ok, quiz} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> QuestionaireLive.Quizes.create_quiz()

    quiz
  end

  @doc """
  Generate a subject.
  """
  def subject_fixture(attrs \\ %{}) do
    {:ok, subject} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> QuestionaireLive.Quizes.create_subject()

    subject
  end

  @doc """
  Generate a question.
  """
  def question_fixture(attrs \\ %{}) do
    {:ok, question} =
      attrs
      |> Enum.into(%{
        question: "some question"
      })
      |> QuestionaireLive.Quizes.create_question()

    question
  end

  @doc """
  Generate a answer.
  """
  def answer_fixture(attrs \\ %{}) do
    {:ok, answer} =
      attrs
      |> Enum.into(%{
        value: "some value"
      })
      |> QuestionaireLive.Quizes.create_answer()

    answer
  end

  @doc """
  Generate a user_quiz.
  """
  def user_quiz_fixture(attrs \\ %{}) do
    {:ok, user_quiz} =
      attrs
      |> Enum.into(%{
        result: 42,
        status: "some status"
      })
      |> QuestionaireLive.Quizes.create_user_quiz()

    user_quiz
  end
end
