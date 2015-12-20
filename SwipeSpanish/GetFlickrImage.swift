//
//  GetFlickrImage.swift
//  SwipeSpanish
//
//  Created by Cobo, Javier on 12/20/15.
//  Copyright © 2015 Cobo, Javier. All rights reserved.
//

import Foundation
import UIKit

class GetFlickrImage {
    
    var iNamey = [String]()
    var iImage = [String]()
    var iImageUrl = [NSURL]()
//    var imageData1 = NSData()
    
    var counter=0
    
    func escapedParameters(parameters: [String : String!]) -> String! {
        var urlVars = [String]()
        for (key, value) in parameters {
            let stringValue = "\(value)"
            let escapedValue = stringValue.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
            
            urlVars += [key + "=" + "\(escapedValue!)"]
        }
        return (!urlVars.isEmpty ? "?" : "") + urlVars.joinWithSeparator("&")
    }
    

    
    func getImageFromFlickrSearch(methodArguments: [String : String!], imageToUpdate: UIImageView) {
        let session = NSURLSession.sharedSession()
        let urlString = BASE_URL + escapedParameters(methodArguments)
        print(urlString)
        let url = NSURL(string: urlString)!
        let request = NSURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request) {data, response, downloadError in
            if let error = downloadError {
                print("Could not complete the request \(error)")
            } else {
                var parsingError: NSError? = nil
                let parsedResult: AnyObject!
                do {
                    parsedResult = try
                        NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                }
                catch let error as NSError {
                    parsingError = error
                    parsedResult = nil
                } catch {
                    fatalError()
                }
                
                if let photosDictionary = parsedResult.valueForKey("photos") as? NSDictionary {
                    if let photoArray = photosDictionary.valueForKey("photo") as? [[String: AnyObject]] {
                        for (var index = 0; index < photoArray.count; ++index ){
                            let photoDictionary = photoArray[index] as [String:AnyObject]
                            
                            let photoTitle = photoDictionary["title"] as? String
                            var imageUrlString = photoDictionary["url_m"] as? String
                            if(imageUrlString==nil){
                                
                            }else {
                                let imageURL = NSURL(string: imageUrlString!)
                                self.iNamey.append(photoTitle!)
                                self.iImage.append(imageUrlString!)
                                self.iImageUrl.append(imageURL!)
                            }
                            
                        }
                        
                        /* Grab a single, random image */
//                        let randomPhotoIndex = Int(arc4random_uniform(UInt32(photoArray.count)))
                        // changed this to only the top 5 to reduce poor image results.  Trying to get only the most relevant results.  Ideally, would try to find a way to tag only animals so that things like "cricket" wouldn't show the sport and "crane" won't show a construction machine
                        
                        let randomPhotoIndex = Int(arc4random_uniform(UInt32(5)))
                        
                        let photoDictionary = photoArray[randomPhotoIndex] as [String: AnyObject]
                        //    let photoDictionary = photoArray[0] as [String: AnyObject]
                        
                        /* Get the image url and title of random image */
                        let photoTitle = photoDictionary["title"] as? String
                        
                        let imageUrlString = photoDictionary["url_m"] as? String
                        let imageURL = NSURL (string: imageUrlString!)
                        
                        /* If an image exists at the url, set the image and title to storyboard*/
                        
                        if let imageData = NSData(contentsOfURL: imageURL!) {
                            dispatch_async(dispatch_get_main_queue(), {
                               
                                /*   if we want to set a title, we can set it here:
                                self.titleLabel.text = photoTitle */
                                
                                imageToUpdate.image = UIImage(data: imageData)
                                imageToUpdate.contentMode = .ScaleAspectFit
                                imageToUpdate.clipsToBounds = true
                                
                                let imageURL = NSURL(string: imageUrlString!)
                                self.iNamey.append(photoTitle!)
                                self.iImage.append(imageUrlString!)
                                self.iImageUrl.append(imageURL!)
                                
                                
                            })
                            
                        }
                            
                            
                        else {
                            print("Image does not exist at \(imageURL) or can't find key 'photo' in \(photosDictionary) or in \(parsedResult)")
                        }
                        

                    }
                }
                
                /* 9 - Resume (execute) the task */
                
            }
        }
        task.resume()
        
    }
    
    func nextPerson(imageToUpdate: UIImageView){
        /* If image exists at url, set the image and title */
        
        
        if let imageData = NSData(contentsOfURL: iImageUrl[counter]) {
            dispatch_async(dispatch_get_main_queue(), {
                imageToUpdate.image = UIImage(data: imageData)
                /* if we want to include title:  self.titleLabel.text = self.iNamey[self.counter] */
                self.counter++
                if(self.counter==self.iNamey.count){
                    self.counter=0;
                }
            })
        } else {
            print("Image does not exist at \(iImageUrl[0])")
        }
    } // end of func nextPerson()
   


    
}