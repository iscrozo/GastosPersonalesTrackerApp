//
//  GastosPersonalesTrackerTests.swift
//  GastosPersonalesTrackerTests
//
//  Created by Camilo Rozo on 10/11/23.
//

import XCTest
@testable import GastosPersonalesTracker

final class GastosPersonalesTrackerTests: XCTestCase {

    var expensesViewModel: ExpensesViewModel!
    
    
    override func setUp() {
        super.setUp()
        expensesViewModel = ExpensesViewModel()
    }

    override func tearDown() {
        expensesViewModel = nil
        super.tearDown()
    }
    
    func testAddExpensesValidData() throws {
        // Given
        expensesViewModel.expenseTitle = "TV"
        expensesViewModel.expenseAmount = "10.0"
        //When
        let result = expensesViewModel.addExpense()
        //Then
        XCTAssertTrue(result, "add data")
        XCTAssertEqual(expensesViewModel.expenses.items.count, 1)
    }
    
    func testAddExpensesInvalidData() throws {
        // Given
        expensesViewModel.expenseTitle = "Celular"
        expensesViewModel.expenseAmount = "fsdfsfs0.0"
        //When
        let result = expensesViewModel.addExpense()
        //Then
        XCTAssertFalse(result, "error in to add data")
        XCTAssertEqual(expensesViewModel.expenses.items.count, 0)
    }
    
    func testAddExpensesCleanData() throws {
        // Given
        expensesViewModel.expenseTitle = "Celular"
        expensesViewModel.expenseAmount = "20.0"
        //When
        expensesViewModel.clearFields()
        //Then
        XCTAssertEqual(expensesViewModel.expenseTitle, "")
        XCTAssertEqual(expensesViewModel.expenseAmount, "")
    }

}
