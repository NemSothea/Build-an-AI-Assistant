//
//  AIExapenseTrackerApp.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 10/12/24.
//

import SwiftUI
import Defaults

import Sparkle
import SwiftUI
import SwiftData

@main
struct AIExapenseTrackerApp: App {
    
#if os(macOS)
    
    @NSApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    @State private var appUpdater: AppUpdater
    private var updater: SPUUpdater
    
    @State private var chatViewModel: ChatViewModel
    @State private var messageViewModel: MessageViewModel
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Chat.self, Message.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    init() {
        let modelContext = sharedModelContainer.mainContext
        
        let updaterController = SPUStandardUpdaterController(startingUpdater: true, updaterDelegate: nil, userDriverDelegate: nil)
        self.updater = updaterController.updater
        
        let appUpdater = AppUpdater(updater)
        self._appUpdater = State(initialValue: appUpdater)
        
        let chatViewModel = ChatViewModel(modelContext: modelContext)
        self._chatViewModel = State(initialValue: chatViewModel)
        
        let messageViewModel = MessageViewModel(modelContext: modelContext)
        self._messageViewModel = State(initialValue: messageViewModel)
        
        chatViewModel.create(model: Defaults[.defaultModel])
        guard let activeChat = chatViewModel.selectedChats
            .first else { return }
        
        chatViewModel.activeChat = activeChat
        messageViewModel.load(of: activeChat)
    }
    
#else
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
#endif
    
    var body: some Scene {
        WindowGroup {
            
            ContentView()
            #if os(macOS)
                .environment(chatViewModel)
                .environment(messageViewModel)
                .frame(minWidth:729, minHeight: 480)
            #endif
        }
        
        #if os(macOS)
        .windowResizability(.contentMinSize)
        #endif
    }
}
