//
//  EBookListTVC.swift
//  EBookApp
//
//  Created by apple on 26/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EBookListTVC: UICollectionViewCell {
    @IBOutlet weak var btnAddToCart: CustomizableButton!
    @IBOutlet weak var ratingslbl: UILabel!
    @IBOutlet weak var bookTitles: UILabel!
    @IBOutlet weak var Authornamelbl: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var amountlbl: UILabel!

    @IBOutlet weak var soldImage: UIImageView!
    @IBOutlet weak var soldPopupView: UIView!
    
}