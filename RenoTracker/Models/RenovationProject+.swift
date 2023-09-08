//
//  RenovationProject+.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 8/9/2023.
//

import Foundation

// add ID as projectNumber to RenovationProject
extension RenovationProject: Identifiable{
    var id: Int {
        self.projectNumber
    }
}

extension RenovationProject {
    
    var formattedDueDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: dueDate)
    }
    
    var totalPunchListItems: Int {
        punchList.count // total
    }
    
    var precentComplete: Double { // 10/20 = 0.5
        // filer data => get puchItem with status complete
        let completePuchListItems = punchList.filter { punchListItem in punchListItem.status == .complete}
        let prencentComplete = Double(completePuchListItems.count)/Double(totalPunchListItems)
        return prencentComplete
    }
    
    var formattedPercentComplete: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        return formatter.string(from: NSNumber(value: precentComplete)) ?? "0%" // 50%
    }
    
}
