//
//  SavedView.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 02.09.2022.
//

import SwiftUI

struct SavedView: View {
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                
                TabTitle(title: "Here is your saved articles")

                ScrollView{
                    LazyVStack (spacing: 10) {
//                        ForEach(model.emailedArticles) { a in
//                            NavigationLink {
//
//                            } label: {
//                                RowView(article: a)
//                            }
//                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarHidden(true)
            .padding(.bottom)
        }
    }
}
