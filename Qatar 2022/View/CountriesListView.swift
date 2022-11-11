//
//  CountriesListView.swift
//  The World Guid
//
//  Created by Khaled Almelhem on 2022-10-10.
//

import SwiftUI

struct CountriesListView: View {
    let country: Country
    
    var body: some View {
        
        ZStack {
            Color("haz")
                .ignoresSafeArea(.all, edges: .all)
            VStack (alignment: .center, spacing: 8) {
                
                HStack {
                    Image( "\(country.code)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.accentColor)
                    .fontWeight(.heavy)
                }
                Text(country.name)
                
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.heavy)
               

            }
        }
       
    }
}

struct CountriesListView_Previews: PreviewProvider {
    static let cou : [Country] =
    Bundle.main.decode("cpc.json")
    static var previews: some View {
        CountriesListView(country: cou[0])
            .previewLayout(.sizeThatFits)
            .padding()
            
    }
}








