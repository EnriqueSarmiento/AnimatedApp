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
   
   @State var showModal: Bool = false
   
   var body: some View {
      ZStack{
         ShapesAnimatedBG()
         
         content
            .frame(maxHeight: showModal ? 100 : .infinity)
         
         Color.shadow.opacity(showModal ? 0.4: 0).ignoresSafeArea()
         
         if showModal {
            SignInView(showModal: $showModal)
               .transition(.move(edge: .top).combined(with: .opacity))
               .overlay{
                  Button{
                     DispatchQueue.main.async {
                        withAnimation (.spring()){
                           showModal = false
                        }
                     }
                  } label: {
                     Image(systemName: "xmark").frame(width: 36, height: 36)
                        .foregroundColor(.black)
                        .background(.white)
                        .mask(Circle())
                        .shadow(color: Color.shadow.opacity(0.3), radius: 5, x: 0, y: 3)
                  }.frame(maxHeight: .infinity, alignment: .bottom)
               }
               .zIndex(1)
         }
      }
      
   }
   
   var content: some View {
      VStack(alignment: .leading, spacing: 16){
         Text("Keep Your Money on Track with ease")
            .customFont(.largeTitle)
         
         Spacer()
         Text("Don't loose any trasaction and reach your saving goals on a snatch").customFont(.body)
         
         
         button.view()
            .frame(width: 236, height: 64)
            .overlay{
               Label("Start the process", systemImage: "arrow.forward")
                  .foregroundColor(Color(.black))
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
               DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {
                  withAnimation(.spring()) {
                     
                     showModal.toggle()
                  }
               })
            }
      }.padding(40)
   }
}




#Preview {
   OnboardingView()
}
