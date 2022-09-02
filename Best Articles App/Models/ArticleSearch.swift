//
//  ArticleSearch.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 02.09.2022.
//

import Foundation

struct ArticleSearch: Decodable {
    
    var status = ""
    var copyright = ""
    var numResults = 0
    var results = [Article]()
    
    enum CodingKeys: String, CodingKey {
        
        case numResults = "num_results"
        
        case status
        case copyright
        case results
    }
}
