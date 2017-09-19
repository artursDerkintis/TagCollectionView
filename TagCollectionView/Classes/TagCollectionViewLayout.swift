//
//  TagCollectionViewLayout.swift
//  TagCollectionView
//
//  Created by Arturs Derkintis on 21/07/2017.
//  Copyright © 2017 Arturs Derkintis. All rights reserved.
//

import UIKit

public class TagCollectionViewLayout: UICollectionViewFlowLayout {
    var maxCellSpacing: CGFloat = 2.0
    public override init() {
        super.init()

        self.minimumInteritemSpacing = maxCellSpacing
        self.minimumLineSpacing = maxCellSpacing
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributesForElementsInRect = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        for attributes in attributesForElementsInRect {
            if attributes.representedElementKind == nil {
                let indexPath = attributes.indexPath
                attributes.frame = self.layoutAttributesForItem(at: indexPath)?.frame ?? .zero
            }
        }
        return attributesForElementsInRect
    }
    public override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let currentAttributes = super.layoutAttributesForItem(at: indexPath) else {
            return nil
        }

        if indexPath.item == 0 {
            var frame = currentAttributes.frame
            frame.origin.x = sectionInset.left
            currentAttributes.frame = frame
            return currentAttributes
        }
        let previousIndexPath = IndexPath(item: indexPath.item - 1, section: indexPath.section)
        if let previousFrame = self.layoutAttributesForItem(at: previousIndexPath)?.frame {
            let pp = previousFrame.origin.x + previousFrame.width + maxCellSpacing
            let currentFrame = currentAttributes.frame
            let strechedCurrentFrame = CGRect(x: 0, y: currentFrame.origin.y, width: collectionView?.frame.width ?? 0, height: currentFrame.height)
            if !previousFrame.intersects(strechedCurrentFrame) {
                var frame = currentAttributes.frame
                frame.origin.x = sectionInset.left
                currentAttributes.frame = frame
                return currentAttributes
            }
            var frame = currentAttributes.frame
            frame.origin.x = pp
            currentAttributes.frame = frame
            return currentAttributes
        }
        return nil
    }
}
