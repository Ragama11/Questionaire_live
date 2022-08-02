defmodule QuestionaireLive.Quizes do
  @moduledoc """
  The Try context.
  """

  import Ecto.Query, warn: false
  alias QuestionaireLive.Repo

  alias QuestionaireLive.Quizes.Quiz

  @doc """
  Returns the list of quizes.

  ## Examples

      iex> list_quizes()
      [%Quiz{}, ...]

  """
  def list_quizes do
    Repo.all(Quiz)
  end

  @doc """
  Gets a single quiz.

  Raises `Ecto.NoResultsError` if the Quiz does not exist.

  ## Examples

      iex> get_quiz!(123)
      %Quiz{}

      iex> get_quiz!(456)
      ** (Ecto.NoResultsError)

  """
  def get_quiz!(id), do: Repo.get!(Quiz, id)

  @doc """
  Creates a quiz.

  ## Examples

      iex> create_quiz(%{field: value})
      {:ok, %Quiz{}}

      iex> create_quiz(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_quiz(attrs \\ %{}) do
    %Quiz{}
    |> Quiz.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a quiz.

  ## Examples

      iex> update_quiz(quiz, %{field: new_value})
      {:ok, %Quiz{}}

      iex> update_quiz(quiz, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_quiz(%Quiz{} = quiz, attrs) do
    quiz
    |> Quiz.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a quiz.

  ## Examples

      iex> delete_quiz(quiz)
      {:ok, %Quiz{}}

      iex> delete_quiz(quiz)
      {:error, %Ecto.Changeset{}}

  """
  def delete_quiz(%Quiz{} = quiz) do
    Repo.delete(quiz)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking quiz changes.

  ## Examples

      iex> change_quiz(quiz)
      %Ecto.Changeset{data: %Quiz{}}

  """
  def change_quiz(%Quiz{} = quiz, attrs \\ %{}) do
    Quiz.changeset(quiz, attrs)
  end

  alias QuestionaireLive.Quizes.Subject

  @doc """
  Returns the list of subjects.

  ## Examples

      iex> list_subjects()
      [%Subject{}, ...]

  """
  def list_subjects do
    Repo.all(Subject)
  end

  @doc """
  Gets a single subject.

  Raises `Ecto.NoResultsError` if the Subject does not exist.

  ## Examples

      iex> get_subject!(123)
      %Subject{}

      iex> get_subject!(456)
      ** (Ecto.NoResultsError)

  """
  def get_subject!(id), do: Repo.get!(Subject, id)

  @doc """
  Creates a subject.

  ## Examples

      iex> create_subject(%{field: value})
      {:ok, %Subject{}}

      iex> create_subject(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_subject(attrs \\ %{}) do
    %Subject{}
    |> Subject.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a subject.

  ## Examples

      iex> update_subject(subject, %{field: new_value})
      {:ok, %Subject{}}

      iex> update_subject(subject, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_subject(%Subject{} = subject, attrs) do
    subject
    |> Subject.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a subject.

  ## Examples

      iex> delete_subject(subject)
      {:ok, %Subject{}}

      iex> delete_subject(subject)
      {:error, %Ecto.Changeset{}}

  """
  def delete_subject(%Subject{} = subject) do
    Repo.delete(subject)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking subject changes.

  ## Examples

      iex> change_subject(subject)
      %Ecto.Changeset{data: %Subject{}}

  """
  def change_subject(%Subject{} = subject, attrs \\ %{}) do
    Subject.changeset(subject, attrs)
  end

  alias QuestionaireLive.Quizes.Question

  @doc """
  Returns the list of questions.

  ## Examples

      iex> list_questions()
      [%Question{}, ...]

  """
  def list_questions do
    Repo.all(Question)
  end

  @doc """
  Gets a single question.

  Raises `Ecto.NoResultsError` if the Question does not exist.

  ## Examples

      iex> get_question!(123)
      %Question{}

      iex> get_question!(456)
      ** (Ecto.NoResultsError)

  """
  def get_question!(id), do: Repo.get!(Question, id)

  @doc """
  Creates a question.

  ## Examples

      iex> create_question(%{field: value})
      {:ok, %Question{}}

      iex> create_question(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_question(attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  def add_quiz_question(quiz, details) do
    quiz
    |> Ecto.build_assoc(:questions)
    |> Question.changeset(details)
    |> Repo.insert()
  end

  def add_question_subject(subject, details) do
    subject
    |> Ecto.build_assoc(:questions)
    |> Question.changeset(details)
    |> Repo.insert()
  end

  @doc """
  Updates a question.

  ## Examples

      iex> update_question(question, %{field: new_value})
      {:ok, %Question{}}

      iex> update_question(question, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a question.

  ## Examples

      iex> delete_question(question)
      {:ok, %Question{}}

      iex> delete_question(question)
      {:error, %Ecto.Changeset{}}

  """
  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking question changes.

  ## Examples

      iex> change_question(question)
      %Ecto.Changeset{data: %Question{}}

  """
  def change_question(%Question{} = question, attrs \\ %{}) do
    Question.changeset(question, attrs)
  end

  alias QuestionaireLive.Quizes.Answer

  @doc """
  Returns the list of answers.

  ## Examples

      iex> list_answers()
      [%Answer{}, ...]

  """
  def list_answers do
    Repo.all(Answer)
  end

  @doc """
  Gets a single answer.

  Raises `Ecto.NoResultsError` if the Answer does not exist.

  ## Examples

      iex> get_answer!(123)
      %Answer{}

      iex> get_answer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_answer!(id), do: Repo.get!(Answer, id)

  @doc """
  Creates a answer.

  ## Examples

      iex> create_answer(%{field: value})
      {:ok, %Answer{}}

      iex> create_answer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_answer(attrs \\ %{}) do
    %Answer{}
    |> Answer.changeset(attrs)
    |> Repo.insert()
  end

  def add_answer(question, attrs) do
    question
    |> Ecto.build_assoc(:answers)
    |> Answer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a answer.

  ## Examples

      iex> update_answer(answer, %{field: new_value})
      {:ok, %Answer{}}

      iex> update_answer(answer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_answer(%Answer{} = answer, attrs) do
    answer
    |> Answer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a answer.

  ## Examples

      iex> delete_answer(answer)
      {:ok, %Answer{}}

      iex> delete_answer(answer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_answer(%Answer{} = answer) do
    Repo.delete(answer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking answer changes.

  ## Examples

      iex> change_answer(answer)
      %Ecto.Changeset{data: %Answer{}}

  """
  def change_answer(%Answer{} = answer, attrs \\ %{}) do
    Answer.changeset(answer, attrs)
  end

  alias QuestionaireLive.Quizes.User_quiz

  @doc """
  Returns the list of user_quizes.

  ## Examples

      iex> list_user_quizes()
      [%User_quiz{}, ...]

  """
  def list_user_quizes do
    Repo.all(User_quiz)
  end

  @doc """
  Gets a single user_quiz.

  Raises `Ecto.NoResultsError` if the User quiz does not exist.

  ## Examples

      iex> get_user_quiz!(123)
      %User_quiz{}

      iex> get_user_quiz!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_quiz!(id), do: Repo.get!(User_quiz, id)

  @doc """
  Creates a user_quiz.

  ## Examples

      iex> create_user_quiz(%{field: value})
      {:ok, %User_quiz{}}

      iex> create_user_quiz(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_quiz(attrs \\ %{}) do
    %User_quiz{}
    |> User_quiz.changeset(attrs)
    |> Repo.insert()
  end

  def add_user_quiz(user, quiz) do
    User_quiz.changeset(%User_quiz{}, %{status: "initiated", result: 0})
    |> Ecto.Changeset.put_assoc(:user, user)
    |> Ecto.Changeset.put_assoc(:quiz, quiz)
    |> Repo.insert!()
  end

  @doc """
  Updates a user_quiz.

  ## Examples

      iex> update_user_quiz(user_quiz, %{field: new_value})
      {:ok, %User_quiz{}}

      iex> update_user_quiz(user_quiz, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_quiz(%User_quiz{} = user_quiz, attrs) do
    user_quiz
    |> User_quiz.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_quiz.

  ## Examples

      iex> delete_user_quiz(user_quiz)
      {:ok, %User_quiz{}}

      iex> delete_user_quiz(user_quiz)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_quiz(%User_quiz{} = user_quiz) do
    Repo.delete(user_quiz)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_quiz changes.

  ## Examples

      iex> change_user_quiz(user_quiz)
      %Ecto.Changeset{data: %User_quiz{}}

  """
  def change_user_quiz(%User_quiz{} = user_quiz, attrs \\ %{}) do
    User_quiz.changeset(user_quiz, attrs)
  end
end
