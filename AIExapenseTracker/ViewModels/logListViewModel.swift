//
//  logListViewModel.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 10/12/24.
//

import Foundation
import Observation

@Observable
class LogListViewModel {
    
    let db = DataBaseManager.shared
    
    var sortType = SortType.date
    
    var sortOrder = SortOrder.descending
    
    var selectedCategories = Set<Category>()
    
    var isLogFormPresented: Bool = false
    
    var logToEdit: ExspenseLog?
    
    
    
}
