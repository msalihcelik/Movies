//
//  ListMovieRequest.swift
//  DataProvider
//
//  Created by Celik, Salih on 9.12.2022.
//

public struct ListMovieRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = Movies
    
    public let path: String = "/3/movie/popular"
    public let method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(page: Int) {
        parameters["api_key"] = Constants.apiKey
        parameters["page"] = page
    }
}
