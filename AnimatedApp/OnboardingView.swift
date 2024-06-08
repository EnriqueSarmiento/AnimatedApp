//
//  OnboardingView.swift
//  AnimatedApp
//
//  Created by Enrique Sarmiento on 6/8/24.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
   
   let button = RiveViewModel(fileName: "RiveAssets/button")
   
   var body: some View {
      ZStack{
         ShapesAnimatedBG()
         VStack(alignment: .leading, spacing: 16){
            Text("Keep Your Money on Track with ease")
               .customFont(.largeTitle)
               

            Spacer()
            Text("Don't loose any trasaction and reach your saving goals on a snatch").customFont(.body)
              
            
            button.view()
               .frame(width: 236, height: 64)
               .overlay{
                  Label("Start the process", systemImage: "arrow.forward")
                     .offset(x:4,y:4)
               }.background(
                  Color.black
                     .cornerRadius(30)
                     .blur(radius: 10)
                     .opacity(0.3)
                     .offset(y:10)
               )
               .onTapGesture {
                  button.play(animationName: "active")
               }
         }
            .padding(40)
      }
      
   }
}




#Preview {
   OnboardingView()
}
