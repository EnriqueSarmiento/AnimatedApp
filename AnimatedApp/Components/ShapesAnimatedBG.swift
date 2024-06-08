//
//  ShapesAnimatedBG.swift
//  AnimatedApp
//
//  Created by Enrique Sarmiento on 6/8/24.
//

import SwiftUI
import RiveRuntime

struct ShapesAnimatedBG: View {
   var body: some View {
      RiveViewModel(fileName: "RiveAssets/shapes", extension: "riv").view()
         .ignoresSafeArea()
         .blur(radius: 30)
         .background(
            Image("Spline")
               .blur(radius: 50)
               .offset(x:200, y: 100)
         )
   }
}
