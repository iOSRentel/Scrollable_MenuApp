//
//  Home.swift
//  Scrollable_MenuApp
//
//  Created by Boris Zinovyev on 05.02.2022.
//

import SwiftUI

struct Home: View {
    
    @State var currentTab = ""
// 4:01
    @Namespace var animation
// 5:15
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        
        VStack(spacing: 0) {
            VStack {
//MARK: - шапка
                HStack(spacing: 15) {
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                    }
                    
                    Text("McDonalds - Chinatown")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                    }
                }
                .foregroundColor(.primary)
                .padding(.horizontal)
                
//MARK: - Категории
                ScrollViewReader {proxy in
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 30) {
                            
                            ForEach(tabsItems) { tab in
                                
                                VStack {
                                    Text(tab.tab)
                                        .foregroundColor(currentTab == tab.id ? .black : .gray)
                                    
//                            Подчеркивание выбранной категории
                                    if currentTab == tab.id{
                                        Capsule()
                                            .fill(.black)
                                            .matchedGeometryEffect(id: "TAB", in: animation)
                                            .frame(height: 3)
                                            .padding(.horizontal, -10)
                                    } else {
                                        Capsule()
                                            .fill(.clear)
                                            .frame(height: 3)
                                            .padding(.horizontal, -10)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        currentTab = tab.id
                                        proxy.scrollTo(currentTab, anchor: .topTrailing)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                    }
                }
                .padding(.top)
            }
            .padding([.top])
//    Divider
            .background(scheme == .dark ? Color.black : Color.white)
            .overlay(
                Divider()
                    .padding(.horizontal, -15)
                ,alignment: .bottom
            )
            
//MARK: - MenuView
                ScrollView(.vertical, showsIndicators: false) {
                
                    ScrollViewReader {proxy in
                    
                        VStack(spacing: 15) {
                            ForEach(tabsItems) { tab in
// Menu CardView
                            MenuCardView(tab: tab)
                                
                        }
                    }
                    .padding([.horizontal,.bottom])
                }
            }
        }
// отображение первой категории
        .onAppear {
            currentTab = tabsItems.first?.id  ?? ""
        }
    }
}
