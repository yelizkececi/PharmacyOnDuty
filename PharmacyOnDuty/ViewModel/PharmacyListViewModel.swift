//
//  PharmacyListViewModel.swift
//  PharmacyOnDuty
//
//  Created by Yeliz Keçeci on 1.01.2021.
//

import Foundation

class PharmacyListViewModel {
    private var pharmacies: [Pharmacy] = []
    var filteredPharmacies: [Pharmacy] {
        get {
            if searchQuery.isEmpty {
                return pharmacies
            } else {
                return pharmacies.filter { ($0.eczaneIlce == searchQuery) || ($0.eczaneAdres.lowercased().contains(searchQuery.lowercased()))}
            }
        }
    }
    var searchQuery: String = ""
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.filteredPharmacies.count
    }
    
    func pharmacyAtIndex(_ index: Int) -> Pharmacy {
        let pharmacyTitle = filteredPharmacies[index].eczaneAdi
        let pharmacyAddress = filteredPharmacies[index].eczaneAdres
        let pharmacyCity = filteredPharmacies[index].eczaneIlce
        let pharmacyPhone = filteredPharmacies[index].eczaneTelefon
        return Pharmacy(eczaneAdi: pharmacyTitle, eczaneIlce: pharmacyCity, eczaneAdres: pharmacyAddress, eczaneTelefon: pharmacyPhone)
    }
    
    func loadData(pharmacies: [Pharmacy]){
        self.pharmacies = pharmacies
    }
}

class PharmacyViewModel {
    private let pharmacy: Pharmacy
    
    init(_ pharmacy: Pharmacy) {
        self.pharmacy = pharmacy
    }
    
    var title: String {
        return self.pharmacy.eczaneAdi
    }
    
    var address: String {
        return self.pharmacy.eczaneAdres
    }
    
    var city: String {
        return self.pharmacy.eczaneIlce
    }
    
    var phone: String {
        return self.pharmacy.eczaneTelefon
    }
}
