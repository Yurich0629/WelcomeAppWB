import Foundation

final class Bank {
    private var bankAccounts: [Account] = []
    
    func addAccount(_ account: Account) {
        bankAccounts.append(account)
    }
    
    func depositAccount(by account: Account, amount: Decimal) {
        account.deposit(amount)
    }
    
    func transfer(
        from fromAccount: Account,
        to toAccount: Account,
        amount: Decimal
    ) {
        print("Amount of accounts before transaction:")
        printInfo(fromAccount: fromAccount, toAccount: toAccount)
        
        guard fromAccount.withdraw(amount) else {
            print("Money is not enough for transfer!")
            return
        }
        
        toAccount.deposit(amount)
        print("The translation on \(amount) completed successfully!")
        print("Amount of accounts before transaction:")
        printInfo(fromAccount: fromAccount, toAccount: toAccount)
    }
    
    private func getAccount(by id: String) -> Account? {
        return bankAccounts.first { $0.id == id }
    }
    
    private func printInfo(
        fromAccount: Account? = nil,
        toAccount: Account? = nil
    ) {
        bankAccounts.forEach { account in
            let defaultInfo = "Account \(account.id) has \(account.balance)"
            let info = (account == fromAccount) ? "Sender -> \(defaultInfo)" :
                       (account == toAccount) ? "Receiver -> \(defaultInfo)" :
                       defaultInfo
            
            print(info)
        }
        print("\n")
    }
}

final class Account {
    let id: String
    var balance: Decimal
    
    init(id: String = UUID().uuidString, balance: Decimal) {
        self.id = id
        self.balance = balance
    }
    
    func deposit(_ amount: Decimal) {
        balance += amount
    }
    
    @discardableResult
    func withdraw(_ amount: Decimal) -> Bool {
        guard amount <= balance else { return false }
        balance -= amount
        return true
    }
}

extension Account: Equatable {
    static func == (lhs: Account, rhs: Account) -> Bool {
        lhs.id == rhs.id
    }
}

let bank = Bank()
let account1 = Account(balance: 1000)
let account2 = Account(balance: 1500)

bank.addAccount(account1)
bank.addAccount(account2)

bank.transfer(from: account1, to: account2, amount: 750)
