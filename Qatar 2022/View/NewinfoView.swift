//
//  NewinfoView.swift
//  Qatar 2022
//
//  Created by Khaled Almelhem on 2022-10-16.
//

import SwiftUI

struct NewinfoView: View {
    @EnvironmentObject var dataManger :DataManger
    @State private var newNote = ""
    var body: some View {
        VStack {
            TextField("Note", text: $newNote)
            Button(action: {
                dataManger.addNote(note: newNote)
                   
            }, label: {
                Text("Add")
            }
            )
        }
        .padding()
    }
}

struct NewinfoView_Previews: PreviewProvider {
    static var previews: some View {
        NewinfoView()
    }
}
