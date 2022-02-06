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
//                                        .foregroundColor(currentTab == tab.id ? .black : .gray)
//                       12 04
                                        .foregroundColor(currentTab.replacingOccurrences(of: " SCROLL", with: "") == tab.id ? .black : .gray)
                                    
//                            Подчеркивание выбранной категории
//                                    if currentTab == tab.id{
//                        11 58
                                    if currentTab.replacingOccurrences(of: " SCROLL", with: "") == tab.id{

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
//                               как было
//                                    withAnimation(.easeInOut) {
//                                        currentTab = tab.id
//                                        proxy.scrollTo(currentTab, anchor: .topTrailing)
//                              12 36 как стало
                                    withAnimation(.easeInOut) {
                                        currentTab = "\(tab.id) TAP"
                                        proxy.scrollTo(currentTab.replacingOccurrences(of: " Tap", with: ""), anchor: .topTrailing)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                    }
                    
//MARK: - 13 22
                    .onChange(of: currentTab) { _ in
                        if currentTab.contains(" SCROLL") {
                            withAnimation(.easeInOut) {
                            proxy.scrollTo(currentTab.replacingOccurrences(of: " SCROLL", with: ""), anchor: .topTrailing)
                            }	
                        }
                    }
                    
// MARK: - продолжение Категорий
                }
                .padding(.top)
            }
            .padding([.top])
//    Divider
            .background(scheme == .dark ? Color.black : Color.white)
// Убрал сам потому что в этом коде нет смысла
//            .overlay(
//                Divider()
//                    .padding(.horizontal, -15)
//                ,alignment: .bottom
//            )
            
//MARK: - MenuView
                ScrollView(.vertical, showsIndicators: false) {
                
                    ScrollViewReader {proxy in
                    
                        VStack(spacing: 15) {
                            ForEach(tabsItems) { tab in
// Menu CardView
                                MenuCardView(tab: tab, currentTab: $currentTab)
                                .padding(.top)
                        Divider()
                            .frame(height: 10 )
                                
                        }
                    }
                    .padding([.horizontal,.bottom])
//     8:12 поиск по ID
                    .onChange(of: currentTab) { newValue in
                        
//    scrolling
//                   как было
//                        withAnimation(.easeInOut) {
//                            proxy.scrollTo(currentTab, anchor: .topTrailing)
//                        }
//                как стало 12 52
                        if currentTab.contains(" TAP") {
                            withAnimation(.easeInOut) {
                                proxy.scrollTo(currentTab.replacingOccurrences(of: " TAP", with: ""), anchor: .topTrailing)
                            }
                        }
                    }
                }
            }
//  9:41 координаты для Scroll (Offset)
                .coordinateSpace(name: "SCROLL")
        }
// отображение первой категории
        .onAppear {
            currentTab = tabsItems.first?.id  ?? ""
        }
    }
}
