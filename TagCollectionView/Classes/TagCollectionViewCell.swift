//
//  TagCollectionViewCell.swift
//  TagCollectionView
//
//  Created by Arturs Derkintis on 21/07/2017.
//  Copyright © 2017 Arturs Derkintis. All rights reserved.
//

import UIKit

public class TagCollectionViewCell: UICollectionViewCell {
    @IBOutlet var maxWidth: NSLayoutConstraint!
    @IBOutlet var label: UILabel!
    override open func awakeFromNib() {
        super.awakeFromNib()
        maxWidth.constant = UIScreen.main.bounds.width - 10
    }
    public var design: TagDesign? {
        didSet {
            if let design = design {
                layer.cornerRadius = design.cornerRadius
                layer.borderColor = design.borderColor.cgColor
                layer.borderWidth = design.borderWidth
                backgroundColor = design.backgroudColor
                label.font = design.font
                label.textColor = design.textColor
            }
        }
    }
}

extension TagCollectionViewCell {

    static let cellId = "TagCollectionViewCell"

    static var nib: UINib {
        let bundle = Bundle(for: TagCollectionViewCell.self)
        return UINib(nibName: "TagCollectionViewCell", bundle: bundle)
    }

    class func instance() -> TagCollectionViewCell {
        let bundle = Bundle(for: TagCollectionViewCell.self)
        let tagCollectionViewCell = UINib(nibName: "TagCollectionViewCell", bundle: bundle).instantiate(withOwner: self, options: nil).first as? TagCollectionViewCell
        return tagCollectionViewCell!
    }

}
