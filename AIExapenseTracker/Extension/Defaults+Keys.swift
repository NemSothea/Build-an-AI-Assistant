//
//  File.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 20/12/24.
//


import Defaults
import Foundation

extension Defaults.Keys {
    static let defaultChatName = Key<String>("defaultChatName", default: "New Chat")
    static let defaultModel = Key<String>("defaultModel", default: "llama3.2:latest")
    static let defaultHost = Key<String>("defaultHost", default: "http://localhost:11434")
    static let defaultSystemPrompt = Key<String>("defaultSystemPrompt", default: "You're Ollamac, a helpful assistant.")
    static let defaultTemperature = Key<Double>("defaultTemperature", default: 0.7)
    static let defaultTopP = Key<Double>("defaultTopP", default: 0.9)
    static let defaultTopK = Key<Int>("defaultTopK", default: 40)
    
    static let experimentalCodeHighlighting = Key<Bool>("experimentalCodeHighlighting", default: false)
}
