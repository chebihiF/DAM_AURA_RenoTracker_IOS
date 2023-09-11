//
//  ContentView.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 6/9/2023.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var renovationProject: RenovationProject
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Header(renovationProject: renovationProject)
            
            WorkQuality(renovationProject: renovationProject)
            
            Divider()
            
            PunchList(renovationProject: renovationProject)
            
            Divider()
            
            Budget(renovationProject: renovationProject)
            
            Spacer()
        }
        .padding(.all)
        .navigationTitle(renovationProject.renovationArea)
        .sheet(isPresented: .constant(false), content: {
            EditView()
        })
    }
}


// MARK: Header Section
struct Header: View {
    var renovationProject: RenovationProject
    var body: some View {
        VStack(alignment: .leading){
            Image(renovationProject.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 5)
                .overlay(
                    Text(renovationProject.isFlagged ? "FLAGGED FOR REVIEW" : "")
                        .padding(5)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.8))
                        .padding(),
                    alignment: .topTrailing
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 5)
                )
                .overlay(
                    ProgressInfoCard(renovationProject: renovationProject)
                        .padding(),
                    alignment: .bottom
                )
            
        }
    }
}

struct ProgressInfoCard: View {
    var renovationProject: RenovationProject
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.white)
                .opacity(0.9)
            
            VStack{
                HStack{
                    ProgressView(value: renovationProject.precentComplete)
                    // calcule
                    Text("\(renovationProject.formattedPercentComplete) Complete")
                }
                Text("Due on \(renovationProject.formattedDueDate)")
            }.padding()
            
        }.frame(width: 310, height: 100)
    }
}

// MARK: Status section
struct WorkQuality: View {
    var renovationProject: RenovationProject
    var body: some View {
        VStack{
            Text("Work Quality : Good")
                .font(.headline)
                .foregroundColor(.accentColor)
                .padding(.bottom, 2)
            
            WorkQualitySymbol
                .foregroundColor(renovationProject.workQuality == .na ? .gray : .yellow)
                .font(.title3)
                .accessibility(hidden: true)
        }
    }
    
    var WorkQualitySymbol: some View {
        HStack{
            
            //First Start
            if [.poor, .fair, .good, .excellent].contains(renovationProject.workQuality){
                Image(systemName: "star.fill")
            } else {
                Image(systemName: "star")
            }
            
            //Second Start
            if [.fair, .good, .excellent].contains(renovationProject.workQuality){
                Image(systemName: "star.fill")
            } else {
                Image(systemName: "star")
            }
            
            //Third Start
            if [.good, .excellent].contains(renovationProject.workQuality){
                Image(systemName: "star.fill")
            } else {
                Image(systemName: "star")
            }
            
            //Fourth Start
            if [.excellent].contains(renovationProject.workQuality){
                Image(systemName: "star.fill")
            } else {
                Image(systemName: "star")
            }
        }
    }
}



// MARK: Punch List section
struct PunchList: View {
    var renovationProject: RenovationProject
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Punch List")
                .font(.headline)
                .foregroundColor(.accentColor)
                .padding(.bottom, 2)
            
            ForEach(renovationProject.punchList, id: \.task) { punchListItem in
                Label(
                    title: { Text(punchListItem.task) },
                    icon: { punchListItem.completionStatusSymbol })
            }
        }
    }
}


// MARK: Budget section
struct Budget: View {
    var renovationProject: RenovationProject
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Budget")
                .font(.headline)
                .foregroundColor(.accentColor)
                .padding(.bottom, 2)
            
            Label(
                title: { Text(renovationProject.budgetStatus.rawValue) },
                icon: { renovationProject.budgetStatusSymbol
                    .foregroundColor(renovationProject.budgetStatusForegroundColor) }
            )
            
            HStack {
                Text("Amount Allocated:")
                Spacer()
                Text(renovationProject.formattedBudgetAmountAllocated)
            }
            
            HStack {
                Text("Spent to-date:")
                Spacer()
                Text(renovationProject.formattedBudgetSpentToDate)
                    .underline()
            }
            
            HStack {
                Text("Amount remaining:")
                    .bold()
                Spacer()
                Text(renovationProject.formattedBudgetAmountRemaining)
                    .bold()
            }
        }
    }
}



struct DetailView_Previews: PreviewProvider {
    
    struct StateFullPreviewWrapper: View {
        @State private var testProject = RenovationProject.testData[0]
        var body: some View {
            DetailView(renovationProject: $testProject)
        }
    }
    
    static var previews: some View {
        NavigationView{
            StateFullPreviewWrapper()
        }
    }
}
