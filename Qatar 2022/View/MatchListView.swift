//
//  MatchListView.swift
//  The World Guid
//
//  Created by Khaled Almelhem on 2022-10-11.
//

import SwiftUI

struct MatchListView: View {
    let matche: Matches
    var body: some View {
        ZStack {
            Color("haz")
                .ignoresSafeArea(.all,edges: .all)
            VStack(alignment: .center,spacing:8){
              Image(systemName:"figure.socialdance")
                .foregroundColor(.white)
                .font(.title)
                
           
                Text("Match Number #: \(matche.id)")
                Text("Staduim : \(matche.venue)")
                Text("Match : \(matche.home_team_country) VS \(matche.away_team_country) ")
                Text("Location :\(matche.location)")
            }
            .foregroundColor(.white)
            .font(.title3)
            .fontWeight(.medium)
        .padding()
        }
        
        
    }
       
}

struct MatchListView_Previews: PreviewProvider {
    static let matches : [Matches] =
    Bundle.main.decode("matches.json")
    static var previews: some View {
        MatchListView(matche: matches[0])
            .previewLayout(.sizeThatFits)
            .padding()
         
            
            
    }
}
