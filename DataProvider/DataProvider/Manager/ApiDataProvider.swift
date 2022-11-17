//
//  ApiDataProvider.swift
//  DataProvider
//
//  Created by Celik, Salih on 14.11.2022.
//

public struct ApiDataProvider: DataProviderProtocol {
    
    public static let shared = ApiDataProvider()
    
    public init() {}
    
    private func createRequest<T: RequestProtocol>(_ request: T) throws -> URLRequest {
        var components = URLComponents()
        if request.url.isEmpty {
            components.scheme = request.scheme
            components.host = request.host
        } else {
            guard let urlComponents = URLComponents(string: request.url) else { throw NetworkError.invalidURL }
            components = urlComponents
        }
        components.path = request.path
        
        if !request.parameters.isEmpty {
            components.queryItems = request.parameters.map {
                URLQueryItem(name: $0, value: "\($1)")
            }
        }
        
        guard let url = components.url else { throw NetworkError.invalidURL }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        return urlRequest
    }
    
    public func request<T: DecodableResponseRequest>(for request: T, result: DataProviderResult<T.ResponseType>? = nil) {
        do {
            let request = try createRequest(request)
            URLSession.shared.dataTask(with: request) { data, _, error in
                if let error = error { result?(.failure(error)) }
                guard let data = data else { return }
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(T.ResponseType.self, from: data)
                    result?(.success(decodedData))
                } catch {
                    result?(.failure(NetworkError.JSONDecodeError))
                }
            }.resume()
        } catch {
            print(error)
        }
    }
}
