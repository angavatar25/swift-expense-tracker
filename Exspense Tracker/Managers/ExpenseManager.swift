//
//  ExpenseCounter.swift
//  Exspense Tracker
//
//  Created by Ananda Afryan on 05/04/24.
//

import Foundation

class ExpenseManager: ObservableObject {
    @Published var listOfExpense: [ExData] = [
        ExData(isIncome: false, exType: "groceries", exTitle: "Walmart", exAmount: 523),
        ExData(isIncome: false, exType: "airplane", exTitle: "Fly to Paris", exAmount: 1023),
        ExData(isIncome: true, exType: "money", exTitle: "Bank Transfer", exAmount: 123),
        ExData(isIncome: false, exType: "house", exTitle: "Tax Pay", exAmount: 1230),
    ]

    func countExpense(exItems: [ExData]) -> Int {
        var total = 0
        
        for exItem in exItems {
            if (exItem.isIncome == false) {
                total += exItem.exAmount
            }
        }
        
        return total
    }

    func createNewExpense(newData: ExData) {
        self.listOfExpense.append(newData)
        print(listOfExpense)
    }
}
