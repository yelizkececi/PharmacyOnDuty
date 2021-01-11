//
//  ViewController.swift
//  PharmacyOnDuty
//
//  Created by Yeliz Keçeci on 2.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var pharmacyListViewModel: PharmacyListViewModel = PharmacyListViewModel()

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
        search.searchBar.placeholder = "Aramak istediğiniz şehri giriniz"
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.searchController = search
        loadPharmacies()
    }

    private func loadPharmacies() {
        WebService.shared.getPharmacies {  data in
            if let data = data {
                self.pharmacyListViewModel.loadData(pharmacies: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource , UISearchResultsUpdating{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.pharmacyListViewModel.numberOfRowsInSection(section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PharmacyTableViewCell", for: indexPath) as? PharmacyTableViewCell else {
                fatalError("PharmacyTableViewCell not found!")
        }
       let pharmacyViewModel = PharmacyViewModel(self.pharmacyListViewModel.pharmacyAtIndex(indexPath.row))
        cell.configure(for: pharmacyViewModel)
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        pharmacyListViewModel.searchQuery = text
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
