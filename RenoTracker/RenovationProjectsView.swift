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
                ForEach(renovationProjects){ renovationProject in
                    NavigationLink(
                        destination: DetailView(renovationProject: renovationProject),
                        label: { RenovationProjectRow(renovationProject: renovationProject) })
                    
                }
                
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
