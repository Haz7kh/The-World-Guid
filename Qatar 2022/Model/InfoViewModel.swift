//
//  InfoViewModel.swift
//  Qatar 2022
//
//  Created by Khaled Almelhem on 2022-10-19.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestoreSwift

class InfoViewModel: ObservableObject {

    let storage = Storage.storage()
    let db = Firestore.firestore()
    @Published var photo: [PhotoViewModel] = []
    
    func getAllPhotoForUser () {
        
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        db.collection("photo")
            .whereField("userId", isEqualTo: currentUser.uid)
            .getDocuments{[weak self]
                (snapshot, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        if let snapshot = snapshot {
                            let photo : [PhotoViewModel] = snapshot.documents.compactMap{ doc in
                                var photo = try? doc.data(as: Photo.self)
                                photo?.id = doc.documentID
                                if let photo = photo{
                                    return PhotoViewModel(photo: photo)
                                }
                                return nil
                            }
                            DispatchQueue.main.async {
                                self?.photo = photo
                            }
                        }
                    }
                }
            
    }
    
    
    func save(name:String, url:URL, completion: (Error?) -> Void) {
        
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        do {
        let _ =   try  db.collection("photo")
                .addDocument(from:Photo(name: name, url: url.absoluteString, userId: currentUser.uid))
                             completion(nil)
        } catch let error{
            completion(error)
        }
        
    }
    
    
    
    func uploadPhoto(data : Data, complation : @escaping (URL?) ->  Void) {
        
        let imgName = UUID().uuidString
        let storageRef = storage.reference()
        let photoRef = storageRef.child("Images : \(imgName).png")
        photoRef.putData(data, metadata: nil) {metadata, error in
            photoRef.downloadURL{(url, error)in
                if let error = error {
                    print(error.localizedDescription)
                }else {
                    complation(url)
                }
            }
            
        }
        
    }

}
