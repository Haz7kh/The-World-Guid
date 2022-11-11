//
//  PhotoViewModel.swift
//  Qatar 2022
//
//  Created by Khaled Almelhem on 2022-11-04.
//

import Foundation

struct PhotoViewModel {
    let photo: Photo
    
    var photoId: String {
        photo.id ?? ""
    }
    var name: String{
        photo.name
    }
    var photoUrl: String {
        photo.url
    }
}
