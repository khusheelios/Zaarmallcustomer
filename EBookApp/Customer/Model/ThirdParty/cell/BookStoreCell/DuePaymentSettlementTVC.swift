//
//  DuePaymentSettlementTVC.swift
//  EBookApp
//
//  Created by apple on 23/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class DuePaymentSettlementTVC: UITableViewCell {

    @IBOutlet weak var btnCheckBox: UIButton!
    @IBOutlet weak var datelbl: UILabel!
        @IBOutlet weak var amountlbl: UILabel!
        @IBOutlet weak var transacstionidlbl: UILabel!
       var customView = UIView()
        override func awakeFromNib() {
            super.awakeFromNib()
            customView = UIView(frame: CGRect(x: 15, y: 0, width: 350, height:1))
            self.addSubview(customView)

        }

        override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)

          if selected {
            accessoryType = .checkmark
          } else {
            accessoryType = .none
          }
        }

    }
