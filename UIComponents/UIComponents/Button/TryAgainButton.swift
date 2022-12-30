//
//  TryAgainButton.swift
//  UIComponents
//
//  Created by Celik, Salih on 30.12.2022.
//

public class TryAgainButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        titleLabel?.font = .systemFont(ofSize: 14)
        setTitleColor(.black, for: .normal)
        setTitle(L10n.tryAgain, for: .normal)
    }
}
