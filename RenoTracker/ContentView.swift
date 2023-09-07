//
//  ContentView.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 6/9/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // MARK: Header Section
            VStack{
                Text("Front Lobby")
                Text("<<<Photot Placeholder>>>") // TODO: Get photo and show here
            }
            // MARK: Status section
            VStack{
                Text("60% Complete")
                Text("Work Quality : Good")
                Text("Due on Sunday, August 1, 2023")
                Text("On Budget")
                Text("FLAGGED FOR REVIEW")
            }
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
