//
//  LoginView.swift
//  Twink Chat
//
//  Created by Mohamed Selim on 09/11/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationStack {  // استخدام NavigationStack لتمكين التنقل بين الصفحات
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
                
                // حقول الإدخال
                VStack(spacing: 20) {
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
                
                // زر تسجيل الدخول
                Button(action: {
                    // Action for Log In
                }) {
                    Text("Log In")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding([.leading, .trailing], 30)
                .padding(.bottom, 10)
                
                // رابط لصفحة التسجيل باستخدام NavigationLink
                NavigationLink(destination: RegisterView()) {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.2))
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                }
                .padding([.leading, .trailing], 30)
                .padding(.bottom, 40)
            }
            .background(Color.white.ignoresSafeArea()) // خلفية بيضاء
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
