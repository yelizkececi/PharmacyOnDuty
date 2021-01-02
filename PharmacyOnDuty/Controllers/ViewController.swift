//
//  ViewController.swift
//  PharmacyOnDuty
//
//  Created by Yeliz Keçeci on 2.01.2021.
//

import UIKit

class ViewController: UIViewController {
    private var pharmacyListViewModel: PharmacyListViewModel!
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
   private func setUp() {
        WebService().getPharmacies(with: URL.urlForallPharmacyOnDuty()) { data in
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
    
        let pharmacyViewModel: PharmacyViewModel = PharmacyViewModel(self.pharmacyListViewModel.pharmacyAtIndex(indexPath.row))
        cell.configure(for: pharmacyViewModel)
        return cell
    }
}
