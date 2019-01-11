//
//  Balance.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 11..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

class Balance: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(balance, forKey: BalanceArchiveKey.balance)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        balance = aDecoder.decodeInteger(forKey: BalanceArchiveKey.balance)
    }
    
    private var balance: Int = 0
    
    func insert(money: Money) {
        self.balance += money.rawValue
    }
    
    func readBalance() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: self.balance as NSNumber) ?? ""
    }
    
    func pay(beverage: Beverage) {
        let pay: (Int, Int) -> Int = { (price: Int, balance: Int) -> Int in
                return balance - price
        }
        balance = beverage.pay(balance: balance, pay: pay)
    }
}
