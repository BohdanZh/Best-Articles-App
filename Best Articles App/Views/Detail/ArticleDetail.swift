//
//  ArticleDetail.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 03.09.2022.
//

import SwiftUI

struct ArticleDetail: View {
    
    var article: Article
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
                            
                            // Article's link
                            if article.url != nil {
                                Link(destination: URL(string: article.url!)!) {
                                    ZStack (alignment: .center){
                                        Rectangle()
                                            .frame(width: 150, height: 25)
                                            .foregroundColor(.black)
                                            .cornerRadius(5)
                                        Text("Read the article")
                                            .bold()
                                            .tint(.white)
                                    }
                                }
                            }
                            
                            // Save button
                            Button {
                                selectedTab = Constants.savedTab
                                //TODO: save article to CoreData
                            } label: {
                                ZStack (alignment: .center){
                                    Rectangle()
                                        .frame(width: 150, height: 25)
                                        .foregroundColor(.black)
                                        .cornerRadius(5)
                                    Text("Read leater")
                                        .bold()
                                        .tint(.white)
                                }
                            }

                            
                        }
                        .padding(.horizontal)
                    }
                }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
