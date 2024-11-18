////
////  Message.swift
////  Twink Chat
////
////  Created by Mohamed Selim on 09/11/2024.
////
//
//
//import SwiftUI
//import PhotosUI
//
//struct Message: Identifiable {
//    let id = UUID()
//    let text: String?
//    let image: UIImage?
//    let isSentByCurrentUser: Bool
//    let timestamp: Date
//    var isRead: Bool = false
//}
//
//struct ChatView: View {
//    @State private var messages: [Message] = [
//        Message(text: "تsdjkfnلحمد لله رب العالمين", image: nil, isSentByCurrentUser: true, timestamp: Date(), isRead: true)
//    ]
//    @State private var newMessage: String = ""
//    @State private var showingImagePicker = false
//    @State private var selectedImage: UIImage?
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                // قائمة الرسائل
//                ScrollView {
//                    VStack(alignment: .leading, spacing: 10) {
//                        ForEach(messages) { message in
//                            HStack {
//                                if message.isSentByCurrentUser {
//                                    Spacer()
//                                    MessageBubble(message: message, backgroundColor: Color("whatsappGreen"), textColor: .white)
//                                } else {
//                                    MessageBubble(message: message, backgroundColor: Color(UIColor.systemGray4), textColor: .black)
//                                    Spacer()
//                                }
//                            }
//                        }
//                    }
//                    .padding()
//                }
//                
//                // حقل الإدخال وزر الإرسال وزر إضافة المرفقات
//                HStack {
//                    Button(action: {
//                        showingImagePicker = true
//                    }) {
//                        Image(systemName: "paperclip")
//                            .font(.title)
//                            .padding()
//                            .foregroundColor(.blue)
//                    }
//                    
//                    TextField("اكتب رسالة...", text: $newMessage)
//                        .padding()
//                        .background(Color.gray.opacity(0.2))
//                        .cornerRadius(10)
//                    
//                    Button(action: {
//                        sendMessage()
//                    }) {
//                        Image(systemName: "paperplane.fill")
//                            .font(.title)
//                            .padding()
//                            .foregroundColor(.blue)
//                    }
//                }
//                .padding(.horizontal)
//                .padding(.bottom, 20)
//                .sheet(isPresented: $showingImagePicker) {
//                    ImagePicker(image: $selectedImage)
//                }
//                .onChange(of: selectedImage) { _ in
//                    if let selectedImage = selectedImage {
//                        sendImage(selectedImage)
//                        self.selectedImage = nil
//                    }
//                }
//            }
//            .navigationTitle("TwinkChat")
//            .background(Color.white.ignoresSafeArea()) // خلفية بيضاء
//        }
//    }
//    
//    // دالة لإرسال الرسالة النصية
//    private func sendMessage() {
//        guard !newMessage.isEmpty else { return }
//        
//        let message = Message(text: newMessage, image: nil, isSentByCurrentUser: true, timestamp: Date(), isRead: false)
//        messages.append(message)
//        newMessage = ""
//    }
//    
//    // دالة لإرسال الصور
//    private func sendImage(_ image: UIImage) {
//        let message = Message(text: nil, image: image, isSentByCurrentUser: true, timestamp: Date(), isRead: false)
//        messages.append(message)
//    }
//}
//
//// فقاعة الرسالة مع شكل يشبه واتساب
//struct MessageBubble: View {
//    let message: Message
//    let backgroundColor: Color
//    let textColor: Color
//    
//    var body: some View {
//        VStack(alignment: .trailing) {
//            HStack(alignment: .bottom) {
//                if let text = message.text {
//                    Text(text)
//                        .padding()
//                        .background(backgroundColor)
//                        .foregroundColor(textColor)
//                        .cornerRadius(15)
//                        .overlay(
//                            BubbleTailShape()
//                                .fill(backgroundColor)
//                                .frame(width: 10, height: 15)
//                                .offset(x: message.isSentByCurrentUser ? 6 : -6, y: 6),
//                            alignment: message.isSentByCurrentUser ? .bottomTrailing : .bottomLeading
//                        )
//                }
//                
//                if message.isSentByCurrentUser {
//                    Image(systemName: message.isRead ? "checkmark.circle.fill" : "checkmark.circle")
//                        .foregroundColor(message.isRead ? .blue : .gray)
//                        .font(.caption)
//                }
//            }
//            .padding(.horizontal, 10)
//            
//            Text(formatDate(message.timestamp))
//                .font(.caption2)
//                .foregroundColor(.gray)
//                .padding(.trailing, 5)
//        }
//        .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: message.isSentByCurrentUser ? .trailing : .leading)
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
//// تصميم الذيل لفقاعة الرسالة
//struct BubbleTailShape: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
//        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY), control: CGPoint(x: rect.maxX, y: rect.minY))
//        return path
//    }
//}
//
//// مكون لاختيار الصور من مكتبة الصور
//struct ImagePicker: UIViewControllerRepresentable {
//    @Binding var image: UIImage?
//    
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//        let picker = UIImagePickerController()
//        picker.delegate = context.coordinator
//        picker.mediaTypes = ["public.image", "public.movie"] // دعم الصور والفيديو
//        return picker
//    }
//    
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//    
//    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//        let parent: ImagePicker
//        
//        init(_ parent: ImagePicker) {
//            self.parent = parent
//        }
//        
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let uiImage = info[.originalImage] as? UIImage {
//                parent.image = uiImage
//            }
//            picker.dismiss(animated: true)
//        }
//        
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            picker.dismiss(animated: true)
//        }
//    }
//}
//
//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}
