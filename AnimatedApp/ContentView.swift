//
//  ContentView.swift
//  AnimatedApp
//
//  Created by Enrique Sarmiento on 6/8/24.
//

import SwiftUI

struct ContentView: View {
   
   @AppStorage("selectedTab") var selectedTab: TabType = .chat
   
   var body: some View {
      //OnboardingView()
      ZStack{
         switch selectedTab {
         case .chat:
            Text("Chat")
         case .search:
            Text("Search")
         case .timer:
            Text("Timer")
         case .bell:
            Text("Bell")
         case .user:
            Text("user")
         }
         
         TabBarView()
      }
   }
}

#Preview {
    ContentView()
}
