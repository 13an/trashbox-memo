//
//  MemoDetailView.swift
//  TrashboxMemo
//
//  Created by 13an on 2023/07/20.
//

import SwiftUI

struct MemoDetailView: View {
    @Binding var colorTheme: ColorTheme
    
    var memo: Memo
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(memo.title)
                    .font(.system(size: 64, weight: .bold))
                    .foregroundColor(colorTheme.text_base_1)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 0))
                Text(memo.content)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(colorTheme.text_base_2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(24)
            .toolbar {
                ToolbarItem {
                    Button("Edit") {
                        
                    }
                    .foregroundColor(colorTheme.text_accent_1)
                    .fontWeight(.black)
                }
            }
        }
        .background(colorTheme.surface_1)
    }
}

struct MemoDetailView_Previews: PreviewProvider {
    var memo: Memo
    
    static var previews: some View {
        NavigationStack {
            MemoDetailView(colorTheme: .constant(.hacker), memo: Memo(title: "title", content: "content"))
        }
    }
}
