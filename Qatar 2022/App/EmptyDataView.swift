////
////  AddInfoView.swift
////  Qatar 2022
////
////  Created by Khaled Almelhem on 2022-10-16.
////
//
import SwiftUI

struct EmptyDataView: View {
    var body: some View {
        VStack {
            Image("cover-2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
            
            Text("No Imges found!")
                .font(.title)
        }.padding()
    }
}

struct EmptyDataView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyDataView()
    }
}
