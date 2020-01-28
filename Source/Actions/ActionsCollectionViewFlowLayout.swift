import UIKit

final class ActionsCollectionViewFlowLayout: UICollectionViewFlowLayout {

    var visualStyle: AlertVisualStyle?

    override static var layoutAttributesClass: AnyClass {
        return ActionsCollectionViewLayoutAttributes.self
    }

    override init() {
        super.init()
        self.minimumInteritemSpacing = 0
        self.minimumLineSpacing = 0
    }

    required init?(coder aDecoder: NSCoder) {
        super.init()
    }

    override func layoutAttributesForDecorationView(ofKind elementKind: String,
        at indexPath: IndexPath) -> UICollectionViewLayoutAttributes?
    {
        guard let itemAttributes = self.layoutAttributesForItem(at: indexPath) else {
            return nil
        }

        let attributes = ActionsCollectionViewLayoutAttributes(forDecorationViewOfKind: elementKind,
                                                               with: indexPath)
        attributes.zIndex = itemAttributes.zIndex + 1
        return attributes
    }
}

class ActionsCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    var backgroundColor: UIColor?
}
