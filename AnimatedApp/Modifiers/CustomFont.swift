//
//  CustomFont.swift
//  AnimatedApp
//
//  Created by Enrique Sarmiento on 6/8/24.
//

import SwiftUI

struct CustomFont: ViewModifier {
   
   var type : FontName
   var size: CGFloat
   var relativeTo: Font.TextStyle
   
   init(_ type: FontName = .Regular, _ size: CGFloat = 17, _ relativeTo: Font.TextStyle = .body) {
      self.type = type
      self.size = size
      self.relativeTo = relativeTo
   }
   
   
   func body(content: Content) -> some View {
      content.font(.custom(type.rawValue, size: size, relativeTo: relativeTo))
   }
}

extension Text {
   
   func customFont(_ type: FontName = .Regular, _ size: CGFloat = 17, _ relativeTo: Font.TextStyle = .body) -> some View {
      
    modifier(CustomFont(type, size,relativeTo))
   }
}
