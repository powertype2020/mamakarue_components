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
        
        var color: Color {
            switch self {
            case .main:
                return Color.pink
            case .secondry:
                return Color.gray
            }
        }
    }
    
    public enum SaveButtonFrameSize: CaseIterable {
        /// 大.
        case large
        /// 中.
        case medium
        /// 小.
        case small
        
        var frame: CGSize {
            switch self {
            case .large:
                return CGSize(width: 200, height: 50)
            case .medium:
                return CGSize(width: 100, height: 25)
            case .small:
                return CGSize(width: 50, height: 12.5)
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
    private let color: SaveButtonColor
    /// 保存ボタンのフレームサイズ.
    private let frameSize: SaveButtonSize
    /// 保存ボタンテキストのサイズ
    private let textSize: SaveButtonTextSize
    /// 保存ボタンのアクション.
    private let action: () -> Void
    
    @Environment(\.isEnabled) var isEnabled
    
    public init(
        label: String,
        color: SaveButtonColor,
        frameSize: SaveButtonSize,
        textSize: SaveButtonTextSize,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.color = color
        self.frameSize = frameSize
        self.textSize = textSize
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(verbatim: label)
                .foregroundColor(color)
                .frame(size)
        }
    }
}

struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton()
    }
}

