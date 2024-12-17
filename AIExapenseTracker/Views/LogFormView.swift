//
//  LogFormView.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 17/12/24.
//

import SwiftUI

struct LogFormView: View {
    
    @State var vm : FormViewModel
    @Environment(\.dismiss) var dismiss
    
#if !os(macOS)
    var title : String {
        ((vm.logToEdit == nil) ? "Create" : "Edit") + " Expense Log"
    }
    
    var body: some View {
        NavigationStack {
            formView
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            self.onSaveTaped()
                        }
                        .disabled(vm.isSaveButtonDisabled)
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            self.onCancleTaped()
                        }
                        
                    }
                }
        }
        .navigationBarTitle(title, displayMode: .large)
        
        
    }
    
#else
    var body: some View {
        VStack {
            formView.padding()
            HStack {
                Button("Cancel") {
                    self.onCancleTaped()
                }
                Button("Save") {
                    self.onSaveTaped()
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .disabled(vm.isSaveButtonDisabled)
            }
            .padding()
        }
        .frame(minWidth: 300)
    }
    
#endif
    
    private var formView : some View {
        Form {
            TextField("Name  ", text: $vm.name)
                .disableAutocorrection(true)
            TextField("Amount ", value: $vm.amount, formatter: vm.numberFormatter)
#if !os(macOS)
                .keyboardType(.numbersAndPunctuation)
#endif
            
            Picker(selection: $vm.category,label: Text("Category")) {
                ForEach(Category.allCases) { category in
                    Text(category.rawValue.capitalized).tag(category)
                }
            }
            DatePicker(selection: $vm.date,displayedComponents: [.date,.hourAndMinute]) {
                Text("Date  ")
            }
        }
        
        
    }
    private func onCancleTaped() {
        self.dismiss()
    }
    private func onSaveTaped() {
#if !os(macOS)
        
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
#endif
        self.vm.save()
        self.dismiss()
    }
}

#Preview {
    LogFormView(vm: .init())
}
