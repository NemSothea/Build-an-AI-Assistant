//
//  logFormViewModel.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 16/12/24.
//

import Foundation
import Observation

@Observable
class FormViewModel  {
    var logToEdit: ExspenseLog?
    let db = DataBaseManager.shared
    
    var name = ""
    var amount : Double = 0
    var category = Category.utilities
    var date : Date = Date()
    
    var isSaveButtonDisabled: Bool {
        name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.isLenient = true
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        return formatter
    }()
    
    
    init(logToEdit: ExspenseLog? = nil) {
        self.logToEdit = logToEdit
        if let logToEdit {
            self.name = logToEdit.name
            self.amount = logToEdit.amount
            self.category = logToEdit.categoryEnum
            self.date = logToEdit.date
            numberFormatter.currencyCode = logToEdit.currency
        }
    }
    func save() {
        var log : ExspenseLog
        if let logToEdit {
            log = logToEdit
        } else {
            log = ExspenseLog(id: UUID().uuidString, name: "Unknown", category: "Unknown", amount: 0, date: .now)
        }
        
        log.name = self.name.trimmingCharacters(in: .whitespacesAndNewlines)
        log.category = self.category.rawValue
        log.amount = self.amount
        log.date = self.date
        
        if self.logToEdit == nil {
            try? db.add(log: log)
        }else {
            db.update(log: log)
        }

        
    }
    func delete(log: ExspenseLog) {
        db.delete(log: log)
    }
    
}

