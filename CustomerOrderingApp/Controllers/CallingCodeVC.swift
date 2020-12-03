//
//  CallingCodeVC.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 01/12/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

@objc protocol returnDataProtocol {
    func returnStringData(myData: String)
}

class CallingCodeVC: UIViewController, UISearchResultsUpdating {
    
    var filterData = [Country]()
    var tableView = UITableView()
    var searchbarController = UISearchController()
    weak var delegate: returnDataProtocol?
    var array = [Country]()
    
    
    func updateSearchResults(for searchController: UISearchController) {
        filterData.removeAll(keepingCapacity: false)
        if let searchText = searchController.searchBar.text {
            if searchText.count == 0 {
                filterData = array
            }
            else {
                filterData = array.filter {
                    return $0.name.contains(searchText)
                }
            }
        }
        self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        searchbarController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            tableView.tableHeaderView = controller.searchBar
            return controller
        })()
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData { (data) in
            array.append(contentsOf: data.countries)
            
            
            
        }
    }
    func setupView() {
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
    }
    func loadData(completionHandeler: (CountriesCallingCode) -> ())  {
        let url = Bundle.main.url(forResource: "Countries", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let callingCodes = try! JSONDecoder().decode(CountriesCallingCode.self, from: data)
        completionHandeler(callingCodes)
        
    }
}
extension CallingCodeVC : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchbarController.isActive{
            return filterData.count
        }
        else{
            return array.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        if searchbarController.isActive{
            cell.textLabel?.text = filterData[indexPath.row].name
        }
        else{
            cell.textLabel?.text = array[indexPath.row].name
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchbarController.isActive{
            delegate?.returnStringData(myData: filterData[indexPath.row].name)
            
        }
        else{
            delegate?.returnStringData(myData: array[indexPath.row].name)
            
          
            
  
        }
        
    }
    
    
    
    
}


struct CountriesCallingCode: Codable {
    let countries: [Country]
}

// MARK: - Country
struct Country: Codable {
    let name, flag, code, dialCode: String
    
    enum CodingKeys: String, CodingKey {
        case name, flag, code
        case dialCode = "dial_code"
    }
}

