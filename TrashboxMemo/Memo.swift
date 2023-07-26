//
//  Memo.swift
//  TrashboxMemo
//
//  Created by 13an on 2023/07/26.
//

import SwiftUI

struct Memo: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var content: String
}
