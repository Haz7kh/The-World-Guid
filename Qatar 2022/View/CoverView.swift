//
//  CoverView.swift
//  The World Guid
//
//  Created by Khaled Almelhem on 2022-10-10.
//

import SwiftUI

struct CoverView: View {
    
    let coverImgs : [CoverImg] =
    Bundle.main.decode("covers.json")
    
    var body: some View {
        ZStack {
            TabView{
                ForEach(coverImgs) { item in
                    Image(item.name)
                         .resizable()
                         .scaledToFit()
                     .cornerRadius(10)
                     .frame(width: 400, height: 300
                     )
                   
                }
                  
            }
            .tabViewStyle(PageTabViewStyle())
           
        }
       
      
    }
}

struct CoverView_Previews: PreviewProvider {
    static var previews: some View {
        CoverView()
            .previewLayout(.fixed(width: 400, height: 300))
            
            
        
    }
}
