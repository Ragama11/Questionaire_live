defmodule QuestionaireLive.AccountsTest do
  use QuestionaireLive.DataCase


  describe "accounts" do
    alias QuestionaireLive.Account.Accounts

    import QuestionaireLive.AccountsFixtures

    @invalid_attrs %{account_number: nil, balance: nil, currency: nil, user_id: nil}

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert Accounts.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Accounts.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      valid_attrs = %{account_number: "some account_number", balance: "some balance", currency: "some currency", user_id: 42}

      assert {:ok, %Account{} = account} = Accounts.create_account(valid_attrs)
      assert account.account_number == "some account_number"
      assert account.balance == "some balance"
      assert account.currency == "some currency"
      assert account.user_id == 42
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      update_attrs = %{account_number: "some updated account_number", balance: "some updated balance", currency: "some updated currency", user_id: 43}

      assert {:ok, %Account{} = account} = Accounts.update_account(account, update_attrs)
      assert account.account_number == "some updated account_number"
      assert account.balance == "some updated balance"
      assert account.currency == "some updated currency"
      assert account.user_id == 43
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_account(account, @invalid_attrs)
      assert account == Accounts.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Accounts.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Accounts.change_account(account)
    end
  end

  describe "withdrawals" do
    alias QuestionaireLive.Accounts.Withdrawal

    import QuestionaireLive.AccountsFixtures

    @invalid_attrs %{account_transaction_id: nil, amount: nil, msisdn: nil, reference_number: nil}

    test "list_withdrawals/0 returns all withdrawals" do
      withdrawal = withdrawal_fixture()
      assert Accounts.list_withdrawals() == [withdrawal]
    end

    test "get_withdrawal!/1 returns the withdrawal with given id" do
      withdrawal = withdrawal_fixture()
      assert Accounts.get_withdrawal!(withdrawal.id) == withdrawal
    end

    test "create_withdrawal/1 with valid data creates a withdrawal" do
      valid_attrs = %{account_transaction_id: 42, amount: 42, msisdn: "some msisdn", reference_number: "some reference_number"}

      assert {:ok, %Withdrawal{} = withdrawal} = Accounts.create_withdrawal(valid_attrs)
      assert withdrawal.account_transaction_id == 42
      assert withdrawal.amount == 42
      assert withdrawal.msisdn == "some msisdn"
      assert withdrawal.reference_number == "some reference_number"
    end

    test "create_withdrawal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_withdrawal(@invalid_attrs)
    end

    test "update_withdrawal/2 with valid data updates the withdrawal" do
      withdrawal = withdrawal_fixture()
      update_attrs = %{account_transaction_id: 43, amount: 43, msisdn: "some updated msisdn", reference_number: "some updated reference_number"}

      assert {:ok, %Withdrawal{} = withdrawal} = Accounts.update_withdrawal(withdrawal, update_attrs)
      assert withdrawal.account_transaction_id == 43
      assert withdrawal.amount == 43
      assert withdrawal.msisdn == "some updated msisdn"
      assert withdrawal.reference_number == "some updated reference_number"
    end

    test "update_withdrawal/2 with invalid data returns error changeset" do
      withdrawal = withdrawal_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_withdrawal(withdrawal, @invalid_attrs)
      assert withdrawal == Accounts.get_withdrawal!(withdrawal.id)
    end

    test "delete_withdrawal/1 deletes the withdrawal" do
      withdrawal = withdrawal_fixture()
      assert {:ok, %Withdrawal{}} = Accounts.delete_withdrawal(withdrawal)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_withdrawal!(withdrawal.id) end
    end

    test "change_withdrawal/1 returns a withdrawal changeset" do
      withdrawal = withdrawal_fixture()
      assert %Ecto.Changeset{} = Accounts.change_withdrawal(withdrawal)
    end
  end
end
