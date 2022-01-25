//
//  ViewController.swift
//  testHandsApp
//
//  Created by bekray on 25.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTable: UITableView!
    
    let cellsContent = [
        MainCellModel(image: "ic.deadCell", status: "Мёртвая", clarification: "или прикидывается"),
        MainCellModel(image: "ic.liveCell", status: "Живая", clarification: "и шевелится!"),
        MainCellModel(image: "ic.lifeCell", status: "Жизнь", clarification: "Ку-ку!")
    ]
    
    var cells = [Int]() // Для заполнения таблицы по типам ячеек (для удобства можно будет сделать с enum)
    
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
        var newCellType = Int(arc4random_uniform(2))
        
        if cells.count >= 3 && cells[cells.count - 1] == cells[cells.count - 2] && cells[cells.count - 2] == cells[cells.count - 3] {
            if cells[cells.count - 1] == 1 { // Если трижды подряд создалась живая клетка
                newCellType = 2
            } else if cells[cells.count - 1] == 0 { // Если трижды подряд родилась мёртвая клетка
                if let row = cells.reversed().firstIndex(where: {$0 == 2}) {
                    cells[row.base - 1] = 0
                }
            }
        }
        
        cells.append(newCellType)
        mainTable.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let typeIndex = cells[indexPath.row]
        if let cell = mainTable.dequeueReusableCell(withIdentifier: "mainCell") as? MainTableCell {
            cell.setup(data: cellsContent[typeIndex])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}
