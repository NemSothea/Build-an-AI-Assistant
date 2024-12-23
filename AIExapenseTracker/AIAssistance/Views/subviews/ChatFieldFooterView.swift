//
//  ChatFieldFooterView.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 20/12/24.
//


import SwiftUI

struct ChatFieldFooterView: View {
    private let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .padding(.top, 4)
            .font(.callout)
    }
}
