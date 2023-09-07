//
//  ContentView.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 6/9/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            // MARK: Header Section
            VStack(alignment: .leading){
                Text("Front Lobby")
                    .font(.largeTitle)
                Image("front-lobby")
                    .resizable()
                    .scaledToFit()
            }
            
            // MARK: Status section
            VStack{
                Text("Due on Sunday, August 1, 2023")
                ProgressView(value: 0.6)
                Text("60% Complete")
                Text("Work Quality : Good")
                HStack{
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star")
                }.foregroundColor(.yellow)

                Text("FLAGGED FOR REVIEW")
            }
            Divider()
            
            // MARK: Punch List section
            VStack(alignment: .leading){
                Text("Punch List")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                Label("Remodel front desk", systemImage: "checkmark.circle")
                Label("Retile entry", systemImage: "checkmark.circle")
                Label("Replace Light fixtures", systemImage: "checkmark.circle")
                Label("Paint walls", systemImage: "asterisk.circle")
                Label("Hang new artWork", systemImage: "circle")
            }
            Divider()
            
            // MARK: Budget section
            VStack(alignment: .leading){
                Text("Budget")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                
                HStack{
                    Text("Amount Allocated: ")
                    Spacer()
                    Text("$15,000")
                }
                HStack{
                    Text("Spent to-date: ")
                    Spacer()
                    Text("$8,350")
                        .underline()
                }
                HStack{
                    Text("Amount remaining: ")
                    Spacer()
                    Text("$6,660")
                        .bold()
                }
            }
            Spacer()
        }
        .padding(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
