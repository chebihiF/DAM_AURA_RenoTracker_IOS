//
//  EditView.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 7/9/2023.
//

import SwiftUI

struct EditView: View {
    
    @Binding var renovationProject: RenovationProject
    
    var body: some View {
        Form{
            Section(header: Text("Project Info")){
                TextField("Ronavation area", text: $renovationProject.renovationArea)
                    .disableAutocorrection(true)
                DatePicker(selection: $renovationProject.dueDate, displayedComponents: .date){
                    Text("Due Date")
                }.datePickerStyle(CompactDatePickerStyle())
                
                HStack{
                    
                    Picker(selection: $renovationProject.workQuality, label:
                        Text("Work Quality Rating")){
                        ForEach(RenovationProject.WorkQualityRating.allCases.reversed(), id: \.self){
                            workQualityRating in
                            Text(workQualityRating.rawValue).tag(workQualityRating)
                        }
                    }.pickerStyle(DefaultPickerStyle())
                }
                Toggle(isOn: $renovationProject.isFlagged, label: {
                    Text("Flagged for review")
                })
            }
            Section(header: Text("Punch List")){
                ForEach(renovationProject.punchList, id: \.task){ punchListItem in
                    
                    // get the puchListItem reference
                    let punchListItemIndex = renovationProject.punchList.firstIndex(where: {
                        $0.task == punchListItem.task })!
                    let puchListItemBinding = $renovationProject.punchList[punchListItemIndex]
                    
                    VStack(alignment: .leading){
                        Text(punchListItem.task)
                        Picker("Punch List", selection: puchListItemBinding.status){
                            Text("Not Started").tag(PunchListItem.CompletionStatus.notStarted)
                            Text("In Progress").tag(PunchListItem.CompletionStatus.inProgress)
                            Text("Complete").tag(PunchListItem.CompletionStatus.complete)
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    
                }
            }
            
            Section(header: Text("Budget")){
                TextField("Spent To-Date", value: $renovationProject.budgetSpentToDate, formatter: NumberFormatter())
            }
            
            
        }
    }
}







struct EditView_Previews: PreviewProvider {
    
    struct StateFullPreviewWrapper: View {
        @State private var testProject = RenovationProject.testData[0]
        var body: some View {
            EditView(renovationProject: $testProject)
        }
    }
    
    static var previews: some View {
        StateFullPreviewWrapper()
    }
}
