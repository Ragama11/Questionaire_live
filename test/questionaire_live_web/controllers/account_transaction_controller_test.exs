defmodule QuestionaireLiveWeb.Account_transactionControllerTest do
  use QuestionaireLiveWeb.ConnCase

  import QuestionaireLive.AccountsFixtures

  @create_attrs %{account_id: 42, amount: "some amount", currency: "some currency", transaction_type: "some transaction_type"}
  @update_attrs %{account_id: 43, amount: "some updated amount", currency: "some updated currency", transaction_type: "some updated transaction_type"}
  @invalid_attrs %{account_id: nil, amount: nil, currency: nil, transaction_type: nil}

  describe "index" do
    test "lists all account_transactions", %{conn: conn} do
      conn = get(conn, Routes.account_transaction_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Account transactions"
    end
  end

  describe "new account_transaction" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.account_transaction_path(conn, :new))
      assert html_response(conn, 200) =~ "New Account transaction"
    end
  end

  describe "create account_transaction" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.account_transaction_path(conn, :create), account_transaction: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.account_transaction_path(conn, :show, id)

      conn = get(conn, Routes.account_transaction_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Account transaction"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.account_transaction_path(conn, :create), account_transaction: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Account transaction"
    end
  end

  describe "edit account_transaction" do
    setup [:create_account_transaction]

    test "renders form for editing chosen account_transaction", %{conn: conn, account_transaction: account_transaction} do
      conn = get(conn, Routes.account_transaction_path(conn, :edit, account_transaction))
      assert html_response(conn, 200) =~ "Edit Account transaction"
    end
  end

  describe "update account_transaction" do
    setup [:create_account_transaction]

    test "redirects when data is valid", %{conn: conn, account_transaction: account_transaction} do
      conn = put(conn, Routes.account_transaction_path(conn, :update, account_transaction), account_transaction: @update_attrs)
      assert redirected_to(conn) == Routes.account_transaction_path(conn, :show, account_transaction)

      conn = get(conn, Routes.account_transaction_path(conn, :show, account_transaction))
      assert html_response(conn, 200) =~ "some updated amount"
    end

    test "renders errors when data is invalid", %{conn: conn, account_transaction: account_transaction} do
      conn = put(conn, Routes.account_transaction_path(conn, :update, account_transaction), account_transaction: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Account transaction"
    end
  end

  describe "delete account_transaction" do
    setup [:create_account_transaction]

    test "deletes chosen account_transaction", %{conn: conn, account_transaction: account_transaction} do
      conn = delete(conn, Routes.account_transaction_path(conn, :delete, account_transaction))
      assert redirected_to(conn) == Routes.account_transaction_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.account_transaction_path(conn, :show, account_transaction))
      end
    end
  end

  defp create_account_transaction(_) do
    account_transaction = account_transaction_fixture()
    %{account_transaction: account_transaction}
  end
end
