//
//  ViewedView.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 02.09.2022.
//

import SwiftUI

struct ViewedView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                
                TabTitle(title: "The most viewed articles")

                ScrollView{
                    LazyVStack (spacing: 10) {
                        ForEach(model.viewedArticles) { a in
                            NavigationLink {
                                
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

