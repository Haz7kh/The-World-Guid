//
//  View.swift
//  Qatar 2022
//
//  Created by Khaled Almelhem on 2022-10-21.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
    
    func defaultBackgroundView() -> some View {
        background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9881121516, green: 0.9882771373, blue: 0.9880903363, alpha: 1)), Color.white]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
    }
    
}
