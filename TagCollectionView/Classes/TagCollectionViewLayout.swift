//
//  TagCollectionViewLayout.swift
//  TagCollectionView
//
//  Created by Arturs Derkintis on 21/07/2017.
//  Copyright © 2017 Arturs Derkintis. All rights reserved.
//

import UIKit

public class TagCollectionViewLayout: UICollectionViewFlowLayout {
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributesForElementsInRect = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        var newAttributesForElementsInRect = [UICollectionViewLayoutAttributes]()

        var leftMargin: CGFloat = 0.0;
        for attributes in attributesForElementsInRect {

            if (attributes.frame.origin.x == self.sectionInset.left) {
                leftMargin = self.sectionInset.left
            } else {
                var newLeftAlignedFrame = attributes.frame
                newLeftAlignedFrame.origin.x = leftMargin
                attributes.frame = newLeftAlignedFrame
            }
            leftMargin += attributes.frame.size.width + 8
            newAttributesForElementsInRect.append(attributes)
        }
        return newAttributesForElementsInRect
    }
    public override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
