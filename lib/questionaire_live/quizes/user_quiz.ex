defmodule QuestionaireLive.Quizes.User_quiz do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_quizes" do
    field :result, :integer
    field :status, :string
    belongs_to :user, QuestionaireLive.Users.User
    belongs_to :quiz, QuestionaireLive.Quizes.Quiz

    timestamps()
  end

  @doc false
  def changeset(user_quiz, attrs) do
    user_quiz
    |> cast(attrs, [:result, :status])
    |> validate_required([:result, :status])
  end
end
