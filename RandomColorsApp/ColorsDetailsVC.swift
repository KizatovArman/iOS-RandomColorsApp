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
    
    enum RGB {
        case R
        case G
        case B
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? UIColor.black
    }
    
    func getRgb(for color: UIColor) -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red: red, green: green, blue: blue, alpha: alpha)
    }
    
    func changeCurrentColorBy(component rgbOptions: RGB, by value: CGFloat) {
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
        changeCurrentColorBy(component: .R, by: CGFloat(sender.value))
    }

    @IBAction func greenColorValueChanged(_ sender: UISlider) {
        changeCurrentColorBy(component: .G, by: CGFloat(sender.value))
    }
    
    @IBAction func blueColorValueChanged(_ sender: UISlider) {
        changeCurrentColorBy(component: .B, by: CGFloat(sender.value))
    }
}
