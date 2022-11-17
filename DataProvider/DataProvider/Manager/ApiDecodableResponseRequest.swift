//
//  ApiDecodableResponseRequest.swift
//  DataProvider
//
//  Created by Celik, Salih on 14.11.2022.
//

public protocol ApiDecodableResponseRequest: DecodableResponseRequest {}

// MARK: - Url
public extension ApiDecodableResponseRequest {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "api.themoviedb.org"
    }
    
    var url: String {
        return ""
    }
}

// MARK: - RequestParameters
public extension ApiDecodableResponseRequest {
    var parameters: RequestParameters {
        return [:]
    }
}

// MARK: - RequestHeaders
public extension ApiDecodableResponseRequest {
    var headers: RequestHeaders {
        return [:]
    }
}
