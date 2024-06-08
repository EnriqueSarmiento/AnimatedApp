//
//  TabBarView.swift
//  AnimatedApp
//
//  Created by Enrique Sarmiento on 6/8/24.
//

import SwiftUI
import RiveRuntime

struct TabBarView: View {
   
   @AppStorage("selectedTab") var selectedTab: TabType = .chat

   
    var body: some View {
       VStack{
          Spacer()
          HStack{
             content
          }.padding().background(.background2.opacity(0.8))
             .background(.ultraThinMaterial)
             .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
             .shadow(color: .background2.opacity(0.3), radius: 20, x: 0, y: 20)
             .overlay{
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                   .stroke(.linearGradient(colors: [.white.opacity(0.5), .white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing))
                   
             }
             .padding(.horizontal, 24)
       }
   }
   
   var content: some View {
      ForEach(tabItems) { item in
         Button{
            item.icon.setInput("active", value: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
               item.icon.setInput("active", value: false)
            }
            withAnimation {
               selectedTab = item.tab
            }
         } label : {
            item.icon
               .view()
               .frame(height: 36)
               .opacity(selectedTab == item.tab ? 1 : 0.5)
               .background{
                  VStack{
                     RoundedRectangle(cornerRadius: 2)
                        .frame(width: 20,height: 3)
                        .offset(y: -4)
                        .opacity(selectedTab == item.tab ? 1 : 0)
                     Spacer()
                  }
               }
            
         }
      }
   }
}

#Preview {
    TabBarView()
}

struct TabItem: Identifiable {
   var id =  UUID()
   var icon: RiveViewModel
   var tab: TabType
}

var tabItems = [
   TabItem(icon: RiveViewModel(fileName: "RiveAssets/icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), tab: .chat),
   TabItem(icon: RiveViewModel(fileName: "RiveAssets/icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), tab: .search),
   TabItem(icon: RiveViewModel(fileName: "RiveAssets/icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER"), tab: .timer),
   TabItem(icon: RiveViewModel(fileName: "RiveAssets/icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL"), tab: .bell),
   TabItem(icon: RiveViewModel(fileName: "RiveAssets/icons", stateMachineName: "USER_Interactivity", artboardName: "USER"), tab: .user)
]

enum TabType: String {
   case chat
   case search
   case timer
   case bell
   case user
}
