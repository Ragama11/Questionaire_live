defmodule QuestionaireLive.Quizes.Quiz do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quizes" do
    field :name, :string
    has_many :user_quizes, QuestionaireLive.Quizes.User_quiz, on_delete: :delete_all
    has_many :questions, QuestionaireLive.Quizes.Question, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(quiz, attrs) do
    quiz
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)

  end
end
