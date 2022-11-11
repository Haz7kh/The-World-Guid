//
//  ContentView.swift
//  The World Guid
//
//  Created by Khaled Almelhem on 2022-10-10.
//

import SwiftUI

struct ContentView: View {
 
    var body: some View {
        
        let country: [Country] = Bundle.main.decode("cpc.json")
        ZStack {
            
            VStack {
                NavigationView{
                   
                   List {
                       CoverView()
                           .frame(height: 200)
                           .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                           .padding(.bottom,20)
                          // .background(.yellow)
                        
                       
                       ForEach(country) { item in
                           NavigationLink(destination: TeamDetailsView(country: item)){
                               CountriesListView(country: item)
                              
                           }
                          
                       }
                       .background(.yellow)
                   }
                   .navigationBarTitle("Qatar 2022", displayMode:.inline)
                   
                   
                  
                   
                   
                   
                }
                
            }
           
            
        }
       
        
        
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
            
            
    }
}
