//
//  RenoTrackerApp.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 6/9/2023.
//

import SwiftUI

@main
struct RenoTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            RenovationProjectsView(renovationProjects: RenovationProject.testData)
        }
    }
}
