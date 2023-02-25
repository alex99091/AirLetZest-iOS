//
//  FlightDatum.swift
//  AirLetZest-iOS
//
//  Created by BOONGKI KWAK on 2023/02/25.
//

import Foundation

struct FlightDatum: Codable {
    
    let 기종: String?
    let 도착공항: String?
    let 도착시간: String?
    let 시작일자: String?
    let 운항요일: String?
    let 종료일자: String?
    let 출발공항: String?
    let 출발시간: String?
    let 편명: String?
    let 항공사: String?
    
}

// 제너릭 응답처리
struct BaseResponse<T: Codable>: Codable {
    
    let 기종: String?
    let 도착공항: String?
    let 도착시간, 시작일자: String?
    let 운항요일: String?
    let 종료일자: String?
    let 출발공항: String?
    let 출발시간, 편명: String?
    let 항공사: String?
    
}
