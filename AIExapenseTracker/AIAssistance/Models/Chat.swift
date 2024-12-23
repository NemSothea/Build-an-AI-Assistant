//
//  Chat.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 20/12/24.
//


import Defaults
import Foundation
import SwiftData

@Model
final class Chat: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    
    var name: String
    var model: String = Defaults[.defaultModel]
    var host: String?
    var systemPrompt: String?
    var temperature: Double?
    var topP: Double?
    var topK: Int?
    
    var createdAt: Date = Date.now
    var modifiedAt: Date = Date.now
    
    @Relationship(deleteRule: .cascade)
    var messages: [Message] = []
    
    init(model: String) {
        self.name = Defaults[.defaultChatName]
        self.model = model
        self.host = Defaults[.defaultHost]
        self.systemPrompt = Defaults[.defaultSystemPrompt]
        self.temperature = Defaults[.defaultTemperature]
        self.topP = Defaults[.defaultTopP]
        self.topK = Defaults[.defaultTopK]
    }
    
    @Transient var firstMessage: Message? {
        return messages.sorted { $0.createdAt < $1.createdAt }.first
    }
}
