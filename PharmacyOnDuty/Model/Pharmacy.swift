//
//  Pharmacy.swift
//  PharmacyOnDuty
//
//  Created by Yeliz Keçeci on 1.01.2021.
//

import Foundation

struct PharmacyList: Decodable {
    let data: [Pharmacy]
}

struct Pharmacy: Decodable {
    let eczaneAdi: String
    let eczaneIlce: String
    let eczaneAdres: String
    let eczaneTelefon: String
    
    private enum CodingKeys : String, CodingKey {
        case eczaneAdi = "eczane_adi", eczaneIlce = "eczane_ilce", eczaneAdres = "eczane_adres" , eczaneTelefon = "eczane_telefon"
    }
}
