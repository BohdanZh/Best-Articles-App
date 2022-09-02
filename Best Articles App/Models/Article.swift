//
//  Article.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 02.09.2022.
//

import Foundation

class Article: Decodable, Identifiable, ObservableObject {
    
    var uri:String?
    var url:String?
    var adxKeywords:String?
    var subsection:String?
    var section:String?
    var nytdSection:String?
    var byLine:String?
    var type:String?
    var title:String?
    var abstract:String?
    var publishedDate:String?
    var source:String?
    var updated:String?
    var desFacet:[String]?
    var orgFacet:[String]?
    var perFacet:[String]?
    var geoFacet:[String]?
    var media:[Media]?
    
    enum CodingKeys: String, CodingKey {
        
        case adxKeywords = "adx_keywords"
        case nytdSection = "nytdsection"
        case byLine = "byline"
        case publishedDate = "published_date"
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"

        
        case uri
        case url
        case subsection
        case section
        case type
        case title
        case abstract
        case source
        case updated
        case media
    }
    
}

class Media:Decodable {
    
    var type:String?
    var subtype:String?
    var caption:String?
    var copyright:String?
    var approvedForSynication:Int?
    var mediaMetadata: [MediaMetadata]?
    
    enum CodingKeys: String, CodingKey {
        
        case approvedForSynication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
        
        case type
        case subtype
        case caption
        case copyright
    }
}

class MediaMetadata: Decodable {
    
    var imageData: Data?
    
    var url:String?
    var format:String?
    var height:Int?
    var width:Int?
    
    func getImageData() {
        
        //Check that image url isn't nil
        guard url != nil else {
            return
        }
        
        //Download the data for the image
        if let url = URL(string: url!) {
            
            //Get a session
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { data, response, error in
                
                if error == nil {
                    
                    DispatchQueue.main.async {
                        //Set the image data
                        self.imageData = data!
                    }
                }
            }
            dataTask.resume()
        }
        
    }
}
