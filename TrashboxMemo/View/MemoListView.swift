//
//  MemoListView.swift
//  TrashboxMemo
//
//  Created by 13an on 2023/07/20.
//

import SwiftUI
import CoreHaptics

struct MemoListView: View {
    @Binding var colorTheme: ColorTheme
    @State private var isSettingViewPresented = false
    @StateObject private var hapticEngine = HapticEngine()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Memo")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 64, weight: .bold))
                        .padding(24)
                        .foregroundColor(colorTheme.text_base_1)
                        .onAppear {
                            hapticEngine.prepareHaptics()
                        }
                        .onLongPressGesture(minimumDuration: 0.1, maximumDistance: .infinity, pressing: { pressing in
                                        if pressing {
                                            // 指が触れた瞬間のアクションをここに記述
                                            print("Tapped!")
                                            hapticEngine.hapticFeedbackLight()
                                        }
                                    }, perform: {})
                    
                    VStack {
                        NavigationLink(destination: MemoDetailView(colorTheme: $colorTheme)) {
                            MemoListItemView(colorTheme: $colorTheme)
                                .cornerRadius(16)
                                .onAppear {
                                    hapticEngine.prepareHaptics()
                                }
                                .onLongPressGesture(minimumDuration: 0.1, maximumDistance: .infinity, pressing: { pressing in
                                                if pressing {
                                                    // 指が触れた瞬間のアクションをここに記述
                                                    print("Tapped!")
                                                    hapticEngine.hapticFeedbackLight()
                                                }
                                            }, perform: {})
                        }
                        NavigationLink {
                            MemoDetailView(colorTheme: $colorTheme)
                        } label: {
                            MemoListItemView(colorTheme: $colorTheme)
                                .cornerRadius(16)
                        }
                        NavigationLink {
                            MemoDetailView(colorTheme: $colorTheme)
                        } label: {
                            MemoListItemView(colorTheme: $colorTheme)
                                .cornerRadius(16)
                        }
                        NavigationLink {
                            MemoDetailView(colorTheme: $colorTheme)
                        } label: {
                            MemoListItemView(colorTheme: $colorTheme)
                                .cornerRadius(16)
                        }
                        NavigationLink {
                            MemoDetailView(colorTheme: $colorTheme)
                        } label: {
                            MemoListItemView(colorTheme: $colorTheme)
                                .cornerRadius(16)
                        }
                        NavigationLink {
                            MemoDetailView(colorTheme: $colorTheme)
                        } label: {
                            MemoListItemView(colorTheme: $colorTheme)
                                .cornerRadius(16)
                        }
                        
                    }
                    .padding(16)
                }
            }
            .background(colorTheme.background_1)
            .toolbar {
                ToolbarItem {
                    Button("Setting") {
                        isSettingViewPresented.toggle()
                    }
                    .onAppear(perform: hapticEngine.prepareHaptics)
                    .onTapGesture(perform: hapticEngine.hapticFeedbackLight)
                    .sheet(isPresented: $isSettingViewPresented) {
                        SettingView(colorTheme: $colorTheme)
                    }
                    .foregroundColor(colorTheme.text_accent_1)
                    .fontWeight(.black)
                }
                ToolbarItem {
                    Button("Create") {
                        
                    }
                    .foregroundColor(colorTheme.text_accent_1)
                    .fontWeight(.black)
                }
            }
        }
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        let localizationIds = ["en", "ja", "de"]
        ForEach(localizationIds, id: \.self) { id in
            MemoListView(colorTheme: .constant(.beige))
                .previewDisplayName("Localized - \(id)")
                .environment(\.locale, .init(identifier: id))
        }
    }
}
