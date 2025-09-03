//
//  AIAssitance.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 20/12/24.
//

import SwiftUI
import ChatGPTUI

#warning("Don't commit this api key to git")
let KOSIGNAPIKEY =
"your api key"

enum ChatType : String,CaseIterable, Identifiable {
    
    case text = "Text"
    case void = "Voice"
    var id: Self { self }
}

struct AIAssitantView: View {
    
    @State var textChatVM = AIAssistantTextChatViewModel(apiKey: KOSIGNAPIKEY)
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
                       
                    
                    TextChatView(customContentVM: textChatVM)
                    
//                    TextChatView(model:.gpt_hyphen_3_period_5_hyphen_turbo,apiKey: KOSIGNAPIKEY)
                    
                case .void:
                    VoiceChatView(model:.gpt_hyphen_3_period_5_hyphen_turbo_hyphen_1106,apiKey: KOSIGNAPIKEY)
                }
            }
            .frame(maxWidth: 1024,alignment: .center)

        }
#if !os(macOS)
.navigationBarTitle("AI Exspense Tracker",displayMode:.inline)
#endif
    }
}

//#Preview {
//    AIAssitantView()
//}
