//
//  RenovationProject+.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 8/9/2023.
//

import Foundation
import SwiftUI

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
    
    var budgetAmountRemaining: Double {
        budgetAmountAllocated - budgetSpentToDate
    }
    
    var budgetStatus: BudgetStatus {
        budgetAmountRemaining >= 0 ? .onBudget : .overBudget // condition ? result if true : result if false
    }
    
    var formattedBudgetAmountAllocated: String {
        self.currencyFormatter.string(from: NSNumber(value: budgetAmountAllocated)) ?? "unknown"
    }
    
    var formattedBudgetSpentToDate: String {
        self.currencyFormatter.string(from: NSNumber(value: budgetSpentToDate)) ?? "unknown"
    }
    
    var formattedBudgetAmountRemaining: String {
        self.currencyFormatter.string(from: NSNumber(value: budgetAmountRemaining)) ?? "unknown"
    }
    
    var budgetStatusSymbol: Image {
        budgetStatus == .onBudget ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "x.circle.fill")
    }
    
    var budgetStatusForegroundColor: Color {
        budgetStatus == .onBudget ? .green : .red
    }
    
    private var currencyFormatter: NumberFormatter {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        return currencyFormatter
    }
    
}
