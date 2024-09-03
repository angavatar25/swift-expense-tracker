//
//  TransactionHistoryCard.swift
//  Exspense Tracker
//
//  Created by Ananda Afryan on 16/04/24.
//

import SwiftUI

struct TransactionHistoryCard: View {
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline, spacing: 18) {
                Circle()
                    .fill(Color.red)
                    .frame(width: 10, height: 10)
                VStack(alignment: .leading, spacing: 10) {
                    Text("27 March 2024")
                        .font(.system(size: 20))
                    Text("Total Expense: $4000")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "arrow.right")
            }
        }.foregroundColor(.black)
    }
}

#Preview {
    TransactionHistoryCard()
}
