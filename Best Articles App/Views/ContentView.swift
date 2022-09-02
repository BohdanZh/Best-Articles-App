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
    
    @State var selectedTab = Constants.emaildKey

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        TabView (selection: $selectedTab) {
            EmailedView()
                .tabItem {
                    VStack{
                        Image(systemName: "tray.fill")
                        Text("Most emiled")
                    }
                }
                .tag(Constants.emaildTab)
            SharedView()
                .tabItem {
                    VStack{
                        Image(systemName: "square.and.arrow.up.on.square.fill")
                        Text("Most shared")
                    }
                }
                .tag(Constants.sharedTab)
            ViewedView()
                .tabItem {
                    VStack{
                        Image(systemName: "eye")
                        Text("Most viewed")
                    }
                }
                .tag(Constants.viewedTab)
            SavedView()
                .tabItem {
                    VStack{
                        Image(systemName: "bookmark.circle.fill")
                        Text("Saved")
                    }
                }
                .tag(Constants.viewedTab)
        }
        .accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
    }
}
