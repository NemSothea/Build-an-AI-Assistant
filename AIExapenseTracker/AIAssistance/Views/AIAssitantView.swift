//
//  AIAssitance.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 20/12/24.
//

import SwiftUI


let KOSIGNAPIKEY =
"your api key"

enum ChatType : String,CaseIterable, Identifiable {
    
    case text = "Text"
    case void = "Voice"
    var id: Self { self }
}

struct AIAssitantView: View {
    
    @State var chatType: ChatType = .text
    
    var body: some View {
        VStack {
            Picker(selection: $chatType, label: Text("Chat type").font(.system(size: 12,weight: .bold))) {
                ForEach(ChatType.allCases) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
#if os(iOS)
            .padding(.vertical)
#endif
            Divider()
            ZStack {
                switch chatType {
                case .text:
                        // Will move code to use ChatGPT
                    Text("Voice CHAT")
                case .void:
                    Text("Voice CHAT")
                }
            }
            .frame(maxWidth: 1024,alignment: .center)

        }
#if !os(macOS)
.navigationBarTitle("KOSIGN AI Exspense Tracker",displayMode:.inline)
#endif
    }
}

//#Preview {
//    AIAssitantView()
//}
