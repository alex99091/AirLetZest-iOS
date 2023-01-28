//
//  FlightService.swift
//  FlightTicket
//
//  Created by BOONGKI KWAK on 2023/01/28.
//

import Foundation

struct FlightService: Codable {
    var page: Int64?
    var perPage: Int64?
    var totalCount: Int64?
    var currentCount: Int64?
    var matchCount: Int64?
    var data: [Flight]?
}
