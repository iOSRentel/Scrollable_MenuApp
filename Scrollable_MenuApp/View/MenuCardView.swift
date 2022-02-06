//
//  MenuCardView.swift
//  Scrollable_MenuApp
//
//  Created by Boris Zinovyev on 06.02.2022.
//

import SwiftUI

struct MenuCardView: View {
    
    var tab: Tab
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            Text(tab.tab)
                .font(.title.bold())
                .padding(.vertical)
            
            ForEach(tab.foods) { food in
//MARK: - FoodView
                HStack(spacing: 15) {
                    
                    VStack(alignment: .leading, spacing: 10) {
// Название блюда
                        Text(food.title)
                            .font(.title3.bold())
// Описание
                        Text(food.description)
                            .font(.caption)
                            .foregroundColor(.gray)
// Цена
                        Text("Price: \(food.price)")
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
// Картинка
                        Image(food.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75, height: 75)
                            .cornerRadius(10)
                }
            }
        }
    }
}

