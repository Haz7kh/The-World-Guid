//
//  Matches.swift
//  The World Guid
//
//  Created by Khaled Almelhem on 2022-10-11.
//

import Foundation

struct Matches : Codable, Identifiable {
    
    let id: Int
    let venue:String
    let home_team_country:String
    let away_team_country:String
    let location: String
  
   
    
}
