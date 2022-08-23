defmodule QuestionaireLive.Account.Accounts do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias QuestionaireLive.Repo
  alias QuestionaireLive.Account.Accounts
  alias QuestionaireLive.Users.User

  schema "accounts" do
    field :account_number, :string
    field :balance, :string
    field :currency, :string
    has_one :user, QuestionaireLive.Users.User

    timestamps()
  end

  def changeset(account, attrs) do
    account
    |> cast(attrs, [:balance, :currency, :user_id, :account_number])
    |> validate_required([:balance, :currency, :user_id, :account_number])
  end

  def list_accounts do
    Repo.all(Account)
  end

  def get_account!(id), do: Repo.get!(Account, id)

  def create_account(attrs \\ %{}) do
    %Accounts{}
    |> Accounts.changeset(attrs)
    |> Repo.insert()
  end

  def update_account(%Accounts{} = account, attrs) do
    account
    |> Accounts.changeset(attrs)
    |> Repo.update()
  end

  def add_user_account(user, details) do
    user
    |> Ecto.build_assoc(:user)
    |> User.changeset(details)
    |> Repo.insert()
  end

  def delete_account(%Accounts{} = account) do
    Repo.delete(account)
  end

  def change_account(%Accounts{} = account, attrs \\ %{}) do
    Accounts.changeset(account, attrs)
  end
end
