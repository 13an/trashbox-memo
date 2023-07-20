//
//  TrashboxMemoApp.swift
//  TrashboxMemo
//
//  Created by 13an on 2023/07/20.
//

import SwiftUI

@main
struct TrashboxMemoApp: App {
    @AppStorage(wrappedValue: 0, "appearanceMode") var appearanceMode

    var body: some Scene {
        WindowGroup {
            ContentView()
                .applyAppearenceSetting(AppearanceModeSetting(rawValue: self.appearanceMode) ?? .followSystem)
        }
    }
}
