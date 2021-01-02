//
//  WebService.swift
//  PharmacyOnDuty
//
//  Created by Yeliz Keçeci on 1.01.2021.
//

import Foundation

class WebService {
    func getPharmacies(with url:URL, completion: @escaping([Pharmacy]?) ->()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                do {
                    let pharmacyList = try JSONDecoder().decode(PharmacyList.self,from: data)
                    completion(pharmacyList.data)
                } catch (let decodeError) {
                    print(decodeError)
                }
            }
        }.resume()
    }
}
