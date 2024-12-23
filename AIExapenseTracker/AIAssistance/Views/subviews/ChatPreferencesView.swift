//
//  ChatPreferencesView.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 20/12/24.
//


import Defaults
import OllamaKit
import SwiftUI
import SwiftUIIntrospect

struct ChatPreferencesView: View {
    @Environment(ChatViewModel.self) private var chatViewModel
    
    @Binding private var ollamaKit: OllamaKit
    
    @State private var isUpdateOllamaHostPresented: Bool = false
    @State private var isUpdateSystemPromptPresented: Bool = false
    
    @Default(.defaultModel) private var model: String
    @State private var host: String
    @State private var systemPrompt: String
    @State private var temperature: Double
    @State private var topP: Double
    @State private var topK: Int
    
    init(ollamaKit: Binding<OllamaKit>) {
        self._ollamaKit = ollamaKit
        
        self.host = Defaults[.defaultHost]
        self.systemPrompt = Defaults[.defaultSystemPrompt]
        self.temperature = Defaults[.defaultTemperature]
        self.topP = Defaults[.defaultTopP]
        self.topK = Defaults[.defaultTopK]
    }
    
    var body: some View {
        VStack {
            Text("ChatPreferencesView")
        }
    }
}
