//
//  SearchCityController.swift
//  AirLetZest-iOS
//
//  Created by BOONGKI KWAK on 2023/02/25.
//

import Foundation

class SearchCityController {
    // Property
    var dataResponse: [FlightDatum] = [FlightDatum]()
    var cities: [String] = []
    // method
    func searchCities() {
        SearchAPI.getDataResponse { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let baseListResponse):
                for flightdata in baseListResponse.data! {
                    if !self.cities.contains(flightdata.도착공항!){
                        self.cities.append(flightdata.도착공항!)
                    } else if !self.cities.contains(flightdata.출발공항!) {
                        self.cities.append(flightdata.출발공항!)
                    }
                }
                print(self.cities)
                //print("baseResponse: \(baseListResponse)")
            case .failure(let failure):
                print("failure: \(failure)")
            }
        }
    }
    
}
