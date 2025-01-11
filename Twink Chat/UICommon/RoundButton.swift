//
//  RoundButton.swift
//  App1
//
//  Created by Mohamed Selim on 10/31/24.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Tittle"
    @State var myColor: Color 
    var didTap: (()->())?
    var body: some View {
        Button {
            didTap?()
        }label: {
            Text(title)
                .font(.customfont(.semibold, fontSize: 18))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
        .background(myColor)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
        
    }
}

#Preview {
    RoundButton(myColor: .primary)
        .padding(20)
}
