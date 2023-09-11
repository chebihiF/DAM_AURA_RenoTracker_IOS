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
        VStack{
            TextField("Ronavation area", text: $renovationProject.renovationArea)
                .disableAutocorrection(true)
            DatePicker(selection: $renovationProject.dueDate, displayedComponents: .date){
                Text("Due Date")
            }.datePickerStyle(CompactDatePickerStyle())
            
            HStack{
                Text("Work Qualit Rating")
                Spacer()
                Picker(selection: $renovationProject.workQuality, label:
                    Text(renovationProject.workQuality.rawValue)){
                    ForEach(RenovationProject.WorkQualityRating.allCases.reversed(), id: \.self){
                        workQualityRating in
                        Text(workQualityRating.rawValue).tag(workQualityRating)
                    }
                }.pickerStyle(MenuPickerStyle())
            }
            Divider()
            Text("Punch List").font(.headline)
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
