//
//  RenovationProjectRow.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 7/9/2023.
//

import SwiftUI

struct RenovationProjectRow: View {
    var renovationProject: RenovationProject
    
    var body: some View {
        VStack{
            HStack(alignment: .top){
                Image(renovationProject.imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack(alignment: .leading) {
                    Text(renovationProject.renovationArea)
                        .font(.headline)
                    VStack(alignment: .leading){
                        Label("Due on \(renovationProject.formattedDueDate)", systemImage: "calendar")
                        Label("\(renovationProject.totalPunchListItems) items", systemImage: "wrench.and.screwdriver.fill")
                        Label("\(renovationProject.formattedPercentComplete) complete", systemImage: "percent")
                        Label("\(renovationProject.budgetAmountRemaining < 0 ? "Over budget" : "On Budget")", systemImage: "dollarsign.circle")
                            .foregroundColor(renovationProject.budgetAmountRemaining < 0 ? .red : .accentColor)
                    }
                    .font(.callout)
                    .foregroundColor(.accentColor)
                }
            }
            Spacer()
        }
    }
}

struct RenovationProjectRow_Previews: PreviewProvider {
    static var previews: some View {
        RenovationProjectRow(renovationProject: RenovationProject.testData[0])
    }
}
