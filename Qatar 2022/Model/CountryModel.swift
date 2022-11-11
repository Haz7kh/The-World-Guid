//
//  CountryModel.swift
//  The World Guid
//
//  Created by Khaled Almelhem on 2022-10-10.
//

import Foundation

struct Country : Codable ,Identifiable {
    

    let  id: Int
    let  name:String
    let  code: String
    let headline: String
}
