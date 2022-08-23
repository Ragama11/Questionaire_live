defmodule QuestionaireLive.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema



  schema "users" do
    pow_user_fields()
    field :role, :string, default: "admin"
    field :first_name, :string
    field :last_name, :string
    field :phone, :string
    belongs_to :accounts, QuestionaireLive.Account.Accounts

    has_many :user_quizes, QuestionaireLive.Quizes.User_quiz


    timestamps()
  end

  def changeset_role(user_or_changeset, attrs) do
    user_or_changeset
    |> Ecto.Changeset.cast(attrs, [:role])
    |> Ecto.Changeset.validate_inclusion(:role, ~w(user admin))
  end



end
