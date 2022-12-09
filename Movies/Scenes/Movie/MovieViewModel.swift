//
//  MovieViewModel.swift
//  Movies
//
//  Created by Celik, Salih on 30.11.2022.
//

protocol MovieViewDataSource {
    var numberOfItems: Int { get }
    
    func cellItem(for indexPath: IndexPath) -> MovieCellProtocol
}

protocol MovieViewEventSource {
    var didSuccessMovies: VoidClosure? { get set }
}

protocol MovieViewProtocol: MovieViewDataSource, MovieViewEventSource { }

final class MovieViewModel: MovieViewProtocol {

    var didSuccessMovies: VoidClosure?
    var cellItems: [MovieCellModel] = []
    
    var numberOfItems: Int {
        return cellItems.count
    }
    
    func cellItem(for indexPath: IndexPath) -> MovieCellProtocol {
        let cellItem = cellItems[indexPath.item]
        return cellItem
    }
}

// MARK: - Network
extension MovieViewModel {
    
    func fetchMovies(page: Int) {
        let request = ListMovieRequest(page: page)
        let url = "https://image.tmdb.org/t/p/w500"
        ApiDataProvider.shared.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                let cellItems = response.results.map({
                    let backdropPath: String = $0.backdropPath ?? ""
                    let imageURL = url + backdropPath
                    return MovieCellModel(imageUrl: imageURL, title: $0.title ?? "")
                })
                self.cellItems.append(contentsOf: cellItems)
                self.didSuccessMovies?()
            case .failure:
                break
            }
        }
    }
}
