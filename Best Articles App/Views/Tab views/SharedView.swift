//
//  SharedView.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 02.09.2022.
//

import SwiftUI

struct SharedView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @Binding var selectedTab:Int
    
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                
                TabTitle(title: "The most shared articles")

                ScrollView{
                    LazyVStack (spacing: 10) {
                        ForEach(model.sharedArticles) { a in
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

