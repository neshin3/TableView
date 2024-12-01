//
//  ViewController.swift
//  TableView
//
//  Created by Nestor on 11/25/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cities = [
        CityState("Auburn", "AL"),
        CityState("Atlanta", "GA"),
        CityState("Chicago", "IL"),
        CityState("New York", "NY"),
        CityState("Los Angeles", "CA"),
        CityState("Austin", "TX"),
        CityState("Tucson", "AZ"),
        CityState("Conway", "AR"),
        CityState("Dallas", "TX"),
        CityState("Denver", "CO")
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = cities[indexPath.row].city
        content.secondaryText = cities[indexPath.row].state
        cell.contentConfiguration = content
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completionHandler) in
            print("Deleted " + self.cities[indexPath.row].city)
            self.cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let detailVC = segue.destination as? DetailViewController else {
                print("Destination is not DetailViewController")
                return
            }
            
            guard let indexPath = sender as? IndexPath else {
                print("Sender is not IndexPath")
                return
            }

            // Assigns the state abbreviation
            detailVC.stateAbbreviation = cities[indexPath.row].state
            print("Passing state: \(cities[indexPath.row].state)")
        } else {
            print("Segue identifier mismatch")
        }
    }


}
