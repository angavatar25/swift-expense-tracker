//
//  AddNewExpenseView.swift
//  Exspense Tracker
//
//  Created by Ananda Afryan on 26/03/24.
//

import SwiftUI

struct AddNewExpenseView: View {
    @StateObject private var expenseManager = ExpenseManager()

    @State private var expenseTitle: String = ""
    @State private var expenseItem: String = ""
    
    @State private var expenseAmount: Int = 0
    
    @State private var showExpenseCategory: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Expense Title")
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                    TextField("Expense Title", text: $expenseTitle)
                        .padding(10)
                        .background(Color.white)
                        .border(Color.gray, width: 1)
                        .font(.system(size: 16))
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Expense Title")
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                    TextField("Expense Amount", value: $expenseAmount, formatter: NumberFormatter())
                        .padding(10)
                        .background(Color.white)
                        .border(Color.gray, width: 1)
                        .font(.system(size: 16))
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Expense Item")
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                    TextField("Choose expense item", text: $expenseItem)
                        .padding(10)
                        .background(Color.white)
                        .border(Color.gray, width: 1)
                        .font(.system(size: 16))
                        .onTapGesture {
                            showExpenseCategory = true
                        }
                }
                .sheet(isPresented: $showExpenseCategory) {
                    SheetView(isSheetPresented: $showExpenseCategory, currentItem: $expenseItem)
                }
                Button(action: {
                   
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 15))
                        Text("Save")
                            .fontWeight(.bold)
                    }.padding(10)
                }
                .background(self.expenseItem.count > 0 && self.expenseItem.count > 0 && self.expenseAmount > 0 ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
                .disabled(self.expenseItem.count < 1 && self.expenseItem.count < 1 && self.expenseAmount == 0 ? true : false)
                Spacer()

            }
            .navigationTitle("New Expense")
            .padding()
        }
    }
}


//#Preview {
//    AddNewExpenseView()
//}
