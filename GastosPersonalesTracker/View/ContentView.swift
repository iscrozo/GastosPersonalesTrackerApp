//
//  ContentView.swift
//  GastosPersonalesTracker
//
//  Created by Sebastian Camilo Rozo  Rozo on 26/10/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ExpensesViewModel()
    @State private var showAddExpenseView = false
    
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack(spacing: 5) {
                    Text("Gastos")
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
                        .padding()
                    Spacer()
                    Button(action: {
                        showAddExpenseView.toggle()
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    .padding()
                }
                .padding([.trailing, .leading])
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: 1)
                    .foregroundColor(.black)
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: 1)
                    .foregroundColor(.white)
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: 1)
                    .foregroundColor(.black)
                List {
                    ForEach(viewModel.expenses.items) { expense in
                        HStack {
                            Text(expense.title)
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.leading, 20)
                            Spacer()
                            Text(currencyFormatter.string(from: NSNumber(value: expense.amount)) ?? "")
                                .foregroundColor(.black)
                                .font(.body)
                                .padding(.trailing, 20)
                        }
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .background(.white)
                                .foregroundColor(.black.opacity(0.1))
                        )
                        .padding(.horizontal, 8)
                    }
                }
            }
            .background(.white)
            .navigationBarHidden(true)
            .sheet(isPresented: $showAddExpenseView) {
                AddExpenseView(viewModel: viewModel, showExpense: $showAddExpenseView)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
