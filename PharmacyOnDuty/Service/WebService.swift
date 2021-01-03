//
//  WebService.swift
//  PharmacyOnDuty
//
//  Created by Yeliz Keçeci on 1.01.2021.
//

import Foundation

class WebService {
    var city: String = ""
    
    func getPharmacies(with url:URL, completion: @escaping([Pharmacy]?) ->()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                do {
                    if self.city == "" {
                        let pharmacyList = try JSONDecoder().decode(PharmacyList.self,from: data)
                        completion(pharmacyList.data)
                    } else {
                        let pharmacyList = try JSONDecoder().decode(PharmacyList.self,from: data)
                        let rate = pharmacyList.data.filter { ($0.eczaneIlce == self.city) || ($0.eczaneAdres.lowercased().contains(self.city.lowercased()))}
                        completion(rate)
                    }
                } catch (let decodeError) {
                    print(decodeError)
                }
            }
        }.resume()
    }
}
