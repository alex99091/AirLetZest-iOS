//
//  Flight.swift
//  FlightTicket
//
//  Created by BOONGKI KWAK on 2023/01/28.
//

import Foundation

struct Flight: Codable {
    var 항공사: String?
    var 편명: String?
    var 출발공항: String?
    var 도착공항: String?
    var 출발시간: String?
    var 도착시간: String?
    var 운항요일: String?
    var 시작일자: String?
    var 종료일자: String?
}
