//
//  MovieCellModel.swift
//  UIComponents
//
//  Created by Celik, Salih on 17.11.2022.
//

public protocol MovieCellDataSource: AnyObject {
    var imageUrl: String { get }
    var title: String { get }
}

public protocol MovieCellEventSource: AnyObject {
    
}

public protocol MovieCellProtocol: MovieCellDataSource, MovieCellEventSource {
    
}

public final class MovieCellModel: MovieCellProtocol {
    public var imageUrl: String
    public var title: String
    
    public init(imageUrl: String, title: String) {
        self.imageUrl = imageUrl
        self.title = title
    }
}
