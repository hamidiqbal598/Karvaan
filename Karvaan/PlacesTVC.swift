//
//  PlacesTVC.swift
//  Karvaan
//
//  Created by Hamid khan on 05/05/2019.
//  Copyright © 2019 AhmadShaheer. All rights reserved.
//

import UIKit

class PlacesTVC: UITableViewCell
{

    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeTitle: UILabel!
    @IBOutlet weak var placeDescription: UILabel!
    @IBOutlet weak var placeHeight: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
