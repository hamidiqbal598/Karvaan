//
//  UpcomingEventsTVC.swift
//  Karvaan
//
//  Created by Hamid khan on 05/05/2019.
//  Copyright © 2019 AhmadShaheer. All rights reserved.
//

import UIKit

class UpcomingEventsTVC: UITableViewCell {

    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventStartDate: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var eventStartingPoint: UILabel!
    @IBOutlet weak var eventHost: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
