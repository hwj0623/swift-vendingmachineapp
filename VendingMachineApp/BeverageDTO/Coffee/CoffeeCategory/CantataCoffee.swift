//
//  Cantata.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


class CantataCoffee: Coffee{
    private (set) var model : String
    
    init(
            brand: String,
            quantity: Int,
            price: Int,
            name: String,
            date: Date,
            coffeine: Double = 100.0,
            bean: CoffeeBean = CoffeeBean.arabica,
            model: String = "1Bean",
            calorySet: CaloryElements,
            temperature: Double
        ){
        self.model = model
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date, coffeine: coffeine, bean: bean, calorySet: calorySet, temp: temperature)
    }
    
    private enum CodingKeys: String, CodingKey {
        case model
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        model = try container.decode(String.self, forKey: .model)
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
}
