//
//  AppUpdater.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 20/12/24.
//


import Combine
import Foundation
import Sparkle

@Observable
final class AppUpdater {
    private var cancellable: AnyCancellable?
    var canCheckForUpdates = false
    
    init(_ updater: SPUUpdater) {
        cancellable = updater.publisher(for: \.canCheckForUpdates)
            .assign(to: \.canCheckForUpdates, on: self)
    }
}
