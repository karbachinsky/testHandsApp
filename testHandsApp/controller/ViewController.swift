//
//  ViewController.swift
//  testHandsApp
//
//  Created by bekray on 25.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTable: UITableView!
    
    private var model = MainModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor(named: "bgFirstColor")?.cgColor ?? UIColor.purple.cgColor, UIColor.black.cgColor]
        view.layer.insertSublayer(layer, at: 0)
        
        //
        
        mainTable.delegate = self
        mainTable.dataSource = self
        
        mainTable.separatorStyle = .none
    }

    @IBAction func createCellButtonAction(_ sender: Any) {
        model.content()
        mainTable.reloadData()
        
        let indexPath = NSIndexPath(row: model.count - 1, section: 0)
        mainTable.scrollToRow(at: indexPath as IndexPath, at: .bottom, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellContent = model.getCellContent(index: indexPath.row) else {
            return UITableViewCell()
        }
        
        if let cell = mainTable.dequeueReusableCell(withIdentifier: "mainCell") as? MainTableCell {
            cell.setup(data: cellContent)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}
