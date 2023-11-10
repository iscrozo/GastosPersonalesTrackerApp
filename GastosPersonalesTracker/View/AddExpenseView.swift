//
//  AddExpenseView.swift
//  GastosPersonalesTracker
//
//  Created by Sebastian Camilo Rozo  Rozo on 26/10/23.
//

import Foundation
import SwiftUI

struct AddExpenseView: View {
    @ObservedObject var viewModel: ExpensesViewModel
    @Binding var showExpense: Bool
    @State private var showingAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack{
                Capsule()
                    .stroke(lineWidth: 2)
                    .frame(height: 40)
                TextField("Antojito", text: $viewModel.expenseTitle)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .foregroundColor(.black)
                    .padding([.trailing, .leading], 20)
                    .padding([.top, .bottom],5)
                    .autocapitalization(.words)
            }.padding([.leading, .trailing])
            
            ZStack{
                Capsule()
                    .stroke(lineWidth: 2)
                    .frame(height: 40)
                HStack {
                    Text("$")
                        .font(.title)
                        .padding(.leading, 5)
                        .foregroundColor(.blue)
                    TextField("Valor", text: $viewModel.expenseAmount)
                    
                        .background(.white)
                        .foregroundColor(.black)
                        .keyboardType(.numberPad)
                        .padding(.leading,-5)
                        .padding(.trailing, 20)
                        .padding([.top, .bottom],5)
                        .autocapitalization(.words)
                }
                
                
            }.padding([.leading, .trailing])
            
            Spacer()
            
            Button(action: {
                if viewModel.addExpense() {
                    showExpense.toggle()
                    showingAlert = false
                } else {
                    showingAlert.toggle()
                    viewModel.clearFields()
                }
                
            }) {
                Text("Guardar")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.bottom, 60)
        }.padding(.top, 50)
            .alert(isPresented: $showingAlert, content: {
                Alert(
                    title: Text("Error de Validación"),
                    message: Text("Por favor, ingresa un título y un monto válido."),
                    dismissButton: .default(Text("Entendido"))
                )
            })
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ExpensesViewModel()
        let showExpense = Binding.constant(true)
        AddExpenseView(viewModel: viewModel, showExpense: showExpense)
    }
}
