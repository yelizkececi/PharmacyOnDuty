//
//  ViewController.swift
//  PharmacyOnDuty
//
//  Created by Yeliz Keçeci on 2.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var pharmacyListViewModel: PharmacyListViewModel!
    var pharmacyViewModel: PharmacyViewModel!
    private let webService = WebService()
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search"
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.searchController = search
        setUp(city: "")
    }
    
    @IBAction func phoneLabelClicked(_ sender: Any) {
        if let url = NSURL(string: "tel://\(pharmacyViewModel.phone)"), UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.open(url as URL)
        }
    }
    
    private func setUp(city: String) {
    webService.city = (city)
    webService.getPharmacies(with: URL.urlForallPharmacyOnDuty()) { data in
            if let data = data {
                self.pharmacyListViewModel = PharmacyListViewModel(data: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
          return self.pharmacyListViewModel == nil ? 0 : self.pharmacyListViewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.pharmacyListViewModel == nil ? 0 : self.pharmacyListViewModel.numberOfSections
       return self.pharmacyListViewModel.numberOfRowsInSection(section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PharmacyTableViewCell", for: indexPath) as? PharmacyTableViewCell else {
                fatalError("PharmacyTableViewCell not found!")
        }
        pharmacyViewModel = PharmacyViewModel(self.pharmacyListViewModel.pharmacyAtIndex(indexPath.row))
        cell.configure(for: pharmacyViewModel)
        return cell
    }
}

extension ViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        setUp(city: text)
    }
}
