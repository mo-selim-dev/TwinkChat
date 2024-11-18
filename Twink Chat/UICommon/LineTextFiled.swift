//
//  LineTextFiled.swift
//  App1
//
//  Created by Mohamed Selim on 11/1/24.
//

import SwiftUI

struct LineTextFiled: View {
    @Binding var txt: String
    @State var title: String = "Title"
    @State var placeholder: String = "Placeholder"
    
    var body: some View {
        
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            TextField(placeholder, text: $txt)

            Divider()
        }

    }
}

//#Preview {
//    @State static var txt: String = ""
//
//    LineTextFiled(text: $txt)
//    .padding(20)
//}

//struct LineTextFiledTests_Previews:PreviewProvider {
//    @State static var txt: String = ""
//    static var previews: some View{
//        LineTextFiled(txt: $txt)
//            .padding(20)
//    }
//}
