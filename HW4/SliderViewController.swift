//
//  SliderViewController.swift
//  HW4
//
//  Created by Флоранс on 01.02.2024.
//

import SwiftUI

class SliderViewController: UIViewController {
    let slider = UISlider()
    //let widthOfSlider: Int

    override func viewDidLoad() {
        super.viewDidLoad()
        createCustomSlider()
    }
    
    func createCustomSlider() {
        slider.center = self.view.center
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.setValue(0, animated: true)
        slider.thumbTintColor = .red
        //slider.isContinuous = false
        slider.addTarget(self, action: #selector(changeVlaue(_:)), for: .valueChanged)
        
        let minLabel = UILabel()
        minLabel.text = slider.minimumValue.formatted()
        
        let maxLabel = UILabel()
        maxLabel.text = slider.maximumValue.formatted()
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 30, height: 20)
        stackView.addArrangedSubview(minLabel)
        stackView.addArrangedSubview(slider)
        stackView.addArrangedSubview(maxLabel)
        
        self.view.addSubview(stackView)
        
//        NSLayoutConstraint.activate([
//            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            stackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 10),
//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
    }

    @objc func changeVlaue(_ sender: UISlider) {
        print("value is" , Int(sender.value))
    }
    
}

struct SliderViewControllerRepresentation: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return SliderViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

#Preview {
    SliderViewControllerRepresentation()
}
