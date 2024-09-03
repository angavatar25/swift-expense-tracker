//
//  ExpenseCard.swift
//  Exspense Tracker
//
//  Created by Ananda Afryan on 19/03/24.
//

import SwiftUI

struct ExpenseCard: View {
    let isIncome: Bool
    
    let exType: String
    let exTitle: String
    let exAmount: Int

    let orangeBackground = Color(red: 255/255.0, green: 243/255.0, blue: 221/255.0)
    let shadowBg = Color(red: 223/255.0, green: 223/255.0, blue: 223/255.0)
    
    let expenseType: [String: String] = [
        "airplane": "airplane",
        "groceries": "cart.fill",
        "money": "dollarsign.circle",
        "clothes": "tshirt",
        "house": "house"
    ]
    
    let expenseBg: [String: Color] = [
        "airplane": Color(red: 255/255.0, green: 243/255.0, blue: 221/255.0),
        "groceries": Color(red: 228/255.0, green: 225/255.0, blue: 250/255.0),
        "money": Color(red: 215/255.0, green: 246/255.0, blue: 239/255.0),
        "clothes": Color(red: 224/255.0, green: 233/255.0, blue: 254/255.0),
        "house": Color(red: 250/255.0, green: 235/255.0, blue: 248/255.0)
    ]
    
    let expensiveForeground: [String: Color] = [
        "airplane": Color.orange,
        "groceries": Color.purple,
        "money": Color.green,
        "clothes": Color.blue,
        "house": Color.pink
    ]

    init(isIncome: Bool, exType: String, exTitle: String, exAmount: Int) {
        self.isIncome = isIncome
        self.exType = exType
        self.exTitle = exTitle
        self.exAmount = exAmount
    }

    var body: some View {
        VStack {
            Button(action: {
                print("Button tapped")
            }) {
                HStack(spacing: 15) {
                    VStack {
                        ZStack {
                            Circle()
                                .fill(expenseBg[exType] ?? orangeBackground)
                                .frame(width: 40, height: 40)
                            Image(systemName: expenseType[exType] ?? "")
                                .font(.system(size: 15))
                                .foregroundColor(expensiveForeground[exType] ?? Color.orange)
                        }
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        Text(exTitle.count > 0 ? exTitle : "")
                        Text("May 12 at 9:30PM")
                            .font(.system(size: 12))
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                    HStack(spacing: 5) {
                        Text("\(isIncome ? "+" : "-")")
                        Text("\(exAmount > 0 ? exAmount : 0)")
                    }
                        .font(.system(size: 20))
                        .foregroundStyle(isIncome ? Color.green : Color.red)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 6)
                                .fill(Color.white)
                                .shadow(color: shadowBg, radius: 4, x: 0, y: 0)
                )
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(.black)
            .background(Color.white)
        }
    }
}

#Preview {
    ExpenseCard(isIncome: false, exType: "groceries", exTitle: "Fly to paris", exAmount: 500)
}
