//
//  FlightModel.swift
//  FlightTicket
//
//  Created by BOONGKI KWAK on 2023/01/28.
//

import Foundation

protocol FlightModelProtocol {
    func flightRetrived(data: [Flight])
}

class FlightModel {
    var delegate: FlightModelProtocol?
    
    func getFlightInfo() {
        // 1. 요청할 url
        let urlString = "https://api.odcloud.kr/api/15043890/v1/uddi:9840de90-5907-49bd-94ed-acd173ea9ae1"
        let serviceKey = "serviceKey=2ZcQqYLFgYL874KsymG6ArBdRsfToKYUt1v4HSQ%2FVlNsHos8zhdw9ekygVhyPW7gxQq5NXjyoIu4KKqe2vkl0w%3D%3D"
        let defaultString = "page=1&perPage=10"
        
        let confirmedURL = urlString+"?"+serviceKey+"&"+defaultString
        
        print(confirmedURL)
        
        // 2. url 인스턴스 생성
        let url = URL(string: confirmedURL)
        
        // 3. 해당 url이 없으면 중지
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
        
        // 4. URLSession 생성
        let session = URLSession.shared
        
        // 5. URLSession을 이용해서 dataTask 생성
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do {
                    let flightService = try decoder.decode(FlightService.self, from: data!)
                    print(flightService)
                    print(flightService.data)
                    DispatchQueue.main.async {
                        self.delegate?.flightRetrived(data: flightService.data!)
                    }
                } catch {
                    print("Error parsing the json")
                }
            }
        }
        dataTask.resume()
    }
}
