//
//  MessageButton.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 20/12/24.
//


import SwiftUI

struct MessageButton: View {
    private var titleKey: LocalizedStringKey
    private var systemImage: String
    private var action: () -> Void
    
    init(_ titleKey: LocalizedStringKey, systemImage: String, action: @escaping () -> Void) {
        self.titleKey = titleKey
        self.systemImage = systemImage
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Label(titleKey, systemImage: systemImage)
                .help(titleKey)
                .labelStyle(.iconOnly)
        }
        .frame(minWidth: 20, minHeight: 20)
        .buttonStyle(.borderless)
    }
}
