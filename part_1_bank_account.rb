puts '-' * 10
puts '-' * 10



class BankAccount

  @@interest_rate = 0.22
  @@accounts = []

  def initialize
    @balance = 15
  end

  def self.create
    @@accounts << BankAccount.new
    # new_account = BankAccount.new
    # @@accounts << new_account
    # return new_account
  end

  def self.accounts_reader
    @@accounts
  end

  def self.interest_reader
    @@interest_rate
  end

  def self.total_funds
    summer = 0
    @@accounts.each do |account|
      summer += account.reader_balance
    end
    return summer
  end

  def self.interest_time
    @@accounts.each do |account|
      # interest = @balance * interest_reader
      # account.deposit_balance(interest)
      account.deposit_balance(account.reader_balance * @@interest_rate)
    end
  end



  def reader_balance
    @balance
  end

  def deposit_balance(deposit)
    @balance += deposit
  end

  def withdrawel_balance(withdrawel)
    @balance -= withdrawel
  end
end



BankAccount.create
BankAccount.create
BankAccount.create


puts BankAccount.total_funds

BankAccount.interest_time

puts BankAccount.total_funds





puts '-' * 10
puts '-' * 10
