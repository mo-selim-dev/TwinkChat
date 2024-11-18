//
//  ChatView.swift
//  Twink Chat
//
//  Created by Mohamed Selim on 09/11/2024.
//

//import SwiftUI
//
//struct ChatView: View {
//    @State private var message: String = "" // لتخزين الرسالة المكتوبة
//
//    var body: some View {
//        VStack(spacing: 0) {
//            // الشريط العلوي
//            HStack {
//                Button(action: {
//                    // Action for Back Button
//                    print("Back tapped")
//                }) {
//                    HStack {
//                        Image(systemName: "chevron.left")
//                        Text("Back")
//                    }
//                    .foregroundColor(.blue)
//                }
//                Spacer()
//            }
//            .padding()
//            .background(Color.purple)
//            .foregroundColor(.white)
//
//            // Placeholder for Table View (مكان الرسائل)
//            VStack {
//                Text("Table View")
//                    .font(.title)
//                    .foregroundColor(.gray)
//                Text("Prototype Content")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.gray.opacity(0.2)) // اللون الرمادي كخلفية للمحتوى
//
//            // شريط الكتابة في الأسفل
//            HStack {
//                TextField("Write a message...", text: $message)
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(20)
//                    .padding(.horizontal)
//
//                Button(action: {
//                    // Action for sending the message
//                    print("Message sent: \(message)")
//                    message = "" // Reset after sending
//                }) {
//                    Image(systemName: "paperplane.fill")
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.purple)
//                        .clipShape(Circle())
//                }
//                .padding(.trailing)
//            }
//            .padding(.bottom, 10)
//            .background(Color.purple)
//        }
//        .edgesIgnoringSafeArea(.bottom) // للتأكد من أن الشريط السفلي يصل إلى نهاية الشاشة
//    }
//}
//
//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}
//







//--------------------------------------
//
//import SwiftUI
//
//struct ChatView: View {
//    @State private var messages: [String] = []
//    @State private var newMessage: String = ""
//    
//    var body: some View {
//        VStack {
//            // قائمة الرسائل
//            ScrollView {
//                VStack(alignment: .leading, spacing: 10) {
//                    ForEach(messages, id: \.self) { message in
//                        HStack {
//                            Text(message)
//                                .padding()
//                                .background(Color.blue.opacity(0.2))
//                                .cornerRadius(10)
//                            Spacer()
//                        }
//                    }
//                }
//                .padding()
//            }
//            
//            // خط لإدخال رسالة جديدة وزر الإرسال
//            HStack {
//                TextField("اكتب رسالة...", text: $newMessage)
//                    .padding()
//                    .background(Color.gray.opacity(0.2))
//                    .cornerRadius(10)
//                
//                Button(action: {
//                    if !newMessage.isEmpty {
//                        messages.append(newMessage)
//                        newMessage = ""
//                    }
//                }) {
//                    Image(systemName: "paperplane.fill")
//                        .font(.title)
//                        .padding()
//                        .foregroundColor(.blue)
//                }
//            }
//            .padding()
//        }
//        .navigationBarTitle("الرسائل", displayMode: .inline)
//    }
//}
//
//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}

//-----------------------------------------

//import SwiftUI
//
//struct Message: Identifiable {
//    let id = UUID()
//    let text: String
//    let isSentByCurrentUser: Bool
//    let timestamp: Date
//}
//
//struct ChatView: View {
//    @State private var messages: [Message] = [
//        Message(text: "مرحباً بك في TwinkChat!", isSentByCurrentUser: false, timestamp: Date())
//    ]
//    @State private var newMessage: String = ""
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                // قائمة الرسائل
//                ScrollView {
//                    VStack(alignment: .leading, spacing: 15) {
//                        ForEach(messages) { message in
//                            HStack(alignment: .bottom) {
//                                if !message.isSentByCurrentUser {
//                                    Image(systemName: "person.circle.fill")
//                                        .resizable()
//                                        .frame(width: 30, height: 30)
//                                        .foregroundColor(.gray)
//                                } else {
//                                    Spacer()
//                                }
//                                
//                                VStack(alignment: message.isSentByCurrentUser ? .trailing : .leading) {
//                                    Text(message.text)
//                                        .padding()
//                                        .background(message.isSentByCurrentUser ? Color.blue.opacity(0.2) : Color.gray.opacity(0.2))
//                                        .cornerRadius(10)
//                                        .foregroundColor(.black)
//                                    
//                                    Text("\(formatDate(message.timestamp))")
//                                        .font(.caption2)
//                                        .foregroundColor(.gray)
//                                        .padding(message.isSentByCurrentUser ? .trailing : .leading, 10)
//                                }
//                                
//                                if message.isSentByCurrentUser {
//                                    Image(systemName: "person.circle.fill")
//                                        .resizable()
//                                        .frame(width: 30, height: 30)
//                                        .foregroundColor(.blue)
//                                } else {
//                                    Spacer()
//                                }
//                            }
//                        }
//                    }
//                    .padding()
//                }
//                
//                // حقل الإدخال وزر الإرسال
//                HStack {
//                    TextField("اكتب رسالة...", text: $newMessage)
//                        .padding()
//                        .background(Color.gray.opacity(0.2))
//                        .cornerRadius(10)
//                        .padding(.leading, 20)
//                    
//                    Button(action: {
//                        sendMessage()
//                    }) {
//                        Image(systemName: "paperplane.fill")
//                            .font(.title)
//                            .padding()
//                            .foregroundColor(.blue)
//                    }
//                    .padding(.trailing, 20)
//                }
//                .padding(.bottom, 20)
//            }
//            .navigationTitle("TwinkChat")
//            .background(Color.white.ignoresSafeArea()) // خلفية بيضاء
//        }
//    }
//    
//    // دالة لإرسال الرسالة
//    private func sendMessage() {
//        guard !newMessage.isEmpty else { return }
//        
//        // إضافة الرسالة الجديدة إلى القائمة
//        let message = Message(text: newMessage, isSentByCurrentUser: true, timestamp: Date())
//        messages.append(message)
//        
//        // تفريغ حقل الإدخال
//        newMessage = ""
//        
//        // إضافة رسالة رد تلقائي للاختبار (محاكاة لدردشة)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            let replyMessage = Message(text: "شكرًا على رسالتك!", isSentByCurrentUser: false, timestamp: Date())
//            messages.append(replyMessage)
//        }
//    }
//    
//    // دالة لتنسيق التاريخ والوقت
//    private func formatDate(_ date: Date) -> String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .none
//        formatter.timeStyle = .short
//        return formatter.string(from: date)
//    }
//}
//
//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}
