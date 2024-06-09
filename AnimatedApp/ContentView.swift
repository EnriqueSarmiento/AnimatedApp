//
//  ContentView.swift
//  AnimatedApp
//
//  Created by Enrique Sarmiento on 6/8/24.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
   
   @AppStorage("selectedTab") var selectedTab: TabType = .chat
   @State var isOpen: Bool = false
   let button = RiveViewModel(fileName: "RiveAssets/menu_button", stateMachineName: "State Machine", autoPlay: false)
   
   var body: some View {
      //OnboardingView()
      ZStack{
         Color.background2.ignoresSafeArea()
         
         SideMenu()
            .opacity(isOpen ? 1 : 0)
            .offset(x: isOpen ? 0 : -300)
            .rotation3DEffect(
               .degrees(isOpen ? 0 : 30),
                axis: (x: 0, y: 1, z: 0)
            )
         
         
         Group {
            switch selectedTab {
            case .chat:
               HomeView()
            case .search:
               Text("Search")
            case .timer:
               Text("Timer")
            case .bell:
               Text("Bell")
            case .user:
               Text("user")
            }
                        
         }.safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 80)
         }
         .safeAreaInset(edge: .top) {
            Color.clear.frame(height: 104)
         }
         .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
         )
         .rotation3DEffect(
            .degrees(isOpen ? 30 : 0),
            axis: (x: 0, y: -1, z: 0)
         )
         .offset(x: isOpen ? 265: 0)
         .scaleEffect(isOpen ? 0.9: 1)
         .ignoresSafeArea()
         
         button.view()
            .frame(width: 44, height: 44)
            .mask(Circle())
            .shadow(color: .shadow.opacity(0.2), radius: 5, x: 0, y: 5 )
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .offset(x: isOpen ? 216 : 0)
            .onTapGesture {
               button.setInput("isOpen", value: isOpen)
               withAnimation (.spring(response: 0.5, dampingFraction: 0.7)){
                  isOpen.toggle()
                  
               }
            }
            .padding()
         
         TabBarView()
            .offset(y: isOpen ? 300 : 0)
      }
   }
}

#Preview {
    ContentView()
}
