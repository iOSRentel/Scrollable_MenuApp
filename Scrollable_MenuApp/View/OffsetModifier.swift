//
//  OffsetModifier.swift
//  Scrollable_MenuApp
//
//  Created by Boris Zinovyev on 06.02.2022.
//

import SwiftUI

struct OffsetModifier: ViewModifier {
    
    var tab: Tab
    @Binding var currentTab: String
    
    func body(content: Content) -> some View {
        
        content
//      ошибка на 10 05
            .overlay(
                GeometryReader { proxy in
                  
                    Color.clear
                        .preference(key: OffsetKey.self, value: proxy.frame(in: .named("SCROLL")))
                    }
                )
//       10:04, 10 59
            .onPreferenceChange(OffsetKey.self) { proxy in
//                print(proxy.minY)
                let offset = proxy.minY
                    
                withAnimation(.easeInOut) {
                    currentTab = (offset < 20 && -offset < (proxy.midX / 2) && currentTab != tab.id) ? "\(tab.id) SCROLL" : currentTab
                    }
                }
            }
        }

//Preference Key
struct OffsetKey: PreferenceKey {
    
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
