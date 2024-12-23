//
//  CodeBlockView.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 20/12/24.
//


import MarkdownUI
import SwiftUI

struct CodeBlockView: View {
    let configuration: CodeBlockConfiguration
    @State private var isCopied = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(configuration.language?.capitalized ?? "")
                    .foregroundStyle(.white)
                
                Spacer()
                
                Button(action: copyCodeAction) {
                    Text(isCopied ? "Copied!" : "Copy Code")
                        .foregroundStyle(.white)
                        .frame(width: 80)
                        .padding(4)
                }
                .buttonStyle(.plain)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.red, lineWidth: 1)
                )
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.gray)
            
            configuration.label
                .padding(.top, 8)
                .padding(.bottom)
                .padding(.horizontal)
                .monospaced()
        }
        .background(Color.red)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.secondary, lineWidth: 0.2)
        )
    }
    
    private func copyCodeAction() {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(configuration.content, forType: .string)
        isCopied = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isCopied = false
        }
    }
}

extension CodeBlockConfiguration: @retroactive Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(language)
        hasher.combine(content)
    }
    
    public static func == (lhs: CodeBlockConfiguration, rhs: CodeBlockConfiguration) -> Bool {
        return lhs.language == rhs.language && lhs.content == rhs.content
    }
}
