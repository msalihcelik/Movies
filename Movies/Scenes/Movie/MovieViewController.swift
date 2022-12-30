//
//  MovieViewController.swift
//  Movies
//
//  Created by Celik, Salih on 17.11.2022.
//

class MovieViewController: UIViewController {

    @IBOutlet weak var movieCollectionView: UICollectionView!
    var viewModel = MovieViewModel()
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        subscribeViewModelEvents()
        viewModel.fetchMovies(page: 1)
    }
    
    private func subscribeViewModelEvents() {
        viewModel.didSuccessMovies = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.movieCollectionView.reloadData()
            }
        }
        viewModel.showTryAgainButton = { [weak self] in
            guard let self = self else { return }
            let button = TryAgainButton()
            button.addTarget(self, action: #selector(self.tryAgainButtonTapped), for: .touchUpInside)
            self.view.addSubview(button)
            button.centerInSuperview()
            self.view.bringSubviewToFront(button)
        }
        viewModel.hideTryAgainButton = { [weak self] in
            guard let self = self else { return }
            self.view.subviews.filter({ $0 is TryAgainButton }).forEach({ $0.removeFromSuperview() })
        }
        viewModel.tryAgainButtonAction = { [weak self] in
            guard let self = self else { return }
            self.viewModel.fetchMovies(page: 1)
        }
    }
}

// MARK: - Configure & Set Localize
extension MovieViewController {
    
    private func configureContents() {
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        configureRefreshControl()
    }
    
    private func configureRefreshControl() {
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        refreshControl.tintColor = .black
        movieCollectionView.refreshControl = refreshControl
    }
}

// MARK: - Actions
extension MovieViewController {
    
    @objc
    func tryAgainButtonTapped() {
        viewModel.tryAgainButtonTapped()
    }
    
    @objc
    private func didPullToRefresh() {
        viewModel.fetchMovies(page: 1)
        refreshControl.endRefreshing()
    }
}

// swiftlint:disable all
//MARK: - UICollectionViewDataSource Methods
extension MovieViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.movieCell, for: indexPath) as! MovieCell
        let cellViewModel = viewModel.cellItem(for: indexPath)
        cell.set(viewModel: cellViewModel)
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MovieViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 5, bottom: 0, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellWidth = (UIScreen.main.bounds.width - (3 * 5)) / 2
        let cellWidth = ( collectionView.frame.width - (3 * 5 ) ) / 2
        return .init(width: cellWidth, height: (cellWidth / 2 ) + 50 )
    }
}
// switlint:enable all
