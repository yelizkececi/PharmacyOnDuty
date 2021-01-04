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
        let pharmacyTitle = data[index].eczaneAdi
        let pharmacyAddress = data[index].eczaneAdres
        let pharmacyCity = data[index].eczaneIlce
        let pharmacyPhone = data[index].eczaneTelefon
        return Pharmacy(eczaneAdi: pharmacyTitle, eczaneIlce: pharmacyCity, eczaneAdres: pharmacyAddress, eczaneTelefon: pharmacyPhone)
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
