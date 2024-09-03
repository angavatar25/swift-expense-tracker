//
//  HistoryView.swift
//  Exspense Tracker
//
//  Created by Ananda Afryan on 16/04/24.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    NavigationLink(destination: ListOfHistoryView()) {
                        TransactionHistoryCard()
                    }
                    Spacer()
                }

            }
            .navigationTitle("History")
            .padding()
        }
    }
}

#Preview {
    HistoryView()
}
