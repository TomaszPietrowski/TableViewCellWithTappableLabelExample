import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var onLabelTappedCallback: (() -> Void)?
    
    private let label = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        contentView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
            label.heightAnchor.constraint(equalToConstant: 40.0),
            label.widthAnchor.constraint(equalToConstant: 150.0)
            ])
        
        label.backgroundColor = .lightGray
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        )
    }
    
    @objc private func labelTapped() {
        onLabelTappedCallback?()
    }
}
