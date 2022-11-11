//
//  NewMatchView.swift
//  Qatar 2022
//
//  Created by Khaled Almelhem on 2022-10-13.
//

import Foundation


struct NewMatches : Codable,Identifiable {
    let id:Int
    let MatchNumber : Int
    let RoundNumber : Int
    let DateUtc : String
    let Location : String
    let HomeTeam : String
    let AwayTeam : String
    let Group : String
    let HomeTeamScore: Int
    let AwayTeamScore: Int
    
}
