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

class FirstViewController: UIViewController {
    
    var photoArray2: AnyObject! = [String: AnyObject]()
    
    var iNamey = [String]()
    var iImage = [String]()
    var iImageUrl = [NSURL]()
    
    var counter=0;
    
    @IBOutlet weak var imageDisplayOutlet: UIImageView!
    
    @IBOutlet weak var spanishWordLabel: UILabel!
    
    @IBOutlet weak var searchText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        https://api.flickr.com/services/rest/?method=flickr.test.echo&name=value
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getImageFromFlickrSearch(methodArguments: [String : String!]) {
        let session = NSURLSession.sharedSession()
        let urlString = BASE_URL + escapedParameters(methodArguments)
        print(urlString)
        let url = NSURL
    }

    @IBAction func nextImageButton(sender: AnyObject) {
        
    }
    @IBAction func searchButton(sender: AnyObject) {
        let word:String! = searchText.text
        print(word)
        
        var methodArguments = [
        "method": METHOD_NAME,
            "api_key": API_KEY,
            "text": word,
            "sefe_search": SAFE_SEARCH,
            "extras": EXTRAS,
            "format": DATA_FORMAT,
            "nojsoncallback": NO_JSON_CALLBACK
        ]
        if methodArguments.isEmpty {
            
        }else {
            getImageFromFlickrSearch(methodArguments)
        }
    }
    

}

