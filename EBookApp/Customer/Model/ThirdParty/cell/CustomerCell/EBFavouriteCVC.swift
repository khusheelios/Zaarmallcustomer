//
//  EBookCVC.swift
//  EBookApp
//
//  Created by apple on 25/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
protocol EBFavurtiesttonsDelegetes {

    func FavurtiesButton(_ sender:EBFavouriteCVC)
}


class EBFavouriteCVC: UICollectionViewCell {
    @IBOutlet weak var btnAddToCart: CustomizableButton!
    @IBOutlet weak var ratingslbl: UILabel!
    @IBOutlet weak var bookTitles: UILabel!
    @IBOutlet weak var Authornamelbl: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var amountlbl: UILabel!
    @IBOutlet weak var amountlbl1: UILabel!
    @IBOutlet weak var perstagelbl: UILabel!
    
    var editData: EBFavurtiesttonsDelegetes?
    var indexPath : IndexPath?

    
    @IBOutlet weak var btnFavuties: UIButton!
    
    @IBAction func btnFavrtioes(_ sender: Any) {
        self.editData?.FavurtiesButton(self)


        if btnFavuties.tag == indexPath?.row {


        }

    }
    
}
