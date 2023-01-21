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
    
    public enum SaveButtonRectangleSize: CaseIterable {
        /// width大.
        case largeW
        /// width中.
        case mediumW
        /// width小.
        case smallW
        /// height大.
        case largeH
        /// height中.
        case mediunH
        /// height小.
        case smallH
        
        public var size: CGFloat {
            switch self {
            case .largeW:
                return 200
            case .mediumW:
                return 100
            case .smallW:
                return 50
            case .largeH:
                return 50
            case .mediunH:
                return 25
            case .smallH:
                return 12.5
            }
        }
    }
    
    public enum SaveButtonTextSize: CaseIterable {
        /// 大.
        case large
        /// 中.
        case medium
        /// 小.
        case small
        
        public var size: CGFloat {
            switch self {
            case .large:
                return 60
            case .medium:
                return 30
            case .small:
                return 15
            }
        }
    }
    
    /// 保存ボタンのラベル.
    private let label: String
    /// 保存ボタンのカラー.
    private let buttonColor: SaveButtonColor
    /// ボタンテキストのサイズ.
    private let textSize: SaveButtonTextSize
    /// Rectangleのカラー.
    private let rectangleColor: SaveButtonColor
    /// RectangleのWidth.
    private let rectangleWidth: SaveButtonRectangleSize
    /// Rectangleのheight.
    private let rectangleHeight: SaveButtonRectangleSize
    /// 保存ボタンのRectangleのフラグ.
    private let withRectangle: Bool
    /// 保存ボタンのアクション.
    private let action: () -> Void
    
    public init(
        label: String,
        buttonColor: SaveButtonColor,
        textSize: SaveButtonTextSize,
        rectangleColor: SaveButtonColor,
        rectangleWidth: SaveButtonRectangleSize,
        rectangleHeight: SaveButtonRectangleSize,
        withRectangle: Bool,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.buttonColor = buttonColor
        self.textSize = textSize
        self.rectangleColor = rectangleColor
        self.rectangleWidth = rectangleWidth
        self.rectangleHeight = rectangleHeight
        self.withRectangle = withRectangle
        self.action = action
    }
    
    public var body: some View {
        ZStack {
            if withRectangle {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(buttonColor.color)
                    .foregroundColor(rectangleColor.color)
                    .frame(width: rectangleWidth.size, height: rectangleHeight.size)
            }
            Button(action: action) {
                Text(verbatim: label)
                    .foregroundColor(buttonColor.color)
                    .font(.system(size: textSize.size))
            }
        }
    }
}
