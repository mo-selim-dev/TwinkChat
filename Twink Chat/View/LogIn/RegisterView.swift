//
//  RegisterView.swift
//  Twink Chat
//
//  Created by Mohamed Selim on 09/11/2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            // الشعار
            VStack {
                Image(systemName: "bolt.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.yellow)
                
                Text("TwinkChat")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
            }
            .padding(.bottom, 50)
            
            Spacer()
            
            // حقول الإدخال (اسم المستخدم، البريد الإلكتروني، كلمة المرور)
            VStack(spacing: 20) {
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 30)
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 30)
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 30)
            }
            .padding(.bottom, 30)
            
            // زر التسجيل
            Button(action: {
                // Action for Register
            }) {
                Text("Register")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding([.leading, .trailing], 30)
            .padding(.bottom, 40)
        }
        .background(Color.white.ignoresSafeArea()) // خلفية بيضاء
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
