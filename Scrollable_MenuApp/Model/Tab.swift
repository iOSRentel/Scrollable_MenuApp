//
//  Tab.swift
//  Scrollable_MenuApp
//
//  Created by Boris Zinovyev on 05.02.2022.
//

import SwiftUI

// Ассортимент
struct Tab: Identifiable {
    var id =  UUID().uuidString
    var tab: String
    var foods: [Food]
}

    var tabsItems = [
        Tab(tab: "Home style", foods: foods.shuffled()),
        Tab(tab: "Promotions", foods: foods.shuffled()),
        Tab(tab: "Snacks", foods: foods.shuffled()),
        Tab(tab: "McCafe", foods: foods.shuffled())
]

 

