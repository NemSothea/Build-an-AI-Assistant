//
//  File.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 20/12/24.
//


import Foundation

extension String {
    func removeTrailingSlash() -> String {
        return self.hasSuffix("/") ? String(self.dropLast()) : self
    }
    func isValidURL() -> Bool {
        guard let url = URL(string: self), let _ = url.host else { return false }
        
        return true
    }
}
