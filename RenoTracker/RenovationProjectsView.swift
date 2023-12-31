//
//  RenovationProjectsView.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 7/9/2023.
//

import SwiftUI

struct RenovationProjectsView: View {
    
    @Binding var renovationProjects: [RenovationProject] //recive $renovationProjects from @main
    
    var body: some View {
        NavigationView{
            List{
                ForEach(renovationProjects){ renovationProject in  // renovationProject = copy of renovationProjects element
                    
                    let projectIndex = renovationProjects.firstIndex(where: {
                        $0.id == renovationProject.id })!
                    
                    let renovationProjectsBinding = $renovationProjects[projectIndex] // $T[0]
                    
                    
                    NavigationLink(
                        destination: DetailView(renovationProject: renovationProjectsBinding),
                        label: { RenovationProjectRow(renovationProject: renovationProject) })
                    
                }
                
            }
            .navigationTitle("Home")
        }
    }
}

struct RenovationProjectsView_Previews: PreviewProvider {
    
    struct StateFullPreviewWrapper: View {
        @State private var testProjects = RenovationProject.testData
        var body: some View {
            RenovationProjectsView(renovationProjects: $testProjects)
        }
    }
   
    static var previews: some View {
        StateFullPreviewWrapper()
    }
}
