//
//  DataProviderProtocol.swift
//  DataProvider
//
//  Created by Celik, Salih on 14.11.2022.
//

public protocol DataProviderProtocol {
    func request<T: Codable>(url: String,
                             scheme: String,
                             host: String,
                             path: String,
                             method: RequestMethod,
                             headers: RequestHeaders,
                             parameters: RequestParameters,
                             result: ((Result<T, Error>) -> Void)?)
}
