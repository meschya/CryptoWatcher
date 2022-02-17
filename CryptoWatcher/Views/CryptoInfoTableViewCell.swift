import UIKit

final class CryptoInfoTableViewCell: UITableViewCell {
    // MARK: - Identifier

    static let identifier = "CryptoInfoTableViewCell"
    
    // MARK: - Properties
    
    // MARK: Private
    
    private let mainStackView: UIStackView = .init()
    private let cryptoView: UIView = .init()
    private let nameCoinLabel: UILabel = .init()
    private let scaleCoinLabel: UILabel = .init()

    // MARK: - LIfecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 20/255, green: 18/255, blue: 28/255, alpha: 1.0)
        addSubviews()
        addSetups()
        addConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    func set(_ name: String, _ scale: String) {
        nameCoinLabel.text = name
        scaleCoinLabel.text = "$" + scale
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func addConstraints() {
        addCryptoViewConstraints()
        addMainStackViewConstraints()
    }
    
    private func addCryptoViewConstraints() {
        cryptoView.translatesAutoresizingMaskIntoConstraints = false
        cryptoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        cryptoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        cryptoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        cryptoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    private func addMainStackViewConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: cryptoView.topAnchor, constant: 10).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: cryptoView.leadingAnchor, constant: 10).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: cryptoView.trailingAnchor, constant: -10).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: cryptoView.bottomAnchor, constant: -10).isActive = true
    }
    
    // MARK: - Setups
    
    // MARK: Private
    
    private func addSubviews() {
        contentView.addSubview(cryptoView)
        cryptoView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(nameCoinLabel)
        mainStackView.addArrangedSubview(scaleCoinLabel)
    }
    
    private func addSetups() {
        addCryptoViewSetups()
        addMainStackViewSetups()
        addNameCoinLabelSetups()
        addScaleCoinLabelSetups()
    }
    
    private func addCryptoViewSetups() {
        cryptoView.backgroundColor = UIColor(red: 36/255, green: 34/255, blue: 49/255, alpha: 1.0)
        cryptoView.layer.cornerRadius = 10
    }
    
    private func addMainStackViewSetups() {
        mainStackView.axis = .horizontal
        mainStackView.distribution = .fillEqually
        mainStackView.alignment = .fill
    }
    
    private func addNameCoinLabelSetups() {
        nameCoinLabel.textAlignment = .left
        nameCoinLabel.textColor = .white
        nameCoinLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
    
    private func addScaleCoinLabelSetups() {
        scaleCoinLabel.textAlignment = .right
        scaleCoinLabel.textColor = UIColor(red: 175/255, green: 173/255, blue: 185/255, alpha: 1.0)
        scaleCoinLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
}
