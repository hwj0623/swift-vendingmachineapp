//
//  History.swift
//  VendingMachine
//
//  Created by 윤지영 on 18/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class History: NSObject {
    private var purchases: [Beverage]

    init(purchases: [Beverage]) {
        self.purchases = purchases
    }

    convenience override init() {
        self.init(purchases: [])
    }

    var count: Int {
        return purchases.count
    }

    func update(purchase beverage: Beverage) {
        purchases.append(beverage)
    }

    func isEmpty() -> Bool {
        return purchases.isEmpty
    }

    func showList(with show: (Int, String) -> Void) {
        for (index, purchase) in purchases.enumerated() {
            show(index + 1, purchase.title)
        }
    }

    static func == (lhs: History, rhs: History) -> Bool {
        return lhs.purchases == rhs.purchases
    }

    /* MARK: NSSecureCoding */
    private struct Default {
        static let purchases = [Beverage]()
    }

    required init?(coder aDecoder: NSCoder) {
        let purchases = aDecoder
            .decodeObject(forKey: Keys.purchases) as? [Beverage] ?? Default.purchases
        self.purchases = purchases
    }

}

extension History: NSSecureCoding {

    private enum Keys {
        static let purchases = "purchases"
    }

    static var supportsSecureCoding: Bool {
        return true
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(purchases, forKey: Keys.purchases)
    }

}
