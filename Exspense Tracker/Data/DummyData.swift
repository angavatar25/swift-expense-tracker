//
//  DummyData.swift
//  Exspense Tracker
//
//  Created by Ananda Afryan on 03/09/24.
//

import Foundation

struct CategoryModel: Identifiable {
    var id = UUID()
    let categoryName: String
    let categoryIcon: String
}

struct ExData: Identifiable {
    var id = UUID()
    let isIncome: Bool
    let exType: String
    let exTitle: String
    let exAmount: Int
}

let CategoryData: [CategoryModel] = [
    CategoryModel(categoryName: "Groceries", categoryIcon: "cart.fill"),
    CategoryModel(categoryName: "Airplane", categoryIcon: "airplane"),
    CategoryModel(categoryName: "Money", categoryIcon: "dollarsign.circle"),
    CategoryModel(categoryName: "Clothes", categoryIcon: "tshirt"),
    CategoryModel(categoryName: "House", categoryIcon: "house"),
];

let ExpenseData: [ExData] = [
    ExData(isIncome: false, exType: "groceries", exTitle: "Walmart", exAmount: 523),
    ExData(isIncome: false, exType: "airplane", exTitle: "Fly to Paris", exAmount: 1023),
    ExData(isIncome: true, exType: "money", exTitle: "Bank Transfer", exAmount: 123),
    ExData(isIncome: false, exType: "house", exTitle: "Tax Pay", exAmount: 1230),
]
