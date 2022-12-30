//
//  BaseRequest.swift
//  DataProvider
//
//  Created by Celik, Salih on 30.12.2022.
//

public struct BaseRequest: RequestProtocol {
    public var url: String
    
    public var scheme: String
    
    public var host: String
    
    public var path: String
    
    public var method: RequestMethod
    
    public var headers: RequestHeaders
    
    public var parameters: RequestParameters
}
