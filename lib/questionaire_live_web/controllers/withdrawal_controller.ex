defmodule QuestionaireLiveWeb.WithdrawalController do
  use QuestionaireLiveWeb, :controller

  alias QuestionaireLive.Withdrawals.Withdrawal

  def index(conn, _params) do
    withdrawals = Withdrawal.list_withdrawals()
    render(conn, "index.html", withdrawals: withdrawals)
  end

  def new(conn, _params) do
    changeset = Withdrawal.change_withdrawal(%Withdrawal{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"withdrawal" => withdrawal_params}) do
    case Withdrawal.create_withdrawal(withdrawal_params) do
      {:ok, withdrawal} ->
        conn
        |> put_flash(:info, "Withdrawal created successfully.")
        |> redirect(to: Routes.withdrawal_path(conn, :show, withdrawal))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    withdrawal = Withdrawal.get_withdrawal!(id)
    render(conn, "show.html", withdrawal: withdrawal)
  end

  def edit(conn, %{"id" => id}) do
    withdrawal = Withdrawal.get_withdrawal!(id)
    changeset = Withdrawal.change_withdrawal(withdrawal)
    render(conn, "edit.html", withdrawal: withdrawal, changeset: changeset)
  end

  def update(conn, %{"id" => id, "withdrawal" => withdrawal_params}) do
    withdrawal = Withdrawal.get_withdrawal!(id)

    case Withdrawal.update_withdrawal(withdrawal, withdrawal_params) do
      {:ok, withdrawal} ->
        conn
        |> put_flash(:info, "Withdrawal updated successfully.")
        |> redirect(to: Routes.withdrawal_path(conn, :show, withdrawal))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", withdrawal: withdrawal, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    withdrawal = Withdrawal.get_withdrawal!(id)
    {:ok, _withdrawal} = Withdrawal.delete_withdrawal(withdrawal)

    conn
    |> put_flash(:info, "Withdrawal deleted successfully.")
    |> redirect(to: Routes.withdrawal_path(conn, :index))
  end
end
