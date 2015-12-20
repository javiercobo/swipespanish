//
//  FirstViewController.swift
//  SwipeSpanish
//
//  Created by Cobo, Javier on 12/12/15.
//  Copyright © 2015 Cobo, Javier. All rights reserved.
//

import UIKit



let BASE_URL = "https://api.flickr.com/services/rest/"
let METHOD_NAME:String! = "flickr.photos.search"
let API_KEY:String! = "0693969f57676ff5e48db06d2ba62027"
let GALLERY_ID:String! = "5704-72157622566655097"
let EXTRAS:String! = "url_m"
let DATA_FORMAT:String! = "json"
let SAFE_SEARCH:String!="1"
let NO_JSON_CALLBACK:String! = "1"
let SORT = "relevance"



class FirstViewController: UIViewController {
    let wordStruct = Words()
    let flickrImage = GetFlickrImage()
    
//    var iNamey = [String]()
//    var iImage = [String]()
//    var iImageUrl = [NSURL]()
//    var counter=0
   
    
    @IBOutlet weak var imageDisplayOutlet: UIImageView!
    
    @IBOutlet weak var spanishWordLabel: UILabel!
    
    @IBOutlet weak var searchText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let randomArray = self.wordStruct.randomArray()
        
        let word:String = randomArray[1]

        
        
        
        //        print(word)
        
        self.spanishWordLabel.text = randomArray[0]
        
        var methodArguments = [
            "method": METHOD_NAME,
            "api_key": API_KEY,
            "text": word,
            "safe_search": SAFE_SEARCH,
            "extras": EXTRAS,
            "format": DATA_FORMAT,
            "nojsoncallback": NO_JSON_CALLBACK,
            "sort": SORT,

        ]
//        if methodArguments.isEmpty {
//            
//        }else {
            self.flickrImage.getImageFromFlickrSearch(methodArguments, imageToUpdate: self.imageDisplayOutlet)
//        }
        // Do any additional setup after loading the view, typically from a nib.
//        https://api.flickr.com/services/rest/?method=flickr.test.echo&name=value
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
         if let imageData = NSData(contentsOfURL!) {
                dispatch_async(dispatch_get_main_queue(), {
                self.mainImg.image = UIImage(data: imageData)
                                self.titleLabel.text = photoTitle
                            })
                        } else {
                            print("image does not exist at \(imageURL)")
                        }else {
                            print("Cannot find key 'photo' in \(photosDictionary)")
                        }else {
                            print("Cannot find key 'photos' in \(parsedResult)"
                    
                        
                    */
                    
                    
            

            


    
    @IBAction func nextImageButton(sender: AnyObject) {
        flickrImage.nextPerson(self.imageDisplayOutlet)
    }
    
   //replace searchText with random in dictionary
   
    @IBAction func searchButton(sender: AnyObject) {
        let randomArray = self.wordStruct.randomArray()
        
        let word:String = randomArray[1]
        
        
        
//        print(word)
        
        self.spanishWordLabel.text = randomArray[0]
        
        var methodArguments = [
            "method": METHOD_NAME,
            "api_key": API_KEY,
            "text": word,
            "safe_search": SAFE_SEARCH,
            "extras": EXTRAS,
            "format": DATA_FORMAT,
            "nojsoncallback": NO_JSON_CALLBACK,
            "sort": SORT
        ]
        
        GetFlickrImage().getImageFromFlickrSearch(methodArguments, imageToUpdate: self.imageDisplayOutlet)
        
        
//        if methodArguments.isEmpty {
//            
//        }else {
//            self.flickrImage.getImageFromFlickrSearch(methodArguments)
//            self.imageDisplayOutlet.image = UIImage(data: imageData)
//            self.imageDisplayOutlet.contentMode = .ScaleAspectFit
//            self.imageDisplayOutlet.clipsToBounds = true
//            
//        }
    } //close IBAction searchButton
    

}

