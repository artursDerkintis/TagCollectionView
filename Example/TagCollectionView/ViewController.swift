//
//  ViewController.swift
//  TagCollectionView
//
//  Created by Arturs Derkintis on 07/21/2017.
//  Copyright (c) 2017 Arturs Derkintis. All rights reserved.
//

import UIKit
import TagCollectionView


class ViewController: UIViewController {

    @IBOutlet weak var tagCollectionView: TagCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var tags = [Tag]()
        for i in 0...50 {
            tags.append(Tag(title: "some tag \(i)"))
        }
        tagCollectionView.tags = tags
        tagCollectionView.selectedTags = [Tag(title: "some tag 30"), Tag(title: "some tag 45")]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

