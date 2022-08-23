defmodule QuestionaireLive.Quizes.User_quiz do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias QuestionaireLive.Repo
  alias QuestionaireLive.Quizes.User_quiz

  schema "user_quizes" do
    field :result, :integer
    field :status, :string
    belongs_to :user, QuestionaireLive.Users.User
    belongs_to :quiz, QuestionaireLive.Quizes.Quiz

    timestamps()
  end

  def changeset(user_quiz, attrs) do
    user_quiz
    |> cast(attrs, [:result, :status])
    |> validate_required([:result, :status])
  end

  def list_user_quizes do
    Repo.all(User_quiz)
  end

  def get_user_quiz!(id), do: Repo.get!(User_quiz, id)

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

  def update_user_quiz(%User_quiz{} = user_quiz, attrs) do
    user_quiz
    |> User_quiz.changeset(attrs)
    |> Repo.update()
  end

  def delete_user_quiz(%User_quiz{} = user_quiz) do
    Repo.delete(user_quiz)
  end

  def change_user_quiz(%User_quiz{} = user_quiz, attrs \\ %{}) do
    User_quiz.changeset(user_quiz, attrs)
  end
end
