
class Transfer
  # code here
  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender_account, receiver_account, amount)
    @sender = sender_account
    @receiver = receiver_account
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction

    if !(@status == "complete") && self.both_valid? && sender.balance > amount
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if @status == "complete"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      @status = "reversed"
    end
  end


end