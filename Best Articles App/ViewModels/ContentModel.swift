//
//  ContentModel.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 02.09.2022.
//

import Foundation
import Alamofire

class ContentModel: ObservableObject {
    
    // Reference to the Core Data object
    let managedObjectContext = PersistenceController.shared.container.viewContext
    
    @Published var emailedArticles = [Article]()
    @Published var sharedArticles = [Article]()
    @Published var viewedArticles = [Article]()
    
    init() {
        
        getArticle(category: Constants.emaildKey, period: Constants.period, articles: emailedArticles)
        getArticle(category: Constants.sharedKey, period: Constants.period, articles: sharedArticles)
        getArticle(category: Constants.viewedKey, period: Constants.period, articles: viewedArticles)
        
    }
    
    //MARK: - Core Data methods
    
    func saveArticle(article: Article) {
        
        // Create Core Data object
        let savedArticle = ArticleSaved(context: managedObjectContext)
        
        // Set its properties
        savedArticle.id = UUID()
        savedArticle.adxKeywords = article.adxKeywords
        savedArticle.abstract = article.abstract
        savedArticle.byLine = article.byLine
        savedArticle.publishedDate = article.publishedDate
        savedArticle.url = article.url
        savedArticle.title = article.title
        savedArticle.section = article.section
        savedArticle.nytdSection = article.nytdSection
        savedArticle.source = article.source
        savedArticle.type = article.type
        savedArticle.updatedDate = article.updated
        savedArticle.uri = article.uri
        if article.media != nil && article.media?.count != 0 {
            if article.media![0].mediaMetadata != nil && article.media![0].mediaMetadata?.count != 0 {
                savedArticle.imageData = article.media![0].mediaMetadata![0].imageData!
            }
        }
        
        // Save into Core Data
        do {
            try managedObjectContext.save()
        }
        catch {
            // Couldn't save core data
            print(error.localizedDescription)
        }
        
    }
    
    func deleteSavedAtricle(article: ArticleSaved) {
        
        // Delete an article from saved
        managedObjectContext.delete(article)
        
        // Save changes in Core Data
        do {
            try managedObjectContext.save()
        }
        catch {
            // Couldn't save core data
            print(error.localizedDescription)
        }
        
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
