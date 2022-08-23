defmodule QuestionaireLive.DepositsTest do
  use QuestionaireLive.DataCase



  describe "deposits" do
    alias QuestionaireLive.Deposits.Deposit

    import QuestionaireLive.DepositsFixtures

    @invalid_attrs %{account_transaction_id: nil, amount: nil, msisdn: nil, "ref.no": nil}

    test "list_deposits/0 returns all deposits" do
      deposit = deposit_fixture()
      assert Deposit.list_deposits() == [deposit]
    end

    test "get_deposit!/1 returns the deposit with given id" do
      deposit = deposit_fixture()
      assert Deposit.get_deposit!(deposit.id) == deposit
    end

    test "create_deposit/1 with valid data creates a deposit" do
      valid_attrs = %{account_transaction_id: 42, amount: "some amount", msisdn: "some msisdn", "ref.no": "some ref.no"}

      assert {:ok, %Deposit{} = deposit} = Deposit.create_deposit(valid_attrs)
      assert deposit.account_transaction_id == 42
      assert deposit.amount == "some amount"
      assert deposit.msisdn == "some msisdn"
      assert deposit.ref.no == "some ref.no"
    end

    test "create_deposit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Deposit.create_deposit(@invalid_attrs)
    end

    test "update_deposit/2 with valid data updates the deposit" do
      deposit = deposit_fixture()
      update_attrs = %{account_transaction_id: 43, amount: "some updated amount", msisdn: "some updated msisdn", "ref.no": "some updated ref.no"}

      assert {:ok, %Deposit{} = deposit} = Deposit.update_deposit(deposit, update_attrs)
      assert deposit.account_transaction_id == 43
      assert deposit.amount == "some updated amount"
      assert deposit.msisdn == "some updated msisdn"
      assert deposit.ref.no == "some updated ref.no"
    end

    test "update_deposit/2 with invalid data returns error changeset" do
      deposit = deposit_fixture()
      assert {:error, %Ecto.Changeset{}} = Deposit.update_deposit(deposit, @invalid_attrs)
      assert deposit == Accounts.get_deposit!(deposit.id)
    end

    test "delete_deposit/1 deletes the deposit" do
      deposit = deposit_fixture()
      assert {:ok, %Deposit{}} = Deposit.delete_deposit(deposit)
      assert_raise Ecto.NoResultsError, fn -> Deposit.get_deposit!(deposit.id) end
    end

    test "change_deposit/1 returns a deposit changeset" do
      deposit = deposit_fixture()
      assert %Ecto.Changeset{} = Deposit.change_deposit(deposit)
    end
  end


end
