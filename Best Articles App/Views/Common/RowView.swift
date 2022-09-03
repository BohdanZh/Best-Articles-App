//
//  RowView.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 03.09.2022.
//

import SwiftUI

struct RowView: View {
    
    @State var article: Article
    
    var body: some View {
        
        VStack (alignment: .leading) {
            HStack {
                
                // Image
                ZStack (alignment: .center){
                    
                    Rectangle()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.black)
                    
                    
                    if article.media != nil && article.media?.count != 0 {
                        if article.media![0].mediaMetadata != nil && article.media![0].mediaMetadata?.count != 0 {
                            let uiImage = UIImage(data: article.media![0].mediaMetadata![0].imageData ?? Data())
                            Image(uiImage: uiImage ?? UIImage(imageLiteralResourceName: "apiLableLogo"))
                        }
                    } else {
                        Image("apiLableLogo")
                    }
                }
                
                // Title, category and date
                VStack (alignment: .leading) {
                    Text(article.title ?? "")
                        .bold()
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    HStack(alignment: .top) {
                        Text("Category: \(article.section ?? "")")
                        Spacer()
                        Text(article.publishedDate ?? "")
                    }
                    .font(.caption)
                }
            }
            Divider()
        }
    }
}
