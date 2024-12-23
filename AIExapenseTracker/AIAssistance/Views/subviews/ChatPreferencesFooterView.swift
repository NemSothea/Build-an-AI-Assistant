//
//  ChatPreferencesFooterView.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 20/12/24.
//



import SwiftUI

struct ChatPreferencesFooterView: View {
    private let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        VStack {
            Text(text)
                .multilineTextAlignment(.leading)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
