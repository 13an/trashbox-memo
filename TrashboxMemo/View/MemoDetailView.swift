//
//  MemoDetailView.swift
//  TrashboxMemo
//
//  Created by 13an on 2023/07/20.
//

import SwiftUI

struct MemoDetailView: View {
    @Binding var colorTheme: ColorTheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Title")
                        .font(.system(size: 64, weight: .bold))
                        .foregroundColor(colorTheme.text_base_1)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 0))
                    Text("this is a memo. you can write anything you want to write.  text will be shown in list view. this is a memo. you can write anything you want to write.  text will be shown in list view. this is a memo. you can write anything you want to write.  text will be shown in list view.")
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
            .navigationBarTitleDisplayMode(.inline)
            .background(colorTheme.surface_1)
        }
    }
}

struct MemoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemoDetailView(colorTheme: .constant(.hacker))
    }
}
