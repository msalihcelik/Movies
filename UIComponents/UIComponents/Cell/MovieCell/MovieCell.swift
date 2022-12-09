//
//  MovieCell.swift
//  UIComponents
//
//  Created by Celik, Salih on 17.11.2022.
//

public class MovieCell: UICollectionViewCell {
    
    weak var viewModel: MovieCellProtocol?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    public func set(viewModel: MovieCellProtocol) {
        self.viewModel = viewModel
        updateCell()
    }
    
    private func updateCell() {
        self.imageView.configureKF(url: viewModel?.imageUrl)
        self.titleLabel.text = viewModel?.title
    }
}

// MARK: - Configure
extension MovieCell {
    
    private func configureContents() {
//        contentView.backgroundColor = .appGray
    }
}
