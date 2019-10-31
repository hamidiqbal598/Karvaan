//
//  CreateTripViewController.swift
//  Karvaan
//
//  Created by Hamid khan on 03/05/2019.
//  Copyright © 2019 AhmadShaheer. All rights reserved.
//

import UIKit

class CreateTripViewController:
    UIViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
{
        
    @IBOutlet weak var createTitle: UITextField!
    @IBOutlet weak var createDecription: UITextField!
    @IBOutlet weak var createDDescription: UITextView!
    
    @IBOutlet weak var createStartDate: UITextField!
    @IBOutlet weak var createEndDate: UITextField!
    @IBOutlet weak var createDuration: UITextField!
    @IBOutlet weak var createID: UITextField!
    @IBOutlet weak var createStartingPoint: UITextField!
    @IBOutlet weak var createRegistrationLink: UITextField!
    
    @IBOutlet weak var uploadImage1: UIImageView!
    @IBOutlet weak var uploadImage2: UIImageView!
    @IBOutlet weak var uploadImage3: UIImageView!
    @IBOutlet weak var uploadImage4: UIImageView!
    
    @IBOutlet weak var uploadButton1: UIButton!
    @IBOutlet weak var uploadButton2: UIButton!
    @IBOutlet weak var uploadButton3: UIButton!
    @IBOutlet weak var uploadButton4: UIButton!
    
    
    @IBOutlet weak var CreateSubmit: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var check:Int = 0
    
    
    @IBAction func UploadingImage1(_ sender: Any)
    {
        let myPicker1=UIImagePickerController()
        myPicker1.delegate=self;
        myPicker1.sourceType=UIImagePickerController.SourceType.photoLibrary
        self.present(myPicker1, animated: true, completion: nil)
        check=1
        
    }
    
    
    @IBAction func UploadingImage2(_ sender: Any)
    {
        let myPicker2=UIImagePickerController()
        myPicker2.delegate=self;
        myPicker2.sourceType=UIImagePickerController.SourceType.photoLibrary
        self.present(myPicker2, animated: true, completion: nil)
        check=2
    }
    
    @IBAction func UploadingImage3(_ sender: Any)
    {
        let myPicker3=UIImagePickerController()
        myPicker3.delegate=self;
        myPicker3.sourceType=UIImagePickerController.SourceType.photoLibrary
        self.present(myPicker3, animated: true, completion: nil)
        check=3
    }
    
    @IBAction func UploadingImage4(_ sender: Any)
    {
        let myPicker4=UIImagePickerController()
        myPicker4.delegate=self;
        myPicker4.sourceType=UIImagePickerController.SourceType.photoLibrary
        self.present(myPicker4, animated: true, completion: nil)
        check=4
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if(check==1)
        {
            uploadImage1.image=info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            uploadImage1.backgroundColor=UIColor.clear
            self.dismiss(animated: true,completion: nil)
        }
        else if(check==2)
        {
            uploadImage2.image=info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            uploadImage2.backgroundColor=UIColor.clear
            self.dismiss(animated: true,completion: nil)
        }
        else if(check==3)
        {
            uploadImage3.image=info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            uploadImage3.backgroundColor=UIColor.clear
            self.dismiss(animated: true,completion: nil)
        }
        else if(check==4)
        {
            uploadImage4.image=info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            uploadImage4.backgroundColor=UIColor.clear
            self.dismiss(animated: true,completion: nil)
        }
        
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
