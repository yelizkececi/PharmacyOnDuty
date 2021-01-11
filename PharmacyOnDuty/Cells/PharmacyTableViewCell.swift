//
//  PharmacyTableViewCell.swift
//  PharmacyOnDuty
//
//  Created by Yeliz Keçeci on 2.01.2021.
//

import Foundation
import UIKit

class PharmacyTableViewCell: UITableViewCell {
    
    var pharmacyViewModel: PharmacyViewModel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneButton: UIButton!
    
    func configure(for vm: PharmacyViewModel) {
        pharmacyViewModel = vm
        self.titleLabel.text = vm.title
        self.addressLabel.text = vm.address
        self.phoneButton.setTitle(vm.phone, for: .normal )
    }
    
    @IBAction func phoneLabelClicked(_ sender: Any) {
        if let vm = pharmacyViewModel  {
            if let url = NSURL(string: "tel://\(vm.phone)"), UIApplication.shared.canOpenURL(url as URL) {
                print("girdi")
                UIApplication.shared.open(url as URL)
            }
        }
    }
    
}
