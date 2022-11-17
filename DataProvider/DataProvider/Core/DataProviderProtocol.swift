//
//  DataProviderProtocol.swift
//  DataProvider
//
//  Created by Celik, Salih on 14.11.2022.
//

public typealias DataProviderResult<T: Decodable> = ((Result<T, Error>) -> Void)

public protocol DataProviderProtocol {
    func request<T: DecodableResponseRequest>(
        for request: T,
        result: DataProviderResult<T.ResponseType>?
    )
}
