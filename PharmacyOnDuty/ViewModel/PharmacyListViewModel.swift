//
//  PharmacyListViewModel.swift
//  PharmacyOnDuty
//
//  Created by Yeliz Keçeci on 1.01.2021.
//

import Foundation

struct PharmacyListViewModel {
    let data: [Pharmacy]
}

extension PharmacyListViewModel{
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.data.count
    }
    
    func pharmacyAtIndex(_ index: Int) -> Pharmacy {
        let pharmacyTitle = data[index].eczane_adi
        let pharmacyAddress = data[index].eczane_adres
        let pharmacyCity = data[index].eczane_ilce
        let pharmacyPhone = data[index].eczane_telefon
        //let pharmacy = data[index]
        return Pharmacy(eczane_adi: pharmacyTitle, eczane_ilce: pharmacyCity, eczane_adres: pharmacyAddress, eczane_telefon: pharmacyPhone)
        //return PharmacyViewModel(pharmacy)
    }
}

struct PharmacyViewModel {
    private let pharmacy: Pharmacy
}

extension PharmacyViewModel{
    init(_ pharmacy: Pharmacy) {
        self.pharmacy = pharmacy
    }
    
    var title: String {
        return self.pharmacy.eczane_adi
    }
    
    var address: String {
        return self.pharmacy.eczane_adres
    }
    
    var city: String {
        return self.pharmacy.eczane_ilce
    }
    
    var phone: String {
        return self.pharmacy.eczane_telefon
    }
}
