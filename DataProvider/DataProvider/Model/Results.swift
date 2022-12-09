//
//  Result.swift
//  DataProvider
//
//  Created by Celik, Salih on 9.12.2022.
//

public struct Results: Decodable {
    
    public let adult: Bool
    public let backdropPath: String?
    public let genreIds: [Int]
    public let id: Int
    public let originalLanguage: String?
    public let originalTitle: String?
    public let overview: String?
    public let popularity: Double
    public let posterPath: String?
    public let releaseDate: String?
    public let title: String?
    public let video: Bool
    public let voteAverage: Double
    public let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case
        adult, id, overview, popularity, title, video,
        backdropPath = "backdrop_path",
        genreIds = "genre_ids",
        originalLanguage = "original_language",
        originalTitle = "original_title",
        posterPath = "poster_path",
        releaseDate = "release_date",
        voteAverage = "vote_average",
        voteCount = "vote_count"
    }
}
