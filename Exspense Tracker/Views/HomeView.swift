//
//  HomeView.swift
//  Exspense Tracker
//
//  Created by Ananda Afryan on 19/03/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var expenseManager = ExpenseManager()
    
    @State private var showAddExpenseSheet: Bool = false

    var body: some View {
        let lightPurple = Color(red: 128/255.0, green: 72/255.0, blue: 207/255.0)
        let darkPurple = Color(red: 97/255.0, green: 58/255.0, blue: 191/255.0)
        
        let totalExpense = expenseManager.countExpense(exItems: ExpenseData)

        VStack {
            LinearGradient(gradient: Gradient(colors: [darkPurple, lightPurple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    VStack {
                        HStack() {
                            Spacer()
                            Button(action: {
                                showAddExpenseSheet = true
                            }) {
                                HStack {
                                    Image(systemName: "plus.circle.fill")
                                        .font(.system(size: 15))
                                    Text("Add")
                                        .fontWeight(.bold)
                                }.padding(10)
                                    .sheet(isPresented: $showAddExpenseSheet) {
                                        AddNewExpense(expenseManager: expenseManager, isSheetPresented: $showAddExpenseSheet)
                                    }
                            }
                        }.padding(.horizontal, 30)
                        VStack(spacing: 12) { //current balance section
                            Text("Current Balance")
                                .textCase(.uppercase)
                                .font(.system(size: 12))
                            Text("$32,465")
                                .font(.largeTitle)
                            Text("March 2024")
                                .font(.system(size: 14))
                        }
                        HStack {
                            HStack(alignment: .firstTextBaseline) {
                                ZStack {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 20, height: 20)
                                    Image(systemName: "arrow.down.backward")
                                        .font(.system(size: 10))
                                        .foregroundColor(.green)
                                }.shadow(radius: 10)
                                VStack(alignment: .leading) {
                                    Text("Income")
                                        .textCase(.uppercase)
                                        .font(.system(size: 11))
                                    Text("$42.500")
                                        .textCase(.uppercase)
                                }
                            }
                            Spacer()
                            HStack(alignment: .firstTextBaseline) {
                                ZStack {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 20, height: 20)
                                    Image(systemName: "arrow.up.forward")
                                        .font(.system(size: 10))
                                        .foregroundColor(.red)
                                }.shadow(radius: 10)
                                VStack(alignment: .leading) {
                                    Text("Expense")
                                        .textCase(.uppercase)
                                        .font(.system(size: 11))
                                    Text("$\(totalExpense)")
                                        .textCase(.uppercase)
                                }
                            }
                        }
                        .padding(.top, 50)
                        .padding(.horizontal, 30)
                    }
                )
                .frame(maxHeight: 250)
                .foregroundColor(.white)
            if ExpenseData.count > 0 {
                ScrollView {
                    VStack {
                        ForEach(expenseManager.listOfExpense) {data in
                            ExpenseCard(
                                isIncome: data.isIncome,
                                exType: data.exType,
                                exTitle: data.exTitle,
                                exAmount: data.exAmount
                            )
                        }
                    }.padding()
                }
            } else {
                VStack {
                    Spacer()
                    Image(systemName: "multiply.circle")
                        .font(.system(size: 50))
                        .foregroundColor(Color.red)
                        .padding(.bottom, 10)
                    Text("No expense added")
                        .font(.system(size: 15))
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct AddNewExpense: View {
    @ObservedObject var expenseManager: ExpenseManager

    @State private var expenseTitle: String = ""
    @State private var expenseItem: String = ""
    
    @State private var expenseAmount: Int = 0
    
    @State private var showExpenseCategory: Bool = false

    @Binding var isSheetPresented: Bool
    
    func itemOnTap(item: String) {
        isSheetPresented = false
    }

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
                        .foregroundColor(Color.black)
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Expense Amount")
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                    TextField("Expense Amount", value: $expenseAmount, formatter: NumberFormatter())
                        .padding(10)
                        .background(Color.white)
                        .border(Color.gray, width: 1)
                        .font(.system(size: 16))
                        .foregroundColor(Color.black)
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
                        .foregroundColor(Color.black)
                        .onTapGesture {
                            showExpenseCategory = true
                        }
                }
                .sheet(isPresented: $showExpenseCategory) {
                    SheetView(isSheetPresented: $showExpenseCategory, currentItem: $expenseItem)
                }
                Button(action: {
                    expenseManager.createNewExpense(newData: ExData(isIncome: false, exType: expenseItem, exTitle: expenseTitle, exAmount: expenseAmount))
                    isSheetPresented = false
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

struct SheetView: View {
    @Binding var isSheetPresented: Bool
    @Binding var currentItem: String

    let items = ["Groceries", "Airplane", "Money", "Clothes", "House"]
    
    func itemOnTap(item: String) {
        currentItem = item
        isSheetPresented = false
    }

    var body: some View {
        VStack {
            List(items, id: \.self) { item in
                Text(item)
                    .onTapGesture {
                        itemOnTap(item: item)
                    }
                    .foregroundColor(Color.black)
            }
        }
    }
}

#Preview {
    HomeView()
}
