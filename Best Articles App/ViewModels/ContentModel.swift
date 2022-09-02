//
//  ContentModel.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 02.09.2022.
//

import Foundation
import Alamofire

class ContentModel: ObservableObject {
    
    @Published var emailedArticles = [Article]()
    @Published var sharedArticles = [Article]()
    @Published var viewedArticles = [Article]()
    
    init() {
        
        getArticle(category: Constants.emaildKey, period: Constants.period, articles: emailedArticles)
        getArticle(category: Constants.sharedKey, period: Constants.period, articles: sharedArticles)
        getArticle(category: Constants.viewedKey, period: Constants.period, articles: viewedArticles)
        
    }
    
    //MARK: - NYT API methods
    
    func getArticle(category: String, period: String, articles: [Article]) {
        
        // Create URL
        let urlString = "\(Constants.apiUrl)\(category)/\(period).json?api-key=\(Constants.apiKey)"
        
        // Create reques
        let request = AF.request(urlString)
        
        request.responseDecodable(of: ArticleSearch.self) { (response) in
            guard let allArticles = response.value else { return }
            // Used to check response
            //print(allArticles.results)
            
            // Call the getImage function for the meta data in article
            for a in allArticles.results {
                if a.media != nil {
                    for m in a.media! {
                        if m.mediaMetadata != nil {
                            for md in m.mediaMetadata! {
                                md.getImageData()
                            }
                        }
                    }
                }
            }
            
            
            // Assign articles to the appropriate category
            switch category {
            case Constants.emaildKey:
                self.emailedArticles = allArticles.results
            case Constants.sharedKey:
                self.sharedArticles = allArticles.results
            case Constants.viewedKey:
                self.viewedArticles = allArticles.results
            default:
                break
            }
        }
    }
    
}
