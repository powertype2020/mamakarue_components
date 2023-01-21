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
        /// 白.
        case white
        
        public var color: Color {
            switch self {
            case .main:
                return Color.pink
            case .secondry:
                return Color.gray
            case .white:
                return Color.white
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
    private let buttonColor: SaveButtonColor
    /// Rectangleのカラー.
    private let rectangleColor: SaveButtonColor
    /// 保存ボタンのRectangleのフラグ.
    private let withRectangle: Bool
    /// 保存ボタンのアクション.
    private let action: () -> Void
    
    public init(
        label: String,
        buttonColor: SaveButtonColor,
        rectangleColor: SaveButtonColor,
        withRectangle: Bool,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.buttonColor = buttonColor
        self.rectangleColor = rectangleColor
        self.withRectangle = withRectangle
        self.action = action
    }
    
    public var body: some View {
        ZStack {
            if withRectangle {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(buttonColor.color)
                    .foregroundColor(rectangleColor.color)
            }
            Button(action: action) {
                Text(verbatim: label)
                    .foregroundColor(buttonColor.color)
            }
        }
    }
}
