//
//  ContentView.swift
//  HW4
//
//  Created by Флоранс on 31.01.2024.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var currentValue = Float.random(in: 0...100).rounded()
    @State private var showAlert = false
    @State private var targetValue = Int.random(in: 0...100)
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            
            GameSliderView(currentValue: $currentValue, targetValue: targetValue, color: UIColor.red, alpha: computeScore())
            
            Button("Проверь меня!") {
                showAlert.toggle()
            }
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Your score"),
                message: Text(computeScore().formatted())
            )
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

#Preview {
    SwiftUIView()
}
