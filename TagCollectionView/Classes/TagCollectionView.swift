//
//  TagCollectionView.swift
//  TagCollectionView
//
//  Created by Arturs Derkintis on 21/07/2017.
//  Copyright © 2017 Arturs Derkintis. All rights reserved.
//

import UIKit
public typealias Selected = (_ tag: Tag) -> Void?

open class TagCollectionView: UICollectionView {
    public var selectedDesign: TagDesign = TagDesign.defaultSelectedDesign
    public var normalDesign: TagDesign = TagDesign.defaultNormalDesign
    public var cellHeight: CGFloat = 25.0
    public var tags: [Tag] = [] {
        didSet {
            reloadData()
        }
    }
    public var selectedTags: [Tag] = [] {
        didSet {
            reloadData()
        }
    }
    public var selected: Selected?

    fileprivate var sizingCell: TagCollectionViewCell?
    open override func awakeFromNib() {
        super.awakeFromNib()
        let tagLayout = TagCollectionViewLayout()
        tagLayout.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8)
        collectionViewLayout = tagLayout
        register(TagCollectionViewCell.nib, forCellWithReuseIdentifier: TagCollectionViewCell.cellId)
        sizingCell = TagCollectionViewCell.instance()
        delegate = self
        dataSource = self
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

extension TagCollectionView {

    func configure(cell: TagCollectionViewCell, indexPath: IndexPath) {
        let title = tags[indexPath.row].title
        cell.label.text = title
        cell.design = selectedTags.contains(where: { $0.title == title }) ? selectedDesign : normalDesign
    }

}

extension TagCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let tag = tags[indexPath.row]
        if let index = selectedTags.index(where: { (t) -> Bool in
            return t.title == tag.title
        }) {
            selectedTags.remove(at: index)
        } else {
            selectedTags.append(tag)
        }
        selected?(tag)
        guard let cell = collectionView.cellForItem(at: indexPath) as? TagCollectionViewCell else { return }
        cell.design = selectedTags.contains(where: { $0.title == tag.title }) ? selectedDesign : normalDesign
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.cellId, for: indexPath) as? TagCollectionViewCell else {
            return UICollectionViewCell()
        }
        configure(cell: cell, indexPath: indexPath)
        return cell
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension TagCollectionView: UICollectionViewDelegateFlowLayout {
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let sizingCell = sizingCell else { return .zero }
        configure(cell: sizingCell, indexPath: indexPath)
        return CGSize(width: sizingCell.systemLayoutSizeFitting(UILayoutFittingCompressedSize).width, height: cellHeight)
    }
}
