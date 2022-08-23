defmodule QuestionaireLive.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `QuestionaireLive.Accounts` context.
  """

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{
        account_number: "some account_number",
        balance: "some balance",
        currency: "some currency",
        user_id: 42
      })
      |> QuestionaireLive.Account.Accounts.create_account()

    account
  end

  @doc """
  Generate a account_transaction.
  """
  def account_transaction_fixture(attrs \\ %{}) do
    {:ok, account_transaction} =
      attrs
      |> Enum.into(%{
        account_id: 42,
        amount: "some amount",
        currency: "some currency",
        transaction_type: "some transaction_type"
      })
      |> QuestionaireLive.Account_transactions.Account_transaction.create_account_transaction()

    account_transaction
  end

  @doc """
  Generate a deposit.
  """
  def deposit_fixture(attrs \\ %{}) do
    {:ok, deposit} =
      attrs
      |> Enum.into(%{
        account_transaction_id: 42,
        amount: "some amount",
        msisdn: "some msisdn",
        # ref.no: "some ref.no"
      })
      |> QuestionaireLive.Deposits.Deposit.create_deposit()

    deposit
  end

  @doc """
  Generate a withdrawal.
  """
  def withdrawal_fixture(attrs \\ %{}) do
    {:ok, withdrawal} =
      attrs
      |> Enum.into(%{
        account_transaction_id: 42,
        amount: 42,
        msisdn: "some msisdn",
        reference_number: "some reference_number"
      })
      |> QuestionaireLive.Withdrawals.Withdrawal.create_withdrawal()

    withdrawal
  end
end
