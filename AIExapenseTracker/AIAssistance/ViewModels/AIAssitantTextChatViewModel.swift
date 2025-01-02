//
//  AIAssitantTextChatViewModel.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 26/12/24.
//

import Foundation
import ChatGPTUI
import Observation
import ChatGPTSwift

@Observable
class AIAssistantTextChatViewModel : TextChatViewModel <AIAssitantResponseView> {
    
    var functionSystemText: String {
        """
        You are an expert expense tracker. 
        Always use the 'addExpenseLog' function to track expenses. 
        If the user omits 'amount', 'category', or 'date', ASK them for it directly. 
        Never assume or skip required fields.
        """
    }
    /// parallel function calling
    /// .gpt_hyphen_3_period_5_hyphen_turbo_hyphen_1106
    init(apiKey:String, model: ChatGPTModel = .gpt_hyphen_3_period_5_hyphen_turbo_hyphen_1106) {
        super.init(apiKey: apiKey)
    }
    
    @MainActor
    override func sendTapped() async {
        self.task = Task {
            let text = inputMessage
            inputMessage = ""
            await callFunction(text)
        }
    }
    
    @MainActor
    override func retry(message: MessageRow<AIAssitantResponseView>) async {
        
        self.task = Task {
            guard let index = messages.firstIndex(where: { $0.id == message.id }) else {
                return
            }
            self.messages.remove(at: index)
            await callFunction(message.sendText)
        }
    }
    
    @MainActor
    func callFunction(_ prompt : String) async {
        isPrompting = true
        var messageRow = MessageRow<AIAssitantResponseView>(
            isPrompting: true,
            sendImage: senderImage,
            send: .rawText(prompt),
            responseImage: botImage,
            response: .rawText(""),
            responseError: nil)
        
        self.messages.append(messageRow)
        
        do {
            let message = try await api.callFunction(prompt: prompt, tools: tools,model: model,systemText: functionSystemText)
            try Task.checkCancellation()
            
            
            if let toolCall = message.tool_calls?.first {
                var text = "Function Name: \(toolCall.function.name)"
                text += "\nArgs: \(toolCall.function.arguments)"
                messageRow.response = .customContent({ AIAssitantResponseView(text: text) })
                
            }else if let message = message.content {
                api.appendToHistoryList(userText: prompt, responseText: message)
                messageRow.response = .customContent({ AIAssitantResponseView(text: message) })
                
            }else {
                throw "Invalid response"
            }
        } catch {
            messageRow.responseError = error.localizedDescription
        }
        
        messageRow.isPrompting = false
        self.messages[self.messages.count - 1] = messageRow
        isPrompting = false
    }
    
 
}
