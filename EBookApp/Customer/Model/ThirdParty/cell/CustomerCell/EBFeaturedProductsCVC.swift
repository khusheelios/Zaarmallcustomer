//
//  EBFeaturedProductsCVC.swift
//  ZaarMallStackDemo
//
//  Created by Zanjo iOS Dev on 21/11/20.
//  Copyright © 2020 Zanjo iOS Dev. All rights reserved.
//

import UIKit

protocol FeaturedProductsDelegetes {

    func FavurtiesButton(sender:EBFeaturedProductsCVC)
}

class EBFeaturedProductsCVC: UICollectionViewCell {
    
    @IBOutlet weak var lblImgView: UIImageView!
    @IBOutlet weak var btnFavourites: UIButton!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblStoreName: UILabel!
    @IBOutlet weak var lblOriginalPrice: UILabel!
    @IBOutlet weak var lblOffPercent: UILabel!
    @IBOutlet weak var lblCutPrice: UILabel!
  
    var editData: FeaturedProductsDelegetes?
          var indexPath : IndexPath?

       
    
    @IBAction func favouritesAction(_ sender: Any) {
  self.editData?.FavurtiesButton(sender: self)

    }
    
  
    
    
}
