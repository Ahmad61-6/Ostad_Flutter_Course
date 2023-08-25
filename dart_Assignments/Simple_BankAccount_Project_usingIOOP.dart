/*Define an abstract class Account with the following properties:
●       accountNumber (integer)
●       balance (double)


It should also have the following methods:
●       deposit(double amount): Adds the specified amount to the account balance.
●       withdraw(double amount): Abstract method that deducts the specified amount from the account balance.


Define a class SavingsAccount that extends the Account class. It should have an additional property called interestRate (double).
Implement the withdraw() method in the SavingsAccount class as follows:
●       Subtract the specified amount from the account balance.
●       Apply the interest rate to the remaining balance.


Define a class CurrentAccount that extends the Account class. It should have an additional property called overdraftLimit (double).
Implement the withdraw() method in the CurrentAccount class as follows:
●       Allow withdrawals up to the overdraft limit.
●       If the withdrawal amount exceeds the overdraft limit, print a message indicating insufficient funds.


In main()

●       Create an instance of the SavingsAccount class by providing values for the account number, initial balance, and interest rate.
●       Use the instance to perform operations like depositing and withdrawing money.
●       Create an instance of the CurrentAccount class by providing values for the account number, initial balance, and overdraft limit.
●       Use the instance to perform operations like depositing and withdrawing.
*/


// Define the abstract Account class
abstract class Account {
  late int accountNo;
  double _accountBalance = 0.0;

  // Use a getter for balance instead of a private variable
  double get getBalance => _accountBalance;

  // Use a protected method to set the balance
  void _setBalance(double amount) {
    if(amount<0){
      _accountBalance =0.0;
    }
    else {
      _accountBalance = amount;
    }
  }

  // Define the deposit method
  void deposit(double amount) {
    print("Depositing Amount : $amount tk");
    _setBalance(getBalance + amount);
    print("Deposit Successful\nAfter Deposit");
  }

  // Define the abstract withdraw method
  void withdraw(double amount);
}

// Define the SavingsAccount class
class SavingsAccount extends Account {
  double interestRate ;

  SavingsAccount({required accountNo, required this.interestRate});
  @override
  void withdraw(double amount) {
    if(amount>getBalance){
      print("Insufficient Balance");
    }
    else {
      print("Withdrawing amount : $amount tk");
      _setBalance(getBalance - amount);
      print("Withdrawal Successful");
      print("Applying interest rate $interestRate% = ${getBalance * (interestRate / 100)} to remaining balance : $getBalance tk");
      _setBalance(getBalance+getBalance * (interestRate / 100));
      print("Saving account current balance: $getBalance tk");

    }
  }
}

// Define the CurrentAccount class
class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount({required accountNo,required this.overdraftLimit}) ;

  @override
  void withdraw(double amount) {
    print("Withdrawing amount : $amount tk");
    if (amount <= getBalance + overdraftLimit) {
      _setBalance(getBalance - amount);
      print('Withdrawal Successful');
    } else {
      print('Insufficient funds for withdrawal');
    }
  }
}

void main() {
  SavingsAccount savings = SavingsAccount(interestRate: 5, accountNo: 1234);
  print('Savings Account Balance: ${savings.getBalance} tk.');
  savings.deposit(1000);
  print("Savings Account Balance: ${savings.getBalance} tk");
  savings.withdraw(200);

  CurrentAccount current = CurrentAccount(overdraftLimit: 500, accountNo: 12345);
  print('\nCurrent Account Balance: ${current.getBalance} tk. , OverdraftLimit : ${current.overdraftLimit} tk.');
  current.deposit(1500);
  print("CurrentAccount Balance: ${current.getBalance}tk.");
  current.withdraw(2000);
  print("Current Balance after withdrawal: ${current.getBalance}tk.");
}


