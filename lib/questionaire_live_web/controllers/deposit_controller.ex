defmodule QuestionaireLiveWeb.DepositController do
  use QuestionaireLiveWeb, :controller

  alias QuestionaireLive.Deposits.Deposit

  def index(conn, _params) do
    deposits = Deposit.list_deposits()
    render(conn, "index.html", deposits: deposits)
  end

  def new(conn, _params) do
    changeset = Deposit.change_deposit(%Deposit{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"deposit" => deposit_params}) do
    case Deposit.create_deposit(deposit_params) do
      {:ok, deposit} ->
        conn
        |> put_flash(:info, "Deposit created successfully.")
        |> redirect(to: Routes.deposit_path(conn, :show, deposit))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    deposit = Deposit.get_deposit!(id)
    render(conn, "show.html", deposit: deposit)
  end

  def edit(conn, %{"id" => id}) do
    deposit = Deposit.get_deposit!(id)
    changeset = Deposit.change_deposit(deposit)
    render(conn, "edit.html", deposit: deposit, changeset: changeset)
  end

  def update(conn, %{"id" => id, "deposit" => deposit_params}) do
    deposit = Deposit.get_deposit!(id)

    case Deposit.update_deposit(deposit, deposit_params) do
      {:ok, deposit} ->
        conn
        |> put_flash(:info, "Deposit updated successfully.")
        |> redirect(to: Routes.deposit_path(conn, :show, deposit))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", deposit: deposit, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    deposit = Deposit.get_deposit!(id)
    {:ok, _deposit} = Deposit.delete_deposit(deposit)

    conn
    |> put_flash(:info, "Deposit deleted successfully.")
    |> redirect(to: Routes.deposit_path(conn, :index))
  end
end
