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
    @IBOutlet weak var resultView: UILabel!

    var randomCorrectnessIndex = Int(arc4random_uniform(UInt32(2)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let randomArray = self.wordStruct.randomArray()
        
        let word:String = randomArray[1]
        
        
        
        //        print(word)
        

        
        if randomCorrectnessIndex == 1 {
                    self.spanishWordLabel.text = randomArray[0]
        } else {
            let wrongRandomArray = self.wordStruct.randomArray()

                while wrongRandomArray[0] == randomArray[0] {
                    let wrongRandomArray = self.wordStruct.randomArray()
                    
            }
                self.spanishWordLabel.text = wrongRandomArray[0]
        }
        
        

    
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
        
                    self.flickrImage.getImageFromFlickrSearch(methodArguments, imageToUpdate: self.imageDisplayOutlet)
//        if methodArguments.isEmpty {
//            
//        }else {
////            self.flickrImage.getImageFromFlickrSearch(methodArguments)
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func yesButton(sender: AnyObject) {
        
        if randomCorrectnessIndex == 1{
            self.resultView.text = "Correct"
        } else{
            self.resultView.text = "Try again!"
        }
        
    }

    @IBOutlet weak var noButton: UIButton!
    
    @IBAction func nextQuiz(sender: AnyObject) {
        
    }
}

