defmodule QuestionaireLive.Quizes.Quiz do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quizes" do
    field :name, :string
    has_many :user_quizes, QuestionaireLive.Quizes.User_quiz

    timestamps()
  end

  @doc false
  def changeset(quiz, attrs) do
    quiz
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
