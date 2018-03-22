//
//  ViewController.swift
//  NavDM2
//
//  Created by Merlin Zhao on 2/24/18.
//  Copyright © 2018 Merlin Zhao. All rights reserved.
//

import UIKit
import MessageUI
import CoreLocation //import CoreLocation

var getLatitude = 0.0 //global latitude
var getLongitude = 0.0 //global longitude

class ViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate,MFMessageComposeViewControllerDelegate,CLLocationManagerDelegate{
    let screenSize: CGRect = UIScreen.main.bounds
    let selection = UISelectionFeedbackGenerator()
    let impact = UIImpactFeedbackGenerator()
    var ifTwoClicked = false
    //MAIN SCREENNN
    //=========================
    //FIND WEATHER BUTTON
    @IBOutlet weak var findWeather: UIButton!
    
    @IBAction func findWeather(_ sender: Any) {
        if (MFMessageComposeViewController.canSendText()) {
            let recipients:[String] = ["2262860381"] //This is the phone number you type in
            let messageController = MFMessageComposeViewController()
            messageController.messageComposeDelegate  = self
            messageController.recipients = recipients
            messageController.body = "Weather, " + String(getLatitude) + "," + String(getLongitude)//this is your body txt you type in
            self.present(messageController, animated: true, completion: nil)
        }
        else{
            print("error")
        }
    }
    
    
    
    //REFRESH BUTTON
    @IBOutlet weak var refreshButton: UIButton!
    let locationManager = CLLocationManager()
    
    @IBAction func refreshButton(_ sender: Any) {
        selection.selectionChanged()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        getLatitude = locationManager.location!.coordinate.latitude
        getLongitude = locationManager.location!.coordinate.longitude
        positionLabel.text = "Latitude: " + String(getLatitude) + "\nLongitude: " + String(getLongitude)
        
        
    }
    
    
    
    
    //MAIN LABELs
    @IBOutlet weak var yourCurrentLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var notRequired: UILabel!
    @IBOutlet weak var afternoon: UILabel!
    
    
    //SECOND SCREEN
    //=================12324234536
    //SECOND SCREEN LABELS
    @IBOutlet weak var navDescription: UILabel!
    @IBOutlet weak var startDescription: UILabel!
    @IBOutlet weak var destDescription: UILabel!
    @IBOutlet weak var modeDescription: UILabel!
    @IBOutlet weak var modeOrDescription: UILabel!
    
    //     text fields
    @IBOutlet weak var startingText: UITextField!
    @IBOutlet weak var destinationText: UITextField!
    @IBOutlet weak var modeText: UITextField!
    
    var start = "" //SEARCH BUTTON
    @IBOutlet weak var navSearch: UIButton!
    @IBAction func navSearch(_ sender: Any) {
        
        if startingText.text! == "here" || startingText.text! == "Here" {
            start = String(getLatitude) + "," + String(getLongitude)
        }else{
            start = startingText.text!
        }
        
        
        let dest = destinationText.text!
        let mode = modeText.text!
        
        
        
        if (MFMessageComposeViewController.canSendText()) {
            
            
            print(type(of: start))
            let recipients:[String] = ["2262860381"] //This is the phone number you type in
            let messageController = MFMessageComposeViewController()
            messageController.messageComposeDelegate  = self
            messageController.recipients = recipients
            messageController.body = mode + ", " + start + ", " + dest
            self.present(messageController, animated: true, completion: nil)
        }
        else{
            print("error")
        }
    }
    
    //PAGE THREE SCREENN
    //-------------------0000000000000
    
    @IBOutlet weak var nearSearch: UITextField!
    @IBOutlet weak var nearSearchButton: UIButton!
    
  
    @IBOutlet weak var iconThree: UIImageView!
    
    @IBOutlet weak var nearYou: UILabel!
    @IBOutlet weak var connectUpdate: UILabel!
    
    @IBOutlet weak var descThree: UILabel!
    
    @IBAction func nearSearchButton(_ sender: Any) {
        if (MFMessageComposeViewController.canSendText()) {
            let search = nearSearch.text!
            
            let recipients:[String] = ["2262860381"] //This is the phone number you type in
            let messageController = MFMessageComposeViewController()
            messageController.messageComposeDelegate  = self
            messageController.recipients = recipients
            messageController.body = "description, " + search
            self.present(messageController, animated: true, completion: nil)
        }
        else{
            print("error")
        }
        
    }
    
    //        ADS/ NEAR YOU
    
    @IBOutlet weak var adOne: UIImageView!
    @IBOutlet weak var adTwo: UIImageView!
    
    @IBOutlet weak var adThree: UIImageView!
    
    
    
    
    
    
    
   //title
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var title2: UILabel!
    
    //card
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    
   
    @IBOutlet weak var navimage: UIImageView!
    

    
    
    var startingPosition = CGFloat(0)
    var bannerStart = CGFloat(0)
    var navStart = CGFloat(0)
    
    //animations
    //==============================================================================================
    //BUTTON ONE
    
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBAction func button(_ sender: Any) {
        
        impact.impactOccurred()
        ifTwoClicked = false
        UIView.animate(withDuration: 0.4, animations: {
            print(self.startingPosition)
            
            self.title1.alpha = 0
            self.title1.textColor = UIColor.white
            
            
            self.navimage.alpha = 0
            self.navimage.center.y = -100
            
            
            self.iconThree.center.x = self.screenSize.width + CGFloat(60)
       
            //SECOND SCREEN FADE OUT
            self.startingText.alpha = 0
            self.destinationText.alpha = 0
            self.modeText.alpha = 0
            self.navSearch.alpha = 0
            
            //      description fade OUT
            self.navDescription.alpha = 0
            self.modeDescription.alpha = 0
            self.modeOrDescription.alpha = 0
            self.startDescription.alpha = 0
            self.destDescription.alpha = 0
            
            
            //THIRD FADE OUT
            self.nearYou.alpha = 0
            self.connectUpdate.alpha = 0
            self.nearSearch.alpha = 0
            self.nearSearchButton.alpha = 0
            
            // ads
            self.adOne.center.y = self.screenSize.height + 100
            self.adTwo.center.y = self.screenSize.height + 500
            self.adThree.center.y  = self.screenSize.height + 1000
            
            self.adOne.alpha = 0
            self.adTwo.alpha = 0
            self.adThree.alpha = 0
            
            self.descThree.alpha = 0
            
        
        
            self.imageView.center.y = self.startingPosition
            
            
            
        })

        
    
        UIView.animate(withDuration: 0.20, delay: 0.3, animations: {
            self.title1.text = ""
            self.title1.alpha = 1
            //self.imageView.center.y = (self.startingPosition)
           
            //main screen fade IN
            self.findWeather.alpha = 0.65
            self.positionLabel.alpha = 1
            self.yourCurrentLabel.alpha = 1
            self.helloLabel.alpha = 1
            self.refreshButton.alpha = 0.65
            self.afternoon.alpha = 1
            self.notRequired.alpha = 1
           
            
        })
        
    }
    //==============================================================================================
    //==============================================================================================
    //BUTTON TWOOOOOOOO
    //-----------------------------
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    @IBAction func buttonTwo(_ sender: Any) {
       
        impact.impactOccurred()
        
        //*************************************
        if  ifTwoClicked == false{
            self.startingText.center.x = self.screenSize.width/(-2)
            self.destinationText.center.x = self.screenSize.width/(-1.3)
            self.modeText.center.x = self.screenSize.width/(-0.7)
            
            self.startDescription.center.x = self.screenSize.width/(-2)
            self.destDescription.center.x = self.screenSize.width/(-1.3)
            self.modeDescription.center.x = self.screenSize.width/(-0.9)
            self.modeOrDescription.center.x = self.screenSize.width/(-0.7)
            ifTwoClicked = true
            
        }
        
        
        
        UIView.animate(withDuration: 0.4, animations: {
            //self.imageView.center.y = (self.startingPosition -  CGFloat(self.screenSize.height*1))
            self.title1.alpha = 0
            self.imageView.center.y = self.screenSize.height * CGFloat(0.5)
            
            
            self.iconThree.center.x = self.screenSize.width + CGFloat(60)
            
            
            
            self.navimage.center.y = self.navStart
            self.navimage.alpha = 1
            
            self.iconThree.center.x = self.screenSize.width + CGFloat(60)
            
            //main screen fade OUT
            self.findWeather.alpha = 0
            self.positionLabel.alpha = 0
            self.yourCurrentLabel.alpha = 0
            self.helloLabel.alpha = 0
            self.refreshButton.alpha = 0
            self.afternoon.alpha = 0
            self.notRequired.alpha = 0
            
            
            //THIRD fade out
            self.nearYou.alpha = 0
            self.connectUpdate.alpha = 0
            self.nearSearch.alpha = 0
            self.nearSearchButton.alpha = 0
            
            // ads
            self.adOne.center.y = self.screenSize.height + 100
            self.adTwo.center.y = self.screenSize.height + 500
            self.adThree.center.y  = self.screenSize.height + 1000
            
            self.adOne.alpha = 0
            self.adTwo.alpha = 0
            self.adThree.alpha = 0
            
            self.descThree.alpha = 0
            
            

    
            
            
        })
      
        
        UIView.animate(withDuration: 0.20, delay: 0.3, animations: {
            self.title1.text = "Navigate"
            self.title1.alpha = 1

            
        })
        
        
         UIView.animate(withDuration: 0.6, animations: {
            //*************************************
            self.startingText.center.x = self.screenSize.width/2
            self.destinationText.center.x = self.screenSize.width/2
            self.modeText.center.x = self.screenSize.width - CGFloat(105)
            
            
            
            self.startDescription.center.x = self.screenSize.width/2
            self.destDescription.center.x = self.screenSize.width/2
            self.modeDescription.center.x = self.screenSize.width/2
            self.modeOrDescription.center.x = self.screenSize.width - (self.screenSize.width - CGFloat(100))
            
            
            //SECOND screen fade IN
            self.startingText.alpha = 0.65
            self.destinationText.alpha = 0.65
            self.modeText.alpha = 0.65
            self.navSearch.alpha = 0.65
            
            
            //      description fade in
            self.navDescription.alpha = 1
            self.modeDescription.alpha = 1
            self.modeOrDescription.alpha = 1
            self.startDescription.alpha = 1
            self.destDescription.alpha = 1
            
            
            //SCREEN THREE
            self.adOne.center.y = self.screenSize.height + 100
            self.adTwo.center.y = self.screenSize.height + 500
            self.adThree.center.y  = self.screenSize.height + 1000
            
            
            
            
        })
   
        
        
    }
       //==============================================================================================
       //==============================================================================================
       //==============================================================================================
    //BUTTON THREEERERERERERER
    //---======================
    

    
    @IBOutlet weak var buttonThree: UIButton!
    
    @IBAction func buttonThree(_ sender: Any) {
        impact.impactOccurred()
        
        ifTwoClicked = false
        
        self.nearYou.center.y = self.screenSize.height/2.6
        self.connectUpdate.center.y = self.screenSize.height/1.18
        self.nearSearch.center.y = self.screenSize.height/4
        
        self.nearSearchButton.center.y = self.screenSize.height/3.1
        
        self.descThree.center.y = self.screenSize.height/5.4
        
        
        
        UIView.animate(withDuration: 0.40, animations: {
            self.navDescription.alpha = 0
        })
        
        
        
        
        UIView.animate(withDuration: 0.60, animations: {
           // self.imageView.center.y = (self.startingPosition -  CGFloat(self.screenSize.height*1))
            self.title1.alpha = 0
            
            self.navimage.alpha = 0
      
            self.navimage.center.y = -100
            
            self.imageView.center.y = self.screenSize.height * CGFloat(-0.1)
            
            
            //main screen fade OUT
            self.findWeather.alpha = 0
            self.positionLabel.alpha = 0
            self.yourCurrentLabel.alpha = 0
            self.helloLabel.alpha = 0
            self.refreshButton.alpha = 0
            self.notRequired.alpha = 0
            self.afternoon.alpha = 0
            
            
            
            //SECOND SCREEN SLIDE OUT
            
            //SECOND screen fade OUT
            self.startingText.alpha = 0
            self.destinationText.alpha = 0
            self.modeText.alpha = 0
            self.navSearch.alpha = 0
            
            
            
            //      description fade OUT
            
            self.modeDescription.alpha = 0
            self.modeOrDescription.alpha = 0
            self.startDescription.alpha = 0
            self.destDescription.alpha = 0
            
            //*************************************
            self.startingText.center.x = self.screenSize.width/(0.5)
            self.destinationText.center.x = self.screenSize.width/(0.4)
            self.modeText.center.x = self.screenSize.width/(0.3)
            
            self.startDescription.center.x = self.screenSize.width/(0.6)
            self.destDescription.center.x = self.screenSize.width/(0.5)
            self.modeDescription.center.x = self.screenSize.width/(0.4)
            self.modeOrDescription.center.x = self.screenSize.width/(0.2)
            
            //ads
            
            self.adOne.center.y = self.screenSize.height/2 - 10
            self.adTwo.center.y = self.screenSize.height/2 + 100
            self.adThree.center.y  = self.screenSize.height/2 + 210
            
            self.adOne.alpha = 1
            self.adTwo.alpha = 1
            self.adThree.alpha = 1
            
            
            
        })
        

        
        UIView.animate(withDuration: 0.30, delay: 0.4, animations: {
            self.title1.text = "Places"
            self.title1.alpha = 1
            
            self.iconThree.center.x = self.screenSize.width - CGFloat(48)
            
            self.iconThree.alpha = 1
            self.nearYou.alpha = 1
            self.nearSearch.alpha = 0.65
            self.nearSearchButton.alpha = 0.65
            self.connectUpdate.alpha = 0.65
            
            self.descThree.alpha = 1
            
            
        
            
        })
        
      
    }
    
    
    
    
    //KEYBAORD STUFF LOL
    func hideKeyboard(){
        destinationText.resignFirstResponder()
        modeText.resignFirstResponder()
        startingText.resignFirstResponder()
        nearSearch.resignFirstResponder()
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      
        hideKeyboard()
        return true
    }
    
    
    

    
    
    override func viewDidAppear(_ animated: Bool) {
        
        buttonOne.center.y = self.screenSize.height - CGFloat(70)
        buttonTwo.center.y = self.screenSize.height - CGFloat(70)
        buttonThree.center.y = self.screenSize.height - CGFloat(70)
        
        
        //SECOND SCREEN!!
        
        
        //text feilsd
        self.startingText.center.y = screenSize.height/2 - CGFloat(70)
        self.destinationText.center.y = screenSize.height/2 + CGFloat(20)
        self.modeText.center.y = screenSize.height/2 + CGFloat(115)
        
        self.navSearch.center.y = screenSize.height/2 + CGFloat(200)
        
        // descriptions
        self.navDescription.center.y = screenSize.height - (screenSize.height - CGFloat(180))
        
        self.startDescription.center.y = screenSize.height/2 - CGFloat(105)
        self.destDescription.center.y = screenSize.height/2 + CGFloat(-16)
        self.modeDescription.center.y = screenSize.height/2 + CGFloat(80)
        self.modeOrDescription.center.y = screenSize.height/2 + CGFloat(115)
        
        
       
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startingPosition = self.imageView.center.y
        
        navStart = self.navimage.center.y
        
        
        self.navimage.alpha = 0
        //textfields inital
        self.startingText.alpha = 0
        self.destinationText.alpha = 0
        self.modeText.alpha = 0
        //search button
        self.navSearch.alpha = 0
        
        //keyboard
        destinationText.delegate = self
        startingText.delegate = self
        modeText.delegate = self
        
        
        
        //SECOND SCREEN
        //second logo inital
        self.navimage.alpha = 0
        self.iconThree.alpha = 0
        self.navimage.center.y = -100
        self.iconThree.center.x = screenSize.width + CGFloat(60)
        
        
        
        
        
        refreshButton.layer.cornerRadius = 20
        findWeather.layer.cornerRadius = 20
        navSearch.layer.cornerRadius = 20
        nearSearchButton.layer.cornerRadius = 20
        // Do any additional setup after loading the view, typically from a nib.
        
        //THIRD SCREEN
        self.nearYou.alpha = 0
        self.connectUpdate.alpha = 0
        
        self.nearSearch.alpha = 0
        self.nearSearchButton.alpha = 0
        
        self.adOne.center.y = screenSize.height + 100
        self.adTwo.center.y = screenSize.height + 500
        self.adThree.center.y  = screenSize.height + 1000
        
        self.adOne.alpha = 0
        self.adTwo.alpha = 0
        self.adThree.alpha = 0
        
        
        adOne.layer.cornerRadius = 12
        adThree.layer.cornerRadius = 12
        adTwo.layer.cornerRadius = 12
        
        
        
        
        
        
        
           //==============================================================================================
        //GPSGPSGPSPGSPGSPGPSGPSGPPSGPSGPSPGSPGSPGPSGPSGPSPGSP
        
        
        positionLabel.text = "Latitude: " + String(getLatitude) + "\nLongitude: " + String(getLongitude)
        
        //positionLabel.text = "Latitude: N/A \nLongitude: N/A"
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        //=====================================================
    }
    





    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            showLocationDisabledPopUp()
        }
    }
    func showLocationDisabledPopUp() {
        let alertController = UIAlertController(title: "Background Location Access Disabled",
                                                message: "Please enable Location Access to display current Location",
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    



}

