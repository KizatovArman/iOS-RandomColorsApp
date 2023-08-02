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
        view.backgroundColor = color ?? UIColor.black
        let rgb = getRgb(for: color ?? UIColor.black)
        redColorValueSlider.value = Float(rgb.red)
        greenColorValueSlider.value = Float(rgb.green)
        blueColorValueSlider.value = Float(rgb.blue)
        getRgbButton.tintColor = UIColor.black
        getRgbButton.backgroundColor = UIColor.clear
        getRgbButton.isSelected = true
    }
    
    func getRgb(for color: UIColor) -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red: red, green: green, blue: blue, alpha: alpha)
    }
    
    func changeCurrentColorFor(component rgbOptions: RGB, by value: CGFloat) {
        let rgb = getRgb(for: view.backgroundColor ?? UIColor.systemBackground)
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
    
    @IBAction func redColorValueSliderChanged(_ sender: UISlider) {
        changeCurrentColorFor(component: .R, by: CGFloat(sender.value))
    }

    @IBAction func greenColorValueChanged(_ sender: UISlider) {
        changeCurrentColorFor(component: .G, by: CGFloat(sender.value))
    }
    
    @IBAction func blueColorValueChanged(_ sender: UISlider) {
        changeCurrentColorFor(component: .B, by: CGFloat(sender.value))
    }
    
    @IBAction func getRgbButtonPressed(_ sender: UIButton) {
        let viewColor = view.backgroundColor ?? UIColor.black
        let rgb = getRgb(for: viewColor)
        let alert = UIAlertController(title: "RGB Values",
                                      message: "Red: \(Int(rgb.red * 255)), Green: \(Int(rgb.green * 255)), Blue: \(Int(rgb.blue * 255))",
                                      preferredStyle: .alert)
        
                alert.addAction(
                    UIAlertAction(
                        title: NSLocalizedString("OK", comment: "This closes alert"),
                        style: .default, handler:
                            {_ in NSLog("The \"OK\" alert occured.")}
                    )
                )

                self.present(alert, animated: true, completion: nil)
    }
}
