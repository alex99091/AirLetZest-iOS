//
//  ViewController.swift
//  FlightTicket
//
//  Created by BOONGKI KWAK on 2023/01/28.
//

import UIKit

class TicketViewController: UITableViewController {
    
    var data = [Flight]()
    var model = FlightModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.delegate = self
        model.getFlightInfo()
    }
    
    // MARK:- DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightCell", for: indexPath)
        // TODO: customize it
        return cell
    }
}

extension TicketViewController: FlightModelProtocol {
    // MARK: FlightModelProtocol functions
    func flightRetrived(data: [Flight]) {
        print("flights retrived from flight model")
        self.data = data
        tableView.reloadData()
    }
}
