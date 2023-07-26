//
//  MemoListItemView.swift
//  TrashboxMemo
//
//  Created by 13an on 2023/07/20.
//

import SwiftUI
import CoreHaptics

struct MemoListItemView: View {
    @Binding var colorTheme: ColorTheme
    @State private var selectedLanguageIndex = 0
    @StateObject private var hapticEngine = HapticEngine()
    
    var memo: Memo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(colorTheme.text_base_1)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                .lineLimit(2)
            Text(memo.content)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.callout)
                .fontWeight(.bold)
                .foregroundColor(colorTheme.text_base_2)
                .lineLimit(8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(colorTheme.surface_1)
    }
}

struct MemoListItemView_Previews: PreviewProvider {
    private var memo: Memo
    
    static var previews: some View {
        let localizationIds = ["en", "ja", "de"]
        ForEach(localizationIds, id: \.self) { id in
            MemoListItemView(colorTheme: .constant(.beige), memo: Memo(title: "title", content: "content"))
                .previewDisplayName("Localized - \(id)")
                .environment(\.locale, .init(identifier: id))
        }
    }
}
