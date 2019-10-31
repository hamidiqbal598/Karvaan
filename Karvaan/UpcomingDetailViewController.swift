//
//  UpcomingDetailViewController.swift
//  Karvaan
//
//  Created by Hamid khan on 26/04/2019.
//  Copyright © 2019 AhmadShaheer. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabase

class UpcomingDetailViewController: UIViewController
{

    var eventDetail: String?
    var ref: DatabaseReference!
    var databasehandle:DatabaseHandle?
    
    @IBOutlet weak var Detail: UILabel!
    
    
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        Detail.text=eventDetail
        self.title = "Upcoming Detail Event"
        
        ref = Database.database().reference()
        
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
