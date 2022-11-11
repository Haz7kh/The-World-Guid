//
//  InfoListView.swift
//  Qatar 2022
//
//  Created by Khaled Almelhem on 2022-10-21.
//

import SwiftUI
import UIKit
import URLImage

enum SourceType {
    case photoLibrary
    case camera
}

struct UserImgListView: View {
    
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    @State private var originalImage: UIImage? = nil
    @State private var name: String = ""
    @State private var showActionSheet: Bool = false
    @State private var sourceType: SourceType = .photoLibrary
    @StateObject private var userListVM = InfoViewModel()
    private func savePhoto() {
        
        if let originalImage = originalImage {
            if let resizedImage = originalImage.resized(width: 1024){
                if let data = resizedImage.pngData(){
                    userListVM.uploadPhoto(data: data) {(url) in
                        if let url = url {
                            userListVM.save(name: name, url: url) { error in
                                if let error = error {
                                    print(error.localizedDescription)
                                } else {
                                    // to refresh the new data (photo)
                                    userListVM.getAllPhotoForUser()
                                }
                                image = nil
                                
                            }
                        }
                    }
                }
            }
        }
    }
    var body: some View {
        ZStack {
            VStack{
                
                if userListVM.photo.count > 0 {
                    List(userListVM.photo, id: \.photoId) { photo in
                        // read the photo info from the database// after we add URLImage package
                        VStack {
                            URLImage(URL(string: photo.photoUrl)!) { image in
                                image.resizable()
                                    .aspectRatio( contentMode: .fit)
                                
                            }
                            Text(photo.name)
                        }
                        
                    }
                } else if userListVM.photo.count == 0 {
                    EmptyDataView()
                }
                Spacer()
            }
           
            if image != nil {
                PhotoPreviewView(image: $image, name: $name, save: {
                    savePhoto()
                }).shadow(color: Color(.black), radius: 16, x: -5, y: -5)
                    .shadow(color: Color(.white), radius: 16, x: -8, y: -8)
            }
            
        }.navigationTitle("User Data")
        .navigationBarItems(trailing: Button(action: {
            // show camera
            showActionSheet = true
        }, label: {
            Image(systemName: "camera")
                .font(.title)
        })
        .actionSheet(isPresented: $showActionSheet, content: {
            ActionSheet(title: Text("Select"), message: nil, buttons: [
                .default(Text("Photo Library")) {
                    showImagePicker = true
                    sourceType = .photoLibrary
                },
                .default(Text("Camera")) {
                    showImagePicker = true
                    sourceType = .camera
                },
                .cancel()
            ])
        })
        
        
        )
        .sheet(isPresented: $showImagePicker, content: {
            PhotoCaptureView(showImagePicker: $showImagePicker, image: $image, originalImage: $originalImage, sourceType: sourceType)
        })
    .onAppear(perform: {
        userListVM.getAllPhotoForUser()
    })
    }
}

struct UserImgListView_Previews: PreviewProvider {
    static var previews: some View {
        UserImgListView().embedInNavigationView()
    }
}

struct PhotoPreviewView: View {
    
    @Binding var image: Image?
    @Binding var name: String
    let save: () -> Void
    
    var body: some View {
        
        
        ZStack {
            VStack {
                    image?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    
                    TextField("Enter name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                   
                    Button("Save") {
                        save()
                        image = nil
                    }.buttonStyle(PrimaryButtonStyle())
            }.padding()
        }.background(Color(#colorLiteral(red: 0.904804647, green: 0.9049565196, blue: 0.904784739, alpha: 1)))
        
        .cornerRadius(10)
        .offset(y: 0)
        .padding()
        
    }
}

