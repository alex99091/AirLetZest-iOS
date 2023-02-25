//
//  SearchAPI.swift
//  AirLetZest-iOS
//
//  Created by BOONGKI KWAK on 2023/02/25.
//

import Foundation

enum SearchAPI {
    static let urlString = "https://api.odcloud.kr/api/15043890/v1/uddi:9840de90-5907-49bd-94ed-acd173ea9ae1"
    static let serviceKey = "serviceKey=\(Bundle.main.apiKey)"
    static let defaultString = "page=1&perPage=10"
    
    static let composedURL = urlString+"?"+serviceKey+"&"+defaultString
   
    enum ApiError: Error {
        case noContent
        case decodingError
        case jsonEncoding
        case noServiceKey
        case notAllowedUrl
        case badStatus(code: Int)
        case unknown(_ error: Error?)
        
        var info: String {
            switch self {
            case .noContent: return "데이터가 없습니다."
            case .decodingError: return "decoding 에러입니다."
            case .jsonEncoding: return "유효한 json형식이 아닙니다."
            case .noServiceKey: return "서비스 키가 없습니다."
            case .notAllowedUrl: return "올바른 형식이 아닙니다."
            case let .badStatus(code): return "에러 상태코드: \(code)입니다."
            case .unknown(let error): return "알 수 없는 \(String(describing: error)): 에러입니다."
            }
        }
    }
}

extension SearchAPI {
    
    // 데이터 가져오기
    static func getDataResponse(completion: @escaping (Result<BaseListResponse<FlightDatum>, ApiError>) -> Void) {
        
        let fullURL = SearchAPI.composedURL
        
        guard let url = URL(string: fullURL) else {
            return completion(.failure(ApiError.notAllowedUrl))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, err in
            
            if let error = err {
                return completion(.failure(ApiError.unknown(error)))
            }
            
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                print("bad status code")
                return completion(.failure(ApiError.unknown(nil)))
            }
            print("statusCode: \(httpResponse.statusCode)")
            
            switch httpResponse.statusCode {
            case 401:
                return completion(.failure(ApiError.noServiceKey))
            default: print("default")
            }
            
            if !(200...299).contains(httpResponse.statusCode){
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
            
            if let jsonData = data {
                do {
                    let baseListResponse = try JSONDecoder().decode(BaseListResponse<FlightDatum>.self, from: jsonData)
                    
                    let flightLists = baseListResponse.data
                    
                    guard let flightLists = flightLists,
                          !flightLists.isEmpty else {
                        return completion(.failure(ApiError.noContent))
                    }
                    
                    completion(.success(baseListResponse))
                } catch {
                    
                    completion(.failure(ApiError.decodingError))
                }
            }
        }.resume()
    }
}
