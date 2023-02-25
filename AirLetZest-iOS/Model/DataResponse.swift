//
//  DataResponse.swift
//  AirLetZest-iOS
//
//  Created by BOONGKI KWAK on 2023/02/25.
//

import Foundation

// MARK: - DataResponse
struct DataResponse: Codable {
    let currentCount: Int?
    let data: [FlightDatum]?
    let matchCount, page, perPage, totalCount: Int?
}

// 제너릭 응답처리
struct BaseListResponse<T: Codable>: Codable {
    let currentCount: Int?
    let data: [T]?
    let matchCount, page, perPage, totalCount: Int?
}
