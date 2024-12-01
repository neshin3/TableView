//
//  DetailViewController.swift
//  TableView
//
//  Created by Nestor on 11/25/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var stateLabel: UILabel!
    var stateAbbreviation: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let abbreviation = stateAbbreviation {
            print("Received state abbreviation: \(abbreviation)")
            // Display the full name of the state
            stateLabel.text = CityState.fullName(for: abbreviation)
        } else {
            print("stateAbbreviation is nil")
            stateLabel.text = "No state provided"
        }
    }

}
