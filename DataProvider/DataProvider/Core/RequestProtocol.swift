//
//  RequestProtocol.swift
//  DataProvider
//
//  Created by Celik, Salih on 14.11.2022.
//

public protocol RequestProtocol {
    var path: String { get }
    var method: RequestMethod { get }
    var parameters: RequestParameters { get }
    var headers: RequestHeaders { get }
    var scheme: String { get }
    var host: String { get }
    var url: String { get }
}
