//
//  ContentView.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 02.09.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var model: ContentModel
    
    @State var selectedTab = Constants.savedTab

    var body: some View {
        if model.emailedArticles.count != 0 {
            TabView (selection: $selectedTab) {
                
                // Most emailed
                ArticlesListView(selectedTab: $selectedTab, articles: $model.emailedArticles)
                    .tabItem {
                        VStack{
                            Image(systemName: "tray.fill")
                            Text("Most emiled")
                        }
                    }
                    .tag(Constants.emaildTab)
                
                // Most shared
                ArticlesListView(selectedTab: $selectedTab, articles: $model.sharedArticles)
                    .tabItem {
                        VStack{
                            Image(systemName: "square.and.arrow.up.on.square.fill")
                            Text("Most shared")
                        }
                    }
                    .tag(Constants.sharedTab)
                
                // Most viewed
                ArticlesListView(selectedTab: $selectedTab, articles: $model.viewedArticles)
                    .tabItem {
                        VStack{
                            Image(systemName: "eye")
                            Text("Most viewed")
                        }
                    }
                    .tag(Constants.viewedTab)
                
                // Saved articles
                SavedView(selectedTab: $selectedTab)
                    .tabItem {
                        VStack{
                            Image(systemName: "bookmark.circle.fill")
                            Text("Saved")
                        }
                    }
                    .tag(Constants.savedTab)
            }
            .accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
        }
        else {
            ProgressView()
        }
    }
}
