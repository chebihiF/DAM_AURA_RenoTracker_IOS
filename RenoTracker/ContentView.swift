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
            VStack{
                Text("Punch List")
                Text("Remodel front desk")
                Text("Retile entry")
                Text("Replace Light fixtures")
                Text("Paint walls")
                Text("Hang new artWork")
            }
            // MARK: Budget section
            VStack{
                Text("Budget")
                HStack{
                    Text("Amount Allocated: ")
                    Text("$15,000")
                }
                HStack{
                    Text("Spent to-date: ")
                    Text("$8,350")
                }
                HStack{
                    Text("Amount remaining: ")
                    Text("$6,660")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
