//
//  RenovationProjectsView.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 7/9/2023.
//

import SwiftUI

struct RenovationProjectsView: View {
    
    var renovationProjects: [RenovationProject]
    
    var body: some View {
        NavigationView{
            List{
                NavigationLink(
                    destination: DetailView(renovationProject: renovationProjects[0]),
                    label: { RenovationProjectRow(renovationProject: renovationProjects[0]) })
            }
            .navigationTitle("Home")
        }
    }
}

struct RenovationProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        RenovationProjectsView(renovationProjects: RenovationProject.testData)
    }
}
