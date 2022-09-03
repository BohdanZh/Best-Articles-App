//
//  SavedView.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 02.09.2022.
//

import SwiftUI

struct SavedView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "title", ascending: true)]) private var articles: FetchedResults<ArticleSaved>
    
    @Binding var selectedTab:Int
    
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                
                TabTitle(title: "Here is your saved articles")

                ScrollView{
                    LazyVStack (spacing: 10) {
                        ForEach(articles) { a in
                            NavigationLink {
                                SavedArticleDetails(article: a, selectedTab: $selectedTab)
                            } label: {
                                VStack (alignment: .leading) {
                                    HStack {
                                        
                                        // Image
                                        ZStack (alignment: .center){
                                            
                                            Rectangle()
                                                .frame(width: 80, height: 80)
                                                .foregroundColor(.black)
                                            
                                            
                                            if a.imageData != nil {
                                                let uiImage = UIImage(data: a.imageData!)
                                                Image(uiImage: uiImage ?? UIImage(imageLiteralResourceName: "apiLableLogo"))
                                            } else {
                                                Image("apiLableLogo")
                                            }
                                        }
                                        
                                        // Title, category and date
                                        VStack (alignment: .leading) {
                                            Text(a.title ?? "")
                                                .bold()
                                                .font(.title3)
                                                .multilineTextAlignment(.leading)
                                            Spacer()
                                            HStack(alignment: .top) {
                                                Text("Category: \(a.section ?? "")")
                                                Spacer()
                                                Text(a.publishedDate ?? "")
                                            }
                                            .font(.caption)
                                        }
                                    }
                                    Divider()
                                }
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
