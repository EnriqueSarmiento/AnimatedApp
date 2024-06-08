//
//  OnboardingView.swift
//  AnimatedApp
//
//  Created by Enrique Sarmiento on 6/8/24.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    var body: some View {
       RiveViewModel(fileName: "RiveAssets/shapes", extension: "riv").view()
          .ignoresSafeArea()
          .blur(radius: 30)
          
    }
}


#Preview {
   OnboardingView()
}
