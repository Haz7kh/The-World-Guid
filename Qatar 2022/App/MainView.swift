//
//  MainView.swift
//  The World Guid
//
//  Created by Khaled Almelhem on 2022-10-11.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView {
            ContentView()
                .tabItem{
                    Image(systemName: "square.grid.2x2")
                    Text("Teams")
                }
            MatchesView()
                .tabItem{
                    Image(systemName: "soccerball")
                    Text("Matches")
                }
            LoginView()
                .tabItem{
                    Image(systemName: "person.crop.circle.fill")
                    Text("User Sign in/up")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        
    }
}
