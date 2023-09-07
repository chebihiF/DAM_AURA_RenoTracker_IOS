//
//  RenovationProjectsView.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 7/9/2023.
//

import SwiftUI

struct RenovationProjectsView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink(
                    destination: DetailView(),
                    label: {
                        Text("Reno 1")
                    }
                    )
            }
            .navigationTitle("Home")
        }
    }
}

struct RenovationProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        RenovationProjectsView()
    }
}
