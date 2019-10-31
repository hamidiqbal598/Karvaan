//
//  PlacesViewController.swift
//  Karvaan
//
//  Created by Hamid khan on 26/04/2019.
//  Copyright © 2019 AhmadShaheer. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabase

class PlacesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    var ref: DatabaseReference!
    var databasehandle:DatabaseHandle?
    @IBOutlet weak var tableview: UITableView!
    
    var placesTitle = [String]()
    var placesHeight = [String]()
    var placesDescription = [String]()
    var placesImageURL = [UIImage]()

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseableIdentifier, for: indexPath) as! PlacesTVC
        
        cell.placeTitle.text = placesTitle[indexPath.row]
        cell.placeHeight.text = placesHeight[indexPath.row]
        cell.placeDescription.text = placesDescription[indexPath.row]
        //image Remaining
        
        
        cell.placeImage.image = placesImageURL[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="PlacesDetailSegue"
        {
            if let dest = segue.destination as? PlacesDetailViewController{
                if let index = sender as? IndexPath
                {
                    dest.eventDetail = placesTitle[index.row]
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        performSegue(withIdentifier: "PlacesDetailSegue", sender: indexPath)
    }
    
    let reuseableIdentifier = "PlacesTableCell"
    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = "Places"
        
        ref = Database.database().reference()
        databasehandle = ref?.child("Places").observe(.childAdded, with: { (snapshot) in
            
            
            //let val=DataSnapshot.value(forKey: <#T##String#>)
            let value = snapshot.value as? NSDictionary
            if snapshot.hasChild("Title") && snapshot.hasChild("Description") && snapshot.hasChild("imgURL") && snapshot.hasChild("Height")
            {
                let title = value?["Title"] as? String ?? ""
                let height = value?["Height"] as? String ?? ""
                let description = value?["Description"] as? String ?? ""
                
                let picture = value?["imgURL"] as? String ?? ""
                
                
                self.placesTitle.append(title)
                self.placesHeight.append(height)
                self.placesDescription.append(description)
                
                let url = NSURL(string: picture)
                let data = NSData(contentsOf : url! as URL)
                let image = UIImage(data : data! as Data)?.alpha(0.5)
                self.placesImageURL.append(image!)
                
                self.tableview.reloadData()
                
                
                
            }else
            {
                
            }
        })

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
