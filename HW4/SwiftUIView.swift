//
//  ContentView.swift
//  HW4
//
//  Created by Флоранс on 31.01.2024.
//

import SwiftUI

struct ContentView: View {
    private let targetValue = 82
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            
            Button("Проверь меня!") {
                
            }
            
            Button("Начать заново") {
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
