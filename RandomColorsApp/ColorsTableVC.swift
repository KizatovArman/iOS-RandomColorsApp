//
//  ColorsTableVC.swift
//  RandomColorsApp
//
//  Created by Arman on 23.07.2023.
//

import UIKit

class ColorsTableVC: UIViewController {
    var colors: [UIColor] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var regenerateColorsButton: UIBarButtonItem!
    
    enum Cells {
        static let colorCell = "ColorCell"
    }
    
    enum Segues {
        static let toDetailVC = "ToColorsDetailsVC"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
    }
    
    func addRandomColors() {
        for _ in 0..<50 {
            colors.append(.random())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailsVC
        destVC.color = sender as? UIColor
    }
    
    @IBAction func rightBarButtonItemTapped(_ sender: UIBarButtonItem) {
        colors.removeAll()
        addRandomColors()
        tableView.reloadData()
    }
}

/*
 Concept of delegate: there is a function that
 sits and waits for action, when it happens it performs.
 */
extension ColorsTableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) else {
            return UITableViewCell()
        }
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: Segues.toDetailVC, sender: color)
    }
}
