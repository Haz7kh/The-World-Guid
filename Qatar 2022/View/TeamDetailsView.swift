//
//  TeamDetailsView.swift
//  Qatar 2022
//
//  Created by Khaled Almelhem on 2022-10-11.
//

import SwiftUI

struct TeamDetailsView: View {
    
    let country: Country
    var body: some View {
        ZStack {
            Color("haz")
            ScrollView (.vertical, showsIndicators: false){
                VStack (alignment: .center, spacing: 20){
                    Image(country.code)
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .frame(width: 400, height: 300)
                    Text(country.name)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text(country.headline)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding(.horizontal)
                }
                .navigationBarTitle("Information about \(country.name)", displayMode: .inline)
               
            }
        }
       
        
    }
}

struct TeamDetailsView_Previews: PreviewProvider {
    static let countries: [Country] =
    Bundle.main.decode("cpc.json")
    static var previews: some View {
        NavigationView{
            TeamDetailsView(country: countries[0])
               
        }
       
    }
}
