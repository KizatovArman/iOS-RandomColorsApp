//
//  ColorsDetailsVC.swift
//  RandomColorsApp
//
//  Created by Arman on 23.07.2023.
//

import UIKit

class ColorsDetailsVC: UIViewController {
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? UIColor.black
    }
}
