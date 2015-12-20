//
//  SecondViewController.swift
//  SwipeSpanish
//
//  Created by Cobo, Javier on 12/12/15.
//  Copyright © 2015 Cobo, Javier. All rights reserved.
//

import UIKit




class SecondViewController: UIViewController {
        let wordStruct = Words()
    let flickrImage = GetFlickrImage()
    
    
    @IBOutlet weak var imageDisplayOutlet: UIImageView!
    
    @IBOutlet weak var spanishWordLabel: UILabel!

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
            "sort": SORT
        ]
        if methodArguments.isEmpty {
            
        }else {
//            self.flickrImage.getImageFromFlickrSearch(methodArguments)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

