//
//  Category.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 10/12/24.
//

import Foundation


enum SortType : String, Identifiable, CaseIterable {
    
    var id: Self { self }
    case date, amount, name
    
    var systemNameIcon: String {
        switch self {
        case .date: return "calendar"
        case .amount: return "dollarsign.circle"
        case .name: return "a"
        }
    }
    
}

enum SortOrder : String, Identifiable, CaseIterable {
    
    var id: Self { self }
    case ascending, descending
    
}
