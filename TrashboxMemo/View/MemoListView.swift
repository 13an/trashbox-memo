//
//  MemoListView.swift
//  TrashboxMemo
//
//  Created by 13an on 2023/07/20.
//

import SwiftUI

struct MemoListView: View {
    @Binding var colorTheme: ColorTheme
    @State private var isSettingViewPresented = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Memo")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 64, weight: .bold))
                        .padding(24)
                        .foregroundColor(colorTheme.text_base_1)
                    VStack {
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
