//
//  ViewControllercompany.swift
//  travel
//
//  Created by Abdo on 9/19/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Alamofire
import SwiftyJSON

class ViewControllercompany: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    
    let url = "https://travelagenciesdeals.com/api/register"
    let defult =  UserDefaults.standard
    @IBOutlet weak var imgofuser: UITextField!
    @IBOutlet weak var paswordrebeat: UITextField!
    @IBOutlet weak var passwordofuser: UITextField!
    @IBOutlet weak var adressofuser: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var mailofuser: UITextField!
    @IBOutlet weak var fulname: UITextField!
    var imgpickerr = UIImagePickerController()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signin(_ sender: Any) {
        
        
        
        if checkmark.currentImage == UIImage(named: "check box full.png") {
            if passwordofuser.text == paswordrebeat.text {
                guard let img = imgofuser.text, !img.isEmpty else{return}
                guard let mail = mailofuser.text, !mail.isEmpty else{return}
                guard let phon = phone.text, !phon.isEmpty else{return}
                guard let addres = adressofuser.text, !addres.isEmpty else{return}
                guard let pas = passwordofuser.text, !pas.isEmpty else{return}
                guard let name = fulname.text, !name.isEmpty else{return}
                let arname = "ffffffff"
                let endetails = "Any Words Words Words"
                let ardetails = "اي كلام كلام كلام"
                let lat = "30.00000000"
                let lang = "50.00000000"
                let type = "user"
                let language = "en"
                let facebook = "safasdf"
                let youtube = "jgfhkgjekr"
                let instagram = "erw"
                let linkedin = "uwer"
                let subscription = "enwqe"
                let twitter = "wqeweqe"
                let web = "aybtngan"
                
                let parm = [
                    "email":mail,
                    "en-name":name,
                    "password":pas,
                    "ar-name":arname,
                    "en-details":endetails,
                    "ar-details":ardetails,
                    "phone":phon,
                    "website":web,
                    "address":addres,
                    "photo":img,
                    "lat":lat,
                    "lang":lang,
                    "type":type,
                    "language":language,
                    "facebook":facebook,
                    "youtube":youtube,
                    "instagram":instagram,
                    "linkedin":linkedin,
                    "subscription":subscription,
                    "twitter":twitter
                    
                    
                ]
                Alamofire.request(url, method: .post, parameters: parm, encoding: URLEncoding.default, headers: nil).responseJSON { re in
                    switch re.result
                    {
                    case .failure(let erro):
                        print("********////",erro)
                    case .success(let value):
                        print("fuck")
                        //al if  al awlanya m4 48ala
                        //error
                        
                        
                        let jsoncode = JSON(value)
                        if let id = jsoncode["errors"]["email"].string{
                            print("§§§§§§§§§§§§§§§§§§§§§§§§")
                            print(id)
                            let alert = UIAlertController(title: "Alert", message: id, preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            
                        }else{let alert = UIAlertController(title: "Alert", message:"Done" , preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "done", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            
                             self.performSegue(withIdentifier: "done", sender: self)
                        }
                        
                        
                        
                    }}
                
                
                
                
                
            }else{
                let alert = UIAlertController(title: "Alert", message:"Password dont match" , preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
            
            
        }else{
            let alert = UIAlertController(title: "Alert", message:"pleace check the check box" , preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    
    
    @IBAction func garally(_ sender: Any) {
        let action = UIAlertController(title: "photo sourse", message: "chose", preferredStyle: .actionSheet)
        action.addAction(UIAlertAction(title: "camera", style: .default, handler: { (action:UIAlertAction) in
            self.imgpickerr.sourceType = .camera
            self.present(self.imgpickerr, animated: true, completion: nil)
        }))
        
        action.addAction(UIAlertAction(title: "photolirary", style: .default, handler: { (action:UIAlertAction) in
            self.imgpickerr.sourceType = .photoLibrary
            self.present(self.imgpickerr, animated: true, completion: nil)
        }))
        imgpickerr.delegate = self 
        
        action.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        self.present(action, animated: true, completion: nil)
        
        
    }
    
    
    
    
    @IBAction func agree(_ sender: Any) {
        let alertController = UIAlertController(title: "police and right", message:
            "The typical warning states: You have the right to remain silent and refuse to answer questions. Anything you say may be used against you in a court of law. You have the right to consult an attorney before speaking to the police and to have an attorney present during questioning now or in the future.", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var checkmark: UIButton!
    @IBAction func check(_ sender: Any) {
        
            if checkmark.currentImage == UIImage(named: "check box.png") {
                checkmark.setImage(UIImage(named: "check box full.png"), for: .normal)
                print("deletimge")
            }else {
                
                checkmark.setImage(UIImage(named: "check box.png"), for: .normal)
                print("doneomge")
                
            }
    }
    
}

extension ViewControllercompany : IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Company")
    }
    
    
}
