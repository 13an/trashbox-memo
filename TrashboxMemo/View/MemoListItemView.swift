//
//  MemoListItemView.swift
//  TrashboxMemo
//
//  Created by 13an on 2023/07/20.
//

import SwiftUI

struct MemoListItemView: View {
    @Binding var colorTheme: ColorTheme
    @State private var selectedLanguageIndex = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Title")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(colorTheme.text_base_1)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
            Text("this is a memo. you can write anything you want to write.  text will be shown in list view. this is a memo. you can write anything you want to write.  text will be shown in list view. this is a memo. you can write anything you want to write.  text will be shown in list view.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.callout)
                .fontWeight(.bold)
                .foregroundColor(colorTheme.text_base_2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(colorTheme.surface_1)
    }
}

struct MemoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let localizationIds = ["en", "ja", "de"]
        ForEach(localizationIds, id: \.self) { id in
            MemoListItemView(colorTheme: .constant(.beige))
                .previewDisplayName("Localized - \(id)")
                .environment(\.locale, .init(identifier: id))
        }
    }
}
