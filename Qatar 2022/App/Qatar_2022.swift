//
//  The_World_GuidApp.swift
//  The World Guid
//
//  Created by Khaled Almelhem on 2022-10-10.
//

import SwiftUI
import Firebase

@main
struct Qatar_2022: App {
    
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
                
        }
    }
}
