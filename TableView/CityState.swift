//
//  CityState.swift
//  TableView
//
//  Created by Nestor on 11/25/24.
//

import Foundation

struct CityState {
    var city: String
    var state: String
    
    init(_ city: String, _ state: String) {
        self.city = city
        self.state = state
    }
    
    static func fullName(for abbreviation: String) -> String {
        let stateFullNames: [String: String] = [
            "AL": "Alabama",
            "GA": "Georgia",
            "IL": "Illinois",
            "NY": "New York",
            "CA": "California",
            "TX": "Texas",
            "AZ": "Arizona",
            "AR": "Arkansas",
            "CO": "Colorado"
            
        ]
        return stateFullNames[abbreviation] ?? abbreviation
    }
}
