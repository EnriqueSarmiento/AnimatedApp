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
         .ignoresSafeArea()
         
         button.view()
            .frame(width: 44, height: 44)
            .mask(Circle())
            .shadow(color: .shadow.opacity(0.2), radius: 5, x: 0, y: 5 )
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .onTapGesture {
               button.setInput("isOpen", value: isOpen)
               isOpen.toggle()
            }
            .padding()
         
         TabBarView()
      }
   }
}

#Preview {
    ContentView()
}
