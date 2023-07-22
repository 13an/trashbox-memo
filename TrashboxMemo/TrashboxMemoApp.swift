//
//  TrashboxMemoApp.swift
//  TrashboxMemo
//
//  Created by 13an on 2023/07/20.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    var hapticEngine: HapticEngine?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        hapticEngine?.prepareHaptics()
    }
}

@main
struct TrashboxMemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let hapticEngine = HapticEngine() // 共有の HapticEngine インスタンスを追加
    
    @AppStorage(wrappedValue: 0, "appearanceMode") var appearanceMode

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .applyAppearenceSetting(AppearanceModeSetting(rawValue: self.appearanceMode) ?? .followSystem)
                .environmentObject(hapticEngine)
                .onAppear {
                    appDelegate.hapticEngine = hapticEngine
                }
        }
    }
}
