//
//  HomeView.swift
//  AnimatedApp
//
//  Created by Enrique Sarmiento on 6/8/24.
//

import SwiftUI

struct HomeView: View {
   var body: some View {
      
      ZStack {
         Color.background.ignoresSafeArea()
         content
      }
   }
   
   var content: some View {
      ScrollView(showsIndicators: false){
         VStack(alignment: .leading,spacing: 0){
            Text("Courses")
               .customFont(.largeTitle)
               .frame(maxWidth: .infinity, alignment: .leading)
               .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false){
               HStack(spacing: 20){
                  ForEach(courses){ item in
                     VcardView(course: item)
                  }
                  
               }.padding(20)
                  .padding(.bottom, 10)
               
            }
            
            Text("Recent")
               .customFont(.title3)
               .padding(.horizontal, 20)
            
            VStack(spacing: 20){
               ForEach(courseSections){ item in
                  HCard(section: item)
               }
               
            }.padding(20)
            
         }
      }
   }
}

#Preview {
   HomeView()
}
