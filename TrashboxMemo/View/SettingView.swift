//
//  SettingView.swift
//  TrashboxMemo
//
//  Created by 13an on 2023/07/20.
//

import SwiftUI

struct SettingView: View {
    @Binding var colorTheme: ColorTheme
    @Environment(\.presentationMode) var presentationMode
    @AppStorage(wrappedValue: 0, "appearanceMode") var appearanceMode
    
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
                    .padding()
                }
                .listRowBackground(colorTheme.surface_1)
            }
            .foregroundColor(colorTheme.text_base_2)
            .scrollContentBackground(.hidden)

            Button(action: {presentationMode.wrappedValue.dismiss()}) {
                Text("Close")
                    .foregroundColor(colorTheme.text_accent_1)
                    .fontWeight(.black)
            }
        }
        .background(colorTheme.background_1)
    }
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
