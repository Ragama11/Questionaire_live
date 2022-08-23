defmodule QuestionaireLive.WithdrawalsTest do
  use QuestionaireLive.DataCase

  describe "withdrawals" do
    alias QuestionaireLive.Withdrawals.Withdrawal

    import QuestionaireLive.WithdrawalsFixtures

    @invalid_attrs %{account_transaction_id: nil, amount: nil, msisdn: nil, reference_number: nil}

    test "list_withdrawals/0 returns all withdrawals" do
      withdrawal = withdrawal_fixture()
      assert Withdrawal.list_withdrawals() == [withdrawal]
    end

    test "get_withdrawal!/1 returns the withdrawal with given id" do
      withdrawal = withdrawal_fixture()
      assert Withdrawal.get_withdrawal!(withdrawal.id) == withdrawal
    end

    test "create_withdrawal/1 with valid data creates a withdrawal" do
      valid_attrs = %{account_transaction_id: 42, amount: 42, msisdn: "some msisdn", reference_number: "some reference_number"}

      assert {:ok, %Withdrawal{} = withdrawal} = Withdrawal.create_withdrawal(valid_attrs)
      assert withdrawal.account_transaction_id == 42
      assert withdrawal.amount == 42
      assert withdrawal.msisdn == "some msisdn"
      assert withdrawal.reference_number == "some reference_number"
    end

    test "create_withdrawal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Withdrawal.create_withdrawal(@invalid_attrs)
    end

    test "update_withdrawal/2 with valid data updates the withdrawal" do
      withdrawal = withdrawal_fixture()
      update_attrs = %{account_transaction_id: 43, amount: 43, msisdn: "some updated msisdn", reference_number: "some updated reference_number"}

      assert {:ok, %Withdrawal{} = withdrawal} = Withdrawal.update_withdrawal(withdrawal, update_attrs)
      assert withdrawal.account_transaction_id == 43
      assert withdrawal.amount == 43
      assert withdrawal.msisdn == "some updated msisdn"
      assert withdrawal.reference_number == "some updated reference_number"
    end

    test "update_withdrawal/2 with invalid data returns error changeset" do
      withdrawal = withdrawal_fixture()
      assert {:error, %Ecto.Changeset{}} = Withdrawal.update_withdrawal(withdrawal, @invalid_attrs)
      assert withdrawal == Withdrawal.get_withdrawal!(withdrawal.id)
    end

    test "delete_withdrawal/1 deletes the withdrawal" do
      withdrawal = withdrawal_fixture()
      assert {:ok, %Withdrawal{}} = Withdrawal.delete_withdrawal(withdrawal)
      assert_raise Ecto.NoResultsError, fn -> Withdrawal.get_withdrawal!(withdrawal.id) end
    end

    test "change_withdrawal/1 returns a withdrawal changeset" do
      withdrawal = withdrawal_fixture()
      assert %Ecto.Changeset{} = Withdrawal.change_withdrawal(withdrawal)
    end
  end
end
