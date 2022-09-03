//
//  ArticleBotton.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 03.09.2022.
//

import SwiftUI

struct ArticleBotton: View {
    
    @State var buttonText: String
    
    var body: some View {
        
        ZStack (alignment: .center){
            Rectangle()
                .frame(width: 175, height: 25)
                .foregroundColor(.black)
                .cornerRadius(5)
            Text(buttonText)
                .bold()
                .tint(.white)
        }
    }
}

