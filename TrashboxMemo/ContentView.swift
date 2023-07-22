//
//  ContentView.swift
//  TrashboxMemo
//
//  Created by 13an on 2023/07/20.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    @State private var colorTheme: ColorTheme = .white
    @State private var selectedLanguageIndex = 0
    @EnvironmentObject private var hapticEngine: HapticEngine

    
    var body: some View {
        MemoListView(colorTheme: $colorTheme)
            .onAppear {
                hapticEngine.prepareHaptics()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let localizationIds = ["en", "ja", "de"]
        ForEach(localizationIds, id: \.self) { id in
            ContentView()
                .previewDisplayName("Localized - \(id)")
                .environment(\.locale, .init(identifier: id))
        }
    }
}
