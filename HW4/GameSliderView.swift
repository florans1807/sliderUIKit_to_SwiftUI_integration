//
//  GameSliderView.swift
//  HW4
//
//  Created by Флоранс on 02.02.2024.
//

import SwiftUI

struct GameSliderView: View {
    @Binding var currentValue: Float
    
    let targetValue: Int
    let color: UIColor
    let alpha: Int
    
    var body: some View {
        HStack {
            Text("0")
            CustomSlider(currentValue: $currentValue, alpha: alpha, color: UIColor.red)
            Text("100")
        }
    }
}

#Preview {
    GameSliderView(currentValue: .constant(50), targetValue: 82, color: UIColor.red, alpha: 100)
}
