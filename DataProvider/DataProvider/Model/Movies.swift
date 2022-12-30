//
//  Movies.swift
//  DataProvider
//
//  Created by Celik, Salih on 9.12.2022.
//

public struct Movies: Codable {
    
    public let page: Int
    public let results: [Results]
    public let totalPages: Int
    public let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
