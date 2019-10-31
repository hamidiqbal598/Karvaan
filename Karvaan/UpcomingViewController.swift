//
//  UpcomingViewController.swift
//  Karvaan
//
//  Created by Hamid khan on 26/04/2019.
//  Copyright © 2019 AhmadShaheer. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabase

class UpcomingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    var ref: DatabaseReference!
    var databasehandle:DatabaseHandle?
    
    @IBOutlet weak var tableview: UITableView!
    
    var eventsTitle = [String]()
    var eventsDate = [String]()
    var eventsDescription = [String]()
    var eventsStartPoint = [String]()
    var eventsImageURL = [UIImage]()
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return eventsTitle.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseableIdentifier, for: indexPath) as! UpcomingEventsTVC
        
        cell.eventTitle.text = eventsTitle[indexPath.row]
        cell.eventStartDate.text = eventsDate[indexPath.row]
        cell.eventDescription.text = eventsDescription[indexPath.row]
        cell.eventStartingPoint.text = eventsStartPoint[indexPath.row]
        //image Remaining
        
        
        cell.eventImage.image = eventsImageURL[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="UpcomingDetailSegue"
        {
            if let dest = segue.destination as? UpcomingDetailViewController{
                if let index = sender as? IndexPath{
                    dest.eventDetail = eventsTitle[index.row]
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        performSegue(withIdentifier: "UpcomingDetailSegue", sender: indexPath)
    }
    
    let reuseableIdentifier = "UpcomingTableCell"
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Upcoming Events"
        
        //setting firebase
        ref = Database.database().reference()
        databasehandle = ref?.child("Events").observe(.childAdded, with: { (snapshot) in
            
            
            //let val=DataSnapshot.value(forKey: <#T##String#>)
            let value = snapshot.value as? NSDictionary
            if snapshot.hasChild("Title") && snapshot.hasChild("StartDate") && snapshot.hasChild("imgURL") && snapshot.hasChild("StartingPoint")
            {
                let title = value?["Title"] as? String ?? ""
                let start = value?["StartDate"] as? String ?? ""
                let description = value?["Description"] as? String ?? ""
                let point = value?["StartingPoint"] as? String ?? ""
                
                //let pic=child["Image"] as? String ?? ""
                
                let picture = value?["imgURL"] as? String ?? ""
                
                
                self.eventsTitle.append(title)
                self.eventsDate.append(start)
                self.eventsDescription.append(description)
                self.eventsStartPoint.append(point)
                
                let url = NSURL(string: picture)
                let data = NSData(contentsOf : url! as URL)
                let image = UIImage(data : data! as Data)?.alpha(0.5)
                self.eventsImageURL.append(image!)
                
                
                
                self.tableview.reloadData()
                
                
                
            }else
            {
                
            }
        })

        // Do any additional setup after loading the view.
    }
    //--------

}
extension UIImage {
    
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
