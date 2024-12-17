//
//  ContentView.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 10/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var vm = LogListViewModel()
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    
    var body: some View {
#if os(macOS)
        splitView
#elseif os(visionOS)
        tapView
#else
        switch horizontalSizeClass {
        case .compact: tapView
        default : splitView
            
        }
#endif
    }
    
    var tapView : some View {
        TabView {
            NavigationStack {
                LogListContainerView(vm: $vm)
            }
            .tabItem {
                Label("Exspense", systemImage: "tray")
            }.tag(0)
            
            NavigationStack {
                Text("AI Assistant")
            }
            .tabItem {
                Label("AI Assistant", systemImage: "waveform")
            }.tag(1)
        }
    }
    var splitView : some View {
        NavigationSplitView {
            List {
                NavigationLink(destination: LogListView(vm: $vm)) {
                    Label("Exspense", systemImage: "tray")
                }
                NavigationLink(destination: Text("AI Assistant")) {
                    Label("AI Assistant", systemImage: "waveform")
                }
            }
         
            
        } detail : {
            LogListContainerView(vm: $vm)
        }
        .navigationTitle("KOSIGN AI Expenses Tracker")
    }
}

#Preview {
    ContentView()
}
