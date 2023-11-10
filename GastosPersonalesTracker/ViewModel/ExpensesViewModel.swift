//
//  ExpensesViewModel.swift
//  GastosPersonalesTracker
//
//  Created by Sebastian Camilo Rozo  Rozo on 26/10/23.
//

import Foundation
import SwiftUI

class ExpensesViewModel: ObservableObject {
    @Published var expenses = Expenses()
    @Published var expenseTitle = ""
    @Published var expenseAmount = ""
    
    func addExpense() -> Bool {
        if let amount = Double(expenseAmount), !expenseTitle.isEmpty {
            expenses.items.append(Expense(title: expenseTitle, amount: amount))
            clearFields()
            return true
        } else {
            return false
        }
    }
    
    func clearFields() {
        expenseTitle = ""
        expenseAmount = ""
    }
}
