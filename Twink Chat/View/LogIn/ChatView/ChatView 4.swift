//import SwiftUI
//import PhotosUI
//
//struct Message: Identifiable {
//    let id = UUID()
//    let text: String?
//    let image: UIImage?
//    let isSentByCurrentUser: Bool
//    let timestamp: Date
//}
//
//struct ChatView: View {
//    @State private var messages: [Message] = [
//        Message(text: "مرحباً بك في TwinkChat!", image: nil, isSentByCurrentUser: false, timestamp: Date())
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
//                    VStack(alignment: .leading, spacing: 15) {
//                        ForEach(messages) { message in
//                            HStack {
//                                if message.isSentByCurrentUser {
//                                    Spacer()
//                                    MessageBubble(message: message, backgroundColor: Color.green.opacity(0.9), textColor: .white)
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
//        let message = Message(text: newMessage, image: nil, isSentByCurrentUser: true, timestamp: Date())
//        messages.append(message)
//        newMessage = ""
//    }
//    
//    // دالة لإرسال الصور
//    private func sendImage(_ image: UIImage) {
//        let message = Message(text: nil, image: image, isSentByCurrentUser: true, timestamp: Date())
//        messages.append(message)
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
//// عرض الفقاعة لرسالة مشابهة لتصميم واتساب
//struct MessageBubble: View {
//    let message: Message
//    let backgroundColor: Color
//    let textColor: Color
//    
//    var body: some View {
//        VStack(alignment: message.isSentByCurrentUser ? .trailing : .leading) {
//            if let image = message.image {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 150, height: 150)
//                    .cornerRadius(15)
//                    .shadow(radius: 5)
//            } else if let text = message.text {
//                Text(text)
//                    .padding()
//                    .background(backgroundColor)
//                    .foregroundColor(textColor)
//                    .cornerRadius(15)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 15)
//                            .stroke(backgroundColor.opacity(0.3), lineWidth: 0.5)
//                    )
//            }
//            
//            Text("\(formatDate(message.timestamp))")
//                .font(.caption2)
//                .foregroundColor(.gray)
//                .padding(message.isSentByCurrentUser ? .trailing : .leading, 10)
//        }
//        .padding(.horizontal, message.isSentByCurrentUser ? 10 : 15)
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
