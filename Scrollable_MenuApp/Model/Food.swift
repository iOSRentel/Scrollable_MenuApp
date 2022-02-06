//
//  Food.swift
//  Scrollable_MenuApp
//
//  Created by Boris Zinovyev on 06.02.2022.
//

import SwiftUI

struct Food: Identifiable {
    var id = UUID().uuidString
    var title: String
    var description: String
    var price: String
    var image: String
}
// Еда
    var foods = [
        Food(title: "Super Burger", description: "Mixed with greese - olive oil and chips", price: "$14", image: "Burger"),
//        Food(title: "Pepperoni", description: "Mixed with greese - olive oil and chips", price: "$10", image: "Pepperoni"),
        Food(title: "Quatroporte", description: "Mixed with greese - olive oil and chips", price: "$22", image: "Quatroporte"),
        Food(title: "Fish & Chips", description: "Mixed with greese - olive oil and chips", price: "$16", image: "Fish & Chips"),
        Food(title: "Hot Dog", description: "Mixed with greese - olive oil and chips", price: "$15", image: "Hot Dog"),
        Food(title: "Cezar salad", description: "Mixed with greese - olive oil and chips", price: "$13", image: "Cezar salad")
]
