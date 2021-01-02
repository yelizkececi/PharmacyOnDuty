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
    let eczane_adi: String
    let eczane_ilce: String
    let eczane_adres: String
    let eczane_telefon: String
    
    private enum CodingKeys : String, CodingKey {
        case eczane_adi = "eczane_adi", eczane_ilce = "eczane_ilce", eczane_adres = "eczane_adres" , eczane_telefon = "eczane_telefon"
    }
}
