//
//  ListOfHistoryView.swift
//  Exspense Tracker
//
//  Created by Ananda Afryan on 16/04/24.
//

import SwiftUI

struct ListOfHistoryView: View {
    var body: some View {
        let ExpenseData: [ExData] = [
            ExData(isIncome: false, exType: "groceries", exTitle: "Walmart", exAmount: 523),
            ExData(isIncome: false, exType: "airplane", exTitle: "Fly to Paris", exAmount: 1023),
            ExData(isIncome: true, exType: "money", exTitle: "Bank Transfer", exAmount: 123),
            ExData(isIncome: false, exType: "house", exTitle: "Tax Pay", exAmount: 1230),
        ]
        ScrollView {
            VStack {
                ForEach(ExpenseData) {data in
                    ExpenseCard(
                        isIncome: data.isIncome,
                        exType: data.exType,
                        exTitle: data.exTitle,
                        exAmount: data.exAmount
                    )
                }
            }.padding()
        }
    }
}

#Preview {
    ListOfHistoryView()
}
