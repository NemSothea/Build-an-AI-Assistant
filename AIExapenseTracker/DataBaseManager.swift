//
//  DataBaseManager.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 10/12/24.
//

import Foundation
import FirebaseFirestore

class DataBaseManager {
    
    static let shared = DataBaseManager()
    
    private init() {}
    
    private (set) lazy var logsCollection : CollectionReference = {
        Firestore.firestore().collection("logs")
    }()
    
    func add(log : ExspenseLog) throws {
        try logsCollection.document(log.id).setData(from: log)
    }
    
    func update(log : ExspenseLog) {
        logsCollection.document(log.id).updateData([
            "name" : log.name,
            "amount":log.amount,
            "category":log.category,
            "date":log.date
        ])
    }
    func delete(log : ExspenseLog) {
        logsCollection.document(log.id).delete()
    }
    
}
