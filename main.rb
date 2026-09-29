class BankAccount
  attr_accessor :name, :balance, :cars

  def initialize(name, balance, cars = [])
    @name = name
    @balance = balance
    @cars = cars
  end

  def user_data
    puts "Account data"
    puts "Owner name: ", self.name
    puts "Balance: ", self.balance
    print "Cars: ", self.cars, "\n", "\n"
  end

  def withdraw(amount)
    if self.balance > 0 && self.balance > amount
      self.balance -= amount
    else
      puts "Your balance is too low"
    end
  end

  def deposit(amount)
    self.balance += amount
  end

  def add_car(car)
    cars << car
  end
end


class Car
  attr_accessor :brand, :color, :price, :owner

  def initialize(brand, color, price, owner = "")
    @brand = brand
    @color = color
    @price = price
    @owner = owner
  end

  def buy_car(account, new_owner)
    if account.balance >= price
      account.withdraw(price)
      account.add_car(self.brand)
      self.owner = new_owner
      puts "#{self.owner} bought a #{brand}!"
    else
      puts "Your balance is too low"
    end

    account
  end
end

# Create accounts
elia_account = BankAccount.new("Elia", 1_000_000)
dimo_account = BankAccount.new("Dimo", 10_000_000_000)

# Create cars
car1 = Car.new("Opel", "Red", 100_000)
car2 = Car.new("Ferrari", "Red", 200_000)
car3 = Car.new("Land Rover", "Black", 100_000)
car4 = Car.new("Lamborghini", "Red", 250_000)
car5 = Car.new("Opel", "Red", 100_000)


# Buy cars
car1.buy_car(elia_account, elia_account.name)
car2.buy_car(elia_account, elia_account.name)
car3.buy_car(elia_account, elia_account.name)
car4.buy_car(elia_account, elia_account.name)
car5.buy_car(dimo_account, dimo_account.name)

# Display bank data
elia_account.user_data
dimo_account.user_data