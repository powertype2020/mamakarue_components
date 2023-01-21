//
//  SaveButton.swift
//
//
//  Created by 武久　直幹 on 2023/01/10.
//

import SwiftUI

public struct SaveButton: View {
    
    public enum SaveButtonColor: CaseIterable {
        /// メイン.
        case main
        /// セカンダリ.
        case secondry
        
        public var color: Color {
            switch self {
            case .main:
                return Color.pink
            case .secondry:
                return Color.gray
            }
        }
    }
    
    public enum SaveButtonTextSize: CGFloat {
        /// 大.
        case large = 60
        /// 中.
        case medium = 30
        /// 小.
        case small = 15
    }
    
    /// 保存ボタンのラベル.
    private let label: String
    /// 保存ボタンのカラー.
    private let butoonColor: SaveButtonColor
    /// 保存ボタンのアクション.
    private let action: () -> Void
    
    public init(
        label: String,
        buttonColor: SaveButtonColor,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.butoonColor = buttonColor
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(verbatim: label)
                .foregroundColor(butoonColor.color)
        }
    }
}
