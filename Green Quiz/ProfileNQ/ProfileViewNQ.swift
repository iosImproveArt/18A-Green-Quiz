
import SwiftUI

struct ProfileViewGQ: View {
    @Environment(\.dismiss) var dismiss
    
    @State var userPhoto = ""
    @State var userName = ""
    @State var userNickname = ""
    
    @State var showActionSheetBB = false
    @State private var showImagePickerBB = false
    @State private var showCameraPickerBB = false
    @State var ev = false
    @FocusState var textfield
    @State var showAlert = false
    
    let fieldsColor = Color.hex("B35C5C")
    
    var ehngfjmr = "rfc3"
    var hbnegvcfjmk = 35
    func ghtrfjk() -> String {
        return "uhnefrijmko"
    }
    func rj4nufm() {
        print("gnmfr")
    }
    
    
    func ejufek() -> Int {
        print(2 + 3)
        return 2 + 3
    }
    var jrncfm = [352: "crfc"]
    var body: some View {
        VStack {
            Button {
                showActionSheetBB = true
            } label: {
                Group {
                    if userPhoto.isEmpty {
                        Image("user.label")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 200, maxHeight: 200)
                    } else {
                        Image(uiImage: UIImage(data: Data(base64Encoded: userPhoto)!)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(maxWidth: 200, maxHeight: 200)
                    }
                }.padding(.top)
            }.onAppear {
                userPhoto = UserDefaults.standard.string(forKey: "userPhoto") ?? ""
                userName = UserDefaults.standard.string(forKey: "userName") ?? ""
                userNickname = UserDefaults.standard.string(forKey: "userNickname") ?? "IamNewUser"
            }
            
            Spacer()
            
            HStack(spacing: 8) {
                
                Image("textfield")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay {
                        TextField("Whats your name?", text: $userName)
                            .padding(.horizontal, 15)
                            .foregroundColor(.white)
                            .padding(.horizontal, 6)
                    }
            }.padding(.vertical)
            
            
            HStack(spacing: 8) {
                Image("textfield")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay {
                        TextField("Whats your nickname?", text: $userNickname)
                            .padding(.horizontal, 15)
                            .foregroundColor(.white)
                            .padding(.horizontal, 6)
                    }
            }.padding(.bottom)
            
            
            Spacer()
            
            HStack {
                Button {
                    UserDefaults.standard.set(userPhoto, forKey: "userPhoto")
                    UserDefaults.standard.set(userName, forKey: "userName")
                    UserDefaults.standard.set(userNickname, forKey: "userNickname")
                    showAlert = true
                } label: {
                    Image("green.button.bg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay {
                            Text("Save")
                                .withFont(size: 18.6, weight: .regular, color: .hex("0D0D0D"))
                        }
                }
                
                Button {
                    UserDefaults.standard.set("", forKey: "userPhoto")
                    UserDefaults.standard.set("", forKey: "userName")
                    UserDefaults.standard.set("", forKey: "userNickname")
                    userName = ""
                    userNickname = ""
                    userPhoto = ""
                } label: {
                    Image("green.button.bg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay {
                            Text("Delete")
                                .withFont(size: 18.6, weight: .regular, color: .hex("0D0D0D"))
                        }
                }
            }
            
            Spacer()
            
        }.padding(.horizontal)
            .animation(.easeInOut, value: textfield)
            .actionSheet(isPresented: $showActionSheetBB) {
                ActionSheet(title: Text(""), buttons: [
                    .default(Text("Camera")) {
                        showCameraPickerBB = true
                    },
                    .default(Text("Photo Library")) {
                        showImagePickerBB = true
                    },
                    .cancel() // Кнопка скасування
                ])
            }
            .sheet(isPresented: $showImagePickerBB) {
                ImagePickerViewBB(showImagePicker: self.$showImagePickerBB) { image in
                    if let image = image {
                        if let compressedData = image.jpegData(compressionQuality: 0.01) {
                            self.userPhoto = compressedData.base64EncodedString()
                        }
                    }
                }.edgesIgnoringSafeArea(.all)
            }
            .sheet(isPresented: $showCameraPickerBB) {
                CameraPickerView(showImagePicker: self.$showCameraPickerBB) { image in
                    if let image = image {
                        if let compressedData = image.jpegData(compressionQuality: 0.01) {
                            self.userPhoto = compressedData.base64EncodedString()
                        }
                    }
                }.edgesIgnoringSafeArea(.all)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Saved!"),
                    message: Text("Successful data saving"),
                    dismissButton: .default(Text("OK"))
                )
            }
    }
}

#Preview {
    ContentViewGQ(showLoading: false, selectedTab: .profile)
}


