defmodule QuestionaireLive.AccountTransactionsTest do
  use QuestionaireLive.DataCase

  describe "account_transactions" do
    alias QuestionaireLive.Account_transactions.Account_transaction

    import QuestionaireLive.AccountsFixtures

    @invalid_attrs %{account_id: nil, amount: nil, currency: nil, transaction_type: nil}

    test "list_account_transactions/0 returns all account_transactions" do
      account_transaction = account_transaction_fixture()
      assert Account_transaction.list_account_transactions() == [account_transaction]
    end

    test "get_account_transaction!/1 returns the account_transaction with given id" do
      account_transaction = account_transaction_fixture()
      assert Account_transaction.get_account_transaction!(account_transaction.id) == account_transaction
    end

    test "create_account_transaction/1 with valid data creates a account_transaction" do
      valid_attrs = %{account_id: 42, amount: "some amount", currency: "some currency", transaction_type: "some transaction_type"}

      assert {:ok, %Account_transaction{} = account_transaction} = Account_transaction.create_account_transaction(valid_attrs)
      assert account_transaction.account_id == 42
      assert account_transaction.amount == "some amount"
      assert account_transaction.currency == "some currency"
      assert account_transaction.transaction_type == "some transaction_type"
    end

    test "create_account_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account_transaction.create_account_transaction(@invalid_attrs)
    end

    test "update_account_transaction/2 with valid data updates the account_transaction" do
      account_transaction = account_transaction_fixture()
      update_attrs = %{account_id: 43, amount: "some updated amount", currency: "some updated currency", transaction_type: "some updated transaction_type"}

      assert {:ok, %Account_transaction{} = account_transaction} = Account_transaction.update_account_transaction(account_transaction, update_attrs)
      assert account_transaction.account_id == 43
      assert account_transaction.amount == "some updated amount"
      assert account_transaction.currency == "some updated currency"
      assert account_transaction.transaction_type == "some updated transaction_type"
    end

    test "update_account_transaction/2 with invalid data returns error changeset" do
      account_transaction = account_transaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Account_transaction.update_account_transaction(account_transaction, @invalid_attrs)
      assert account_transaction == Account_transaction.get_account_transaction!(account_transaction.id)
    end

    test "delete_account_transaction/1 deletes the account_transaction" do
      account_transaction = account_transaction_fixture()
      assert {:ok, %Account_transaction{}} = Account_transaction.delete_account_transaction(account_transaction)
      assert_raise Ecto.NoResultsError, fn -> Account_transaction.get_account_transaction!(account_transaction.id) end
    end

    test "change_account_transaction/1 returns a account_transaction changeset" do
      account_transaction = account_transaction_fixture()
      assert %Ecto.Changeset{} = Account_transaction.change_account_transaction(account_transaction)
    end
  end
end
