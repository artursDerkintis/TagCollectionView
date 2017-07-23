//
//  TagDesign.swift
//  Pods
//
//  Created by Arturs Derkintis on 21/07/2017.
//
//

import UIKit

public struct TagDesign {
    var backgroudColor: UIColor = .white
    var cornerRadius: CGFloat = 0.0
    var borderWidth: CGFloat = 1.0
    var borderColor: UIColor = .white
    var font: UIFont = UIFont.systemFont(ofSize: 8)
    var textColor: UIColor = UIColor.white
    static var defaultSelectedDesign: TagDesign {
        return TagDesign(backgroudColor: .blue, cornerRadius: 0.0, borderWidth: 0.0, borderColor: .clear, font: UIFont.boldSystemFont(ofSize: 8), textColor: .white)
    }
    static var defaultNormalDesign: TagDesign {
        return TagDesign(backgroudColor: .white, cornerRadius: 0.0, borderWidth: 2.0, borderColor: .blue, font: UIFont.systemFont(ofSize: 8), textColor: .black)
    }
    public init(backgroudColor: UIColor = .clear,
         cornerRadius: CGFloat = 0.0,
         borderWidth: CGFloat = 2.0,
         borderColor: UIColor = .clear,
         font: UIFont = UIFont.systemFont(ofSize: 8),
         textColor: UIColor = .black) {
        self.backgroudColor = backgroudColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.font = font
        self.textColor = textColor
    }
}
