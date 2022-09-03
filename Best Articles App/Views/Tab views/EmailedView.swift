//
//  EmailedView.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 02.09.2022.
//

import SwiftUI

struct ArticlesListView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @Binding var selectedTab:Int
    
    @Binding var articles:[Article]
    
    var titleText:String {
        switch selectedTab {
        case Constants.emaildTab:
             return "The most emailed articles"
        case  Constants.sharedTab:
            return "The most shared articles"
        case Constants.viewedTab:
            return "The most viwed articles"
        default:
            return ""
        }
    }

    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                
                TabTitle(title: titleText)

                ScrollView{
                    LazyVStack (spacing: 10) {
                        ForEach(articles) { a in
                            NavigationLink {
                                ArticleDetail(article: a, selectedTab: $selectedTab)
                            } label: {
                                RowView(article: a)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarHidden(true)
            .padding(.bottom)
        }
    }
}

