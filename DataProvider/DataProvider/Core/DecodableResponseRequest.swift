//
//  DecodableResponseRequest.swift
//  DataProvider
//
//  Created by Celik, Salih on 14.11.2022.
//

public protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}
