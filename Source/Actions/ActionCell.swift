import UIKit

final class ActionCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private var highlightedBackgroundView: UIView!

    private var textColor: UIColor?
    
    var isEnabled = true {
        didSet { self.titleLabel.isEnabled = self.isEnabled }
    }

    override var isHighlighted: Bool {
        didSet { self.highlightedBackgroundView.isHidden = !self.isHighlighted }
    }

    func set(_ action: AlertAction, with visualStyle: AlertVisualStyle) {
        action.actionView = self

        self.titleLabel.font = visualStyle.font(for: action)
        
        self.textColor = visualStyle.textColor(for: action)
        self.titleLabel.textColor = self.textColor ?? self.tintColor
        
        self.titleLabel.attributedText = action.attributedTitle

        self.highlightedBackgroundView.backgroundColor = visualStyle.actionHighlightColor

        self.setupAccessibility(using: action)
        
        self.containerView.layer.cornerRadius = 5
        self.containerView.layer.borderColor = self.titleLabel.textColor.cgColor
        self.containerView.layer.borderWidth = 1
    }

    override func tintColorDidChange() {
        super.tintColorDidChange()
        self.titleLabel.textColor = self.textColor ?? self.tintColor
    }
}

final class ActionSeparatorView: UICollectionReusableView {

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)

        if let attributes = layoutAttributes as? ActionsCollectionViewLayoutAttributes {
            self.backgroundColor = attributes.backgroundColor
        }
    }
}
