//
//  WelcomeView.swift
//  Twink Chat
//
//  Created by Mohamed Selim on 09/11/2024.
//

import SwiftUI

struct WelcomeView: View {
    @State private var displayedText = ""   
    private let titleText = "TwinkChat"   
    @State private var charCount = 0        
    @State private var pulseEffect = false   
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack {
                    Image("welcomView")
                        .resizable()
                        .scaledToFit()
          //              .padding(.top, 50)
                    Spacer()
                    
                    VStack {
                        Image(systemName: "bolt.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.color2)
                            .scaleEffect(pulseEffect ? 1.2 : 1.0)   
                            .opacity(pulseEffect ? 0.6 : 1.0)   
                            .onAppear {
                                startTypingEffect()
                                startPulseEffect()   
                            }
                        
                        
                        Text(displayedText)
                            .font(.customfont(.bold, fontSize: 40))
                            .foregroundColor(Color(.color1))
                            .opacity(0.9)
                            .multilineTextAlignment(.center)

                        
                        Text("This is a simple application tested by me")
                            .font(.customfont(.medium, fontSize: 16))
                            .foregroundStyle(Color(.color1).opacity(0.7))
                            .multilineTextAlignment(.center)
                            .padding(.top, 5)
                    }
                    
                    Spacer()
                    
                     NavigationLink(destination: LoginView()) {
                        RoundButton(title: "Get Started", myColor: .color1)
                    }
                    
                    Spacer()
                        .frame(height: 60)
                }
                .padding(.horizontal, 20)
                .navigationTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }
        }
    }
    
    private func startTypingEffect() {
        charCount = 0
        displayedText = ""
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if charCount < titleText.count {
                let index = titleText.index(titleText.startIndex, offsetBy: charCount)
                displayedText.append(titleText[index])
                charCount += 1
            } else {
                timer.invalidate()   
            }
        }
    }
    
    private func startPulseEffect() {
        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 0.6)) {
                pulseEffect.toggle()   
            }
        }
    }
}

#Preview {
    WelcomeView()
}
