defmodule QuestionaireLiveWeb.Account_transactionController do
  use QuestionaireLiveWeb, :controller

  alias QuestionaireLive.Account_transactions.Account_transaction

  def index(conn, _params) do
    account_transactions = Account_transaction.list_account_transactions()
    render(conn, "index.html", account_transactions: account_transactions)
  end

  def new(conn, _params) do
    changeset = Account_transaction.change_account_transaction(%Account_transaction{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"account_transaction" => account_transaction_params}) do
    case Account_transaction.create_account_transaction(account_transaction_params) do
      {:ok, account_transaction} ->
        conn
        |> put_flash(:info, "Account transaction created successfully.")
        |> redirect(to: Routes.account_transaction_path(conn, :show, account_transaction))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    account_transaction = Account_transaction.get_account_transaction!(id)
    render(conn, "show.html", account_transaction: account_transaction)
  end

  def edit(conn, %{"id" => id}) do
    account_transaction = Account_transaction.get_account_transaction!(id)
    changeset = Account_transaction.change_account_transaction(account_transaction)
    render(conn, "edit.html", account_transaction: account_transaction, changeset: changeset)
  end

  def update(conn, %{"id" => id, "account_transaction" => account_transaction_params}) do
    account_transaction = Account_transaction.get_account_transaction!(id)

    case Account_transaction.update_account_transaction(account_transaction, account_transaction_params) do
      {:ok, account_transaction} ->
        conn
        |> put_flash(:info, "Account transaction updated successfully.")
        |> redirect(to: Routes.account_transaction_path(conn, :show, account_transaction))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", account_transaction: account_transaction, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    account_transaction = Account_transaction.get_account_transaction!(id)
    {:ok, _account_transaction} = Account_transaction.delete_account_transaction(account_transaction)

    conn
    |> put_flash(:info, "Account transaction deleted successfully.")
    |> redirect(to: Routes.account_transaction_path(conn, :index))
  end
end
