//
//  MainCellModel.swift
//  testHandsApp
//
//  Created by bekray on 25.01.2022.
//

import Foundation

struct MainCellModel {
    var image = ""
    var status = ""
    var clarification = ""
}

class MainModel {
    
    private let cellsContent = [
        MainCellModel(image: "ic.deadCell", status: "Мёртвая", clarification: "или прикидывается"),
        MainCellModel(image: "ic.liveCell", status: "Живая", clarification: "и шевелится!"),
        MainCellModel(image: "ic.lifeCell", status: "Жизнь", clarification: "Ку-ку!")
    ]
    
    private var cells = [Int]()
    
    var count: Int {
        get {
            cells.count
        }
    }
    
    func content() {
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
    }
    
    func getCellContent(index: Int) -> MainCellModel? {
        if cells.count > index && index >= 0 {
            let cellContentIndex = cells[index]
            return cellsContent[cellContentIndex]
        } else {
            return nil
        }
    }
    
}
