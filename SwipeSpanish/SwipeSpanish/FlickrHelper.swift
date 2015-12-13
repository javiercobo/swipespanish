//
//  FlickrHelper.swift
//  SwipeSpanish
//
//  Created by Cobo, Javier on 12/12/15.
//  Copyright © 2015 Cobo, Javier. All rights reserved.
//

import UIKit

class FlickrHelper: NSObject {
    
    //call the REST API
    
    class func URLForSearchString (searchString:String) -> String {
        let apiKey:String = "0693969f57676ff5e48db06d2ba62027"
        
        let search:String = (searchString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding))!

        return "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&text\(search)&per_page=20&format=json&nojsoncallback=1"
    
    }
    
    // call individual photo
    
    class func URLForFlickrPhoto(photo:FlickrPhoto, size:String)->String{
        var _size:String = size
        
        if _size.isEmpty{
            _size = "m"
        }
         return "http://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.photoID)_\(photo.secret)_\(_size).jpg"
        
    }
    
//    var eq:Bool{
//        if 2 > 1{
//            return true
//        }else{
//            return false
//        }
//        
//    }
    
    
    func searchFlickrForString(searchStr:String, completion:(searchString:String!, flickrPhotos:NSMutableArray!, error:NSError!)->()){
        let searchURL:String = FlickrHelper.URLForSearchString(searchStr)
        let queue:dispatch_queue_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
        
        dispatch_async(queue, {
            var error:NSError?
            
            let searchResultString:String! = String.string
            }<#T##block: dispatch_block_t##dispatch_block_t##() -> Void#>)
    }

}
