//
//  SettingView.swift
//  TrashboxMemo
//
//  Created by 13an on 2023/07/20.
//

import SwiftUI
import CoreHaptics

struct SettingView: View {
    @Binding var colorTheme: ColorTheme
    @Environment(\.presentationMode) var presentationMode
    @AppStorage(wrappedValue: 0, "appearanceMode") var appearanceMode
    @StateObject private var hapticEngine = HapticEngine()
    
    var body: some View {
        VStack {
            Text("Setting")
                .foregroundColor(colorTheme.text_base_1)
                .fontWeight(.bold)
                .padding(16)
            List {
                Section("Color Theme") {
                    Picker("Color Theme", selection: $colorTheme) {
                        Text("White").tag(ColorTheme.white)
                        Text("Beige").tag(ColorTheme.beige)
                        Text("Hacker").tag(ColorTheme.hacker)

                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .onAppear {
                        hapticEngine.prepareHaptics()
                    }
                    .onChange(of: colorTheme) { segment in
                        hapticEngine.hapticFeedbackLightDouble()
                    }
                    .environmentObject(hapticEngine)
                    .padding()
                }
                .listRowBackground(colorTheme.surface_1)

                Section("Appearance") {
                    Picker("Appearance", selection: $appearanceMode) {
                        Text("Follow system")
                            .tag(0)
                        Text("Dark mode")
                            .tag(1)
                        Text("Light mode")
                            .tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .onAppear {hapticEngine.prepareHaptics()}
                    .onChange(of: appearanceMode) { segment in hapticEngine.hapticFeedbackLightDouble()
                    }
                    .environmentObject(hapticEngine)
                    .padding()
                }
                .listRowBackground(colorTheme.surface_1)
            }
            .foregroundColor(colorTheme.text_base_2)
            .scrollContentBackground(.hidden)

            Button("Close") {
                hapticEngine.prepareHaptics()
                presentationMode.wrappedValue.dismiss()
                hapticEngine.hapticFeedbackLight()
            }
            .foregroundColor(colorTheme.text_accent_1)
            .fontWeight(.black)
            .buttonStyle(.bordered)
            .font(.system(size: 20, weight: .bold))
            .padding()
        }
        .background(colorTheme.background_1)
    }
    
//    private func getSelectedSegmentView(_ index: Int) -> some View {
//        switch index {
//            case 0:
//                return AnyView(TextCatalog())
//            case 1:
//                return AnyView(ImageCatalog())
//            case 2:
//                return AnyView(VideoCatalog())
//            case 3:
//                return AnyView(HapticsView())
//            default:
//                return AnyView(EmptyView())
//            }
//    }
}

enum AppearanceModeSetting: Int {
    case followSystem = 0
    case darkMode = 1
    case lightMode = 2
}

extension View {
    @ViewBuilder
    func applyAppearenceSetting(_ setting: AppearanceModeSetting) -> some View {
        switch setting {
        case .followSystem:
            self
                .preferredColorScheme(.none)
        case .darkMode:
            self
                .preferredColorScheme(.dark)
        case .lightMode:
            self
                .preferredColorScheme(.light)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        let localizationIds = ["en", "ja", "de"]
        ForEach(localizationIds, id: \.self) { id in
            SettingView(colorTheme: .constant(.beige))
                .previewDisplayName("Localized - \(id)")
                .environment(\.locale, .init(identifier: id))
        }
    }
}
