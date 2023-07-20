//
//  Color.swift
//  TrashboxMemo
//
//  Created by 13an on 2023/07/20.
//

import SwiftUI

extension Color {
    static let background_1_white = Color("background_1_white")
    static let background_1_beige = Color("background_1_beige")
    static let background_1_hacker = Color("background_1_hacker")

    static let surface_1_white = Color("surface_1_white")
    static let surface_1_beige = Color("surface_1_beige")
    static let surface_1_hacker = Color("surface_1_hacker")

    static let text_base_1_white = Color("text_base_1_white")
    static let text_base_1_beige = Color("text_base_1_beige")
    static let text_base_1_hacker = Color("text_base_1_hacker")

    static let text_base_2_white = Color("text_base_2_white")
    static let text_base_2_beige = Color("text_base_2_beige")
    static let text_base_2_hacker = Color("text_base_2_hacker")
    
    static let text_accent_1_white = Color("text_accent_1_white")
    static let text_accent_1_beige = Color("text_accent_1_beige")
    static let text_accent_1_hacker = Color("text_accent_1_hacker")
}

enum ColorTheme {
    case white, beige, hacker
    
    var background_1: Color {
        switch self {
        case .white:
            return Color.background_1_white
        case .beige:
            return Color.background_1_beige
        case .hacker:
            return Color.background_1_hacker
        }
    }
    
    var surface_1: Color {
        switch self {
        case .white:
            return Color.surface_1_white
        case .beige:
            return Color.surface_1_beige
        case .hacker:
            return Color.surface_1_hacker
        }
    }
    
    var text_base_1: Color {
        switch self {
        case .white:
            return Color.text_base_1_white
        case .beige:
            return Color.text_base_1_beige
        case .hacker:
            return Color.text_base_1_hacker
        }
    }
    
    var text_base_2: Color {
        switch self {
        case .white:
            return Color.text_base_2_white
        case .beige:
            return Color.text_base_2_beige
        case .hacker:
            return Color.text_base_2_hacker
        }
    }
    
    var text_accent_1: Color {
        switch self {
        case .white:
            return Color.text_accent_1_white
        case .beige:
            return Color.text_accent_1_beige
        case .hacker:
            return Color.text_accent_1_hacker
        }
    }
}
