//
//  ColorsDetailsVC.swift
//  RandomColorsApp
//
//  Created by Arman on 23.07.2023.
//

import UIKit

class ColorsDetailsVC: UIViewController {
    var color: UIColor?
    
    @IBOutlet weak var redColorValueSlider: UISlider!
    @IBOutlet weak var greenColorValueSlider: UISlider!
    @IBOutlet weak var blueColorValueSlider: UISlider!
    
    @IBOutlet weak var getRgbButton: UIButton!
    
    enum RGB {
        case R
        case G
        case B
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting background color as passed color
        view.backgroundColor = color ?? UIColor.black
        // Calling getRgb function for passed color to set sliders values as color RGB
        guard let gColor = color else {
            return
        }
        let rgb = getRgb(for: gColor)
        redColorValueSlider.value = Float(rgb.red)
        greenColorValueSlider.value = Float(rgb.green)
        blueColorValueSlider.value = Float(rgb.blue)
        // Setting button as selected so its tint color is not blue
        getRgbButton.isSelected = true
    }
    
    // Function to get Rgb and alpha values from passed color
    func getRgb(for color: UIColor) -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red: red, green: green, blue: blue, alpha: alpha)
    }
    
    // Function that sets new color for view.backgroundColor for RGB components by passed slider value
    func changeCurrentColorFor(component rgbOptions: RGB, by value: CGFloat) {
        // Since only one of the components are changing others can be retrieved by getRgb function
        guard let backgroundColor = view.backgroundColor else {
            return
        }
        let rgb = getRgb(for: backgroundColor)
        switch rgbOptions {
        case .R:
            view.backgroundColor = UIColor(red: value,
                            green: rgb.green,
                            blue: rgb.blue,
                            alpha: rgb.alpha)
        case .G:
            view.backgroundColor = UIColor(red: rgb.red,
                            green: value,
                            blue: rgb.blue,
                            alpha: rgb.alpha)
        case .B:
            view.backgroundColor = UIColor(red: rgb.red,
                            green: rgb.green,
                            blue: value,
                            alpha: rgb.alpha)
        }
    }
    
    // Function that changes view.backgroundColor based on red slider value
    @IBAction func redColorValueSliderChanged(_ sender: UISlider) {
        changeCurrentColorFor(component: .R, by: CGFloat(sender.value))
    }

    // Function that changes view.backgroundColor based on green slider value
    @IBAction func greenColorValueChanged(_ sender: UISlider) {
        changeCurrentColorFor(component: .G, by: CGFloat(sender.value))
    }
    
    // Function that changes view.backgroundColor based on blue slider value
    @IBAction func blueColorValueChanged(_ sender: UISlider) {
        changeCurrentColorFor(component: .B, by: CGFloat(sender.value))
    }
    
    // Function that is called when Get RGB button is pressed
    @IBAction func getRgbButtonPressed(_ sender: UIButton) {
        // Get RGB values for view.backgroundColor and show that information in alert
        guard let backgroundColor = view.backgroundColor else {
            return
        }
        let rgb = getRgb(for: backgroundColor)
        let alert = UIAlertController(title: "RGB Values",
                                      message: "Red: \(Int(rgb.red * 255)), Green: \(Int(rgb.green * 255)), Blue: \(Int(rgb.blue * 255))",
                                      preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: NSLocalizedString("OK", comment: "This closes alert"),
                style: .default
            )
        )

        self.present(alert, animated: true, completion: nil)
    }
}
