//
//  CustomSlider.swift
//  HW4
//
//  Created by Флоранс on 01.02.2024.
//

import SwiftUI

struct CustomSlider: UIViewRepresentable {
    @Binding var currentValue: Float
    
    let alpha: Int
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeValue),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = currentValue
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(CGFloat(alpha)/100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }

}

extension CustomSlider {
    final class Coordinator: NSObject {
        @Binding var currentValue: Float
        
        init(currentValue: Binding<Float>) {
            self._currentValue = currentValue
        }
        
        @objc func changeValue(_ sender: UISlider) {
            currentValue = sender.value
        }
    }
}

#Preview {
    CustomSlider(currentValue: .constant(0), alpha: 100, color: .red)
}
