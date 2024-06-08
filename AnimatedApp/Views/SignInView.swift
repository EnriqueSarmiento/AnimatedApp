//
//  SignInView.swift
//  AnimatedApp
//
//  Created by Enrique Sarmiento on 6/8/24.
//

import SwiftUI

struct SignInView: View {
   
   @State var email: String = ""
   @State var password: String = ""
   
   var body: some View {
      VStack(spacing: 24) {
         Text("Sign In")
            .customFont(.title)
         
         Text("Access to manage your transactions").customFont(.headline)
         
         VStack(alignment: .leading){
            Text("Email")
               .customFont(.subheadline).foregroundColor(.secondary)
            
               TextField("", text: $email)
               .foregroundStyle(Color(.black))
               .customTextField()
         }
         
         VStack(alignment: .leading){
            Text("Password")
               .customFont(.subheadline).foregroundColor(.secondary)
            
               SecureField("", text: $password)
               .foregroundStyle(Color(.black))
               .customTextField(image: Image("Icon Lock"))
         }
         
         Label("Sign In", systemImage: "arrow.right")
            .customFont(.headline)
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(Color(hex: "F77D8E"))
            .foregroundColor(.white)
            .cornerRadius(20, corners: [.topRight, .bottomLeft, .bottomRight])
            .cornerRadius(8, corners: [.topLeft])
            .shadow(color: Color(hex: "F77D8E").opacity(0.5), radius: 20, x: 0, y: 10)
         
         HStack {
            Rectangle().frame(height: 1).opacity(0.1)
            Text("OR").customFont(.subheadline).foregroundColor(.black.opacity(0.3))
            Rectangle().frame(height: 1).opacity(0.1)
         }
         
         Text("Sign up with email, Apple or Google").customFont(.subheadline)
            .foregroundColor(.secondary)
         
         
         HStack{
            Image("Logo Email")
            Spacer()
            Image("Logo Apple")
            Spacer()
            Image("Logo Google")
         }
      }.padding(30)
         .background(.regularMaterial)
         .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
         .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y:3)
         .shadow(color: Color.shadow.opacity(0.3), radius: 30, x: 0, y: 30 )
         .overlay{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
               .stroke(.linearGradient(colors: [.white.opacity(0.8),.white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
         }
         .padding()
   }
}

#Preview {
    SignInView()
}
