//
//  Expenses.swift
//  GastosPersonalesTracker
//
//  Created by Sebastian Camilo Rozo  Rozo on 26/10/23.
//

import Foundation

struct Expense: Identifiable {
    var id = UUID()
    var title: String
    var amount: Double
}

class Expenses: ObservableObject {
    @Published var items = [Expense]()
}
