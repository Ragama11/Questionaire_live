defmodule QuestionaireLive.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema



  schema "users" do
    field :role, :string, default: "user"
    has_many :user_quizes, QuestionaireLive.Quizes.User_quiz

    pow_user_fields()

    timestamps()
  end

  def changeset_role(user_or_changeset, attrs) do
    user_or_changeset
    |> Ecto.Changeset.cast(attrs, [:role])
    |> Ecto.Changeset.validate_inclusion(:role, ~w(user admin))
  end



end
