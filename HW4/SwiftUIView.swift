//
//  ContentView.swift
//  HW4
//
//  Created by Флоранс on 31.01.2024.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var opacity = 1.0
    @State private var currentValue = Float.random(in: 0...100).rounded()
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                CustomSlider(opacity: $opacity, currentValue: $currentValue)
                    .onChange(of: currentValue) {
                        computeOpacity()
                    }
                Text("100")
            }
            
            Button("Проверь меня!") {
                showAlert.toggle()
            }
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
                //print("current value is: \(currentValue) \n and score is: \(computeScore()) \n and target is: \(targetValue)")
                computeOpacity()
            }
        }
        .onAppear {
            computeOpacity()
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
    
    private func computeOpacity() {
        opacity = Double(computeScore())/100
        //print("opacity is: \(opacity)\n-----")
    }
    
}

#Preview {
    SwiftUIView()
}
