//
//  MatchesView.swift
//  The World Guid
//
//  Created by Khaled Almelhem on 2022-10-11.
//

import SwiftUI



struct MatchesView: View {
    var body: some View {
        let matche: [Matches] = Bundle.main.decode("matches.json")
        ZStack {
            NavigationView {
                
                VStack {
                    Image("stage")
                        .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                 
                   //.padding()
                    List {
                        ForEach(matche) { matches in
                            MatchListView(matche: matches)
                                .padding(.vertical,2)
                                .cornerRadius(20)
                        }
                        .background(.yellow)
                    }
                    
                    .navigationBarTitle("Matches", displayMode: .inline)
                
                
                }
              
            }
            
        }
       
        
    }
      
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
            
    }
}
