//
//  Article.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 02.09.2022.
//

import Foundation

struct Article: Decodable {
    
    var url:String?
    var adxKeywords:String?
    var subsection:String?
    var section:String?
    var id:Int?
    var assetID:Int?
    var nytdsection:String?
    var byline:String?
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
        case assetID = "asset_id"
        case publishedDate = "published_date"
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        
        case url
        case subsection
        case section
        case id
        case nytdsection
        case byline
        case type
        case title
        case abstract
        case source
        case updated
        case media
    }
    
}

struct Media:Decodable {
    
    var type:String?
    var subtype:String?
    var caption:String?
    var copyright:String?
    var approvedForSynication:Bool?
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

struct MediaMetadata: Decodable {
    var url:String?
    var format:String?
    var height:Int?
    var width:Int?
}
