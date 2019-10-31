//
//  PlacesDetailViewController.swift
//  Karvaan
//
//  Created by Hamid khan on 03/05/2019.
//  Copyright © 2019 AhmadShaheer. All rights reserved.
//

import UIKit

class PlacesDetailViewController: UIViewController
{

    var eventDetail: String?
    @IBOutlet weak var Detail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Detail.text=eventDetail
        // Do any additional setup after loading the view.
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
