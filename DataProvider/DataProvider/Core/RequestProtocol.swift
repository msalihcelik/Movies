//
//  RequestProtocol.swift
//  DataProvider
//
//  Created by Celik, Salih on 14.11.2022.
//

public protocol RequestProtocol {
    var url: String { get }
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var headers: RequestHeaders { get }
    var parameters: RequestParameters { get }
}
