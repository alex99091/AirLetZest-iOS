//
//  Bundle+APIKey.swift
//  AirLetZest-iOS
//
//  Created by BOONGKI KWAK on 2023/02/25.
//

import Foundation

extension Bundle {
    
    var apiKey: String {
        guard let file = self.path(forResource: "Info", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["API_KEY"] as? String else { fatalError("Info.plist에 API_KEY를 설정해 주세요.")}
        return key
    }
    
}
