//
//  SavedArticleDetails.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 03.09.2022.
//

import SwiftUI

struct SavedArticleDetails: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var model: ContentModel
    
    var article: ArticleSaved
    @Binding var selectedTab:Int
    
    var body: some View {
        VStack (alignment: .leading){
            ScrollView{
                    VStack (alignment: .leading, spacing: 5){

                        // Title
                        Text(article.title ?? "")
                            .bold()
                            .font(.title)
                            .padding(.horizontal)
                        
                        // NYT API Attribution
                        Link(destination: Constants.labelUrl!){
                            Image("apiLableDetailed")
                        }
                        
                        Divider()
                            .padding(.vertical, 10)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            
                            VStack (alignment: .leading, spacing: 0){
                                // Artcile's section and date of publishing
                                HStack(alignment: .top, spacing: 0) {
                                    Text("Category: ")
                                    Text(article.section ?? "")
                                        .bold()
                                    Spacer()
                                    Text(article.publishedDate ?? "")
                                        .bold()
                                }
                                // Author
                                Text(article.byLine ?? "")
                                    .bold()
                            }
                            .font(.caption2)
                            
                            // Brief summary of the article
                            Text(article.abstract ?? "")
                                .font(.body)
                            
                            // Keys
                            VStack (alignment: .leading) {
                                Text("Key words:")
                                    .bold()
                                Text(article.adxKeywords ?? "")
                            }
                            .font(.caption)
                            
                            // Article's link
                            if article.url != nil {
                                Link(destination: URL(string: article.url!)!) {
                                    ArticleBotton(buttonText: "Read the article")
                                }
                            }
                            
                            // Save button
                            Button {
                                model.deleteSavedAtricle(article: article)
                                
                            } label: {
                                ArticleBotton(buttonText: "Remove from Saved")
                            }

                            
                        }
                        .padding(.horizontal)
                    }
                }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
