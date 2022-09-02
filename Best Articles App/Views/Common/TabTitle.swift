//
//  TabTitle.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 02.09.2022.
//

import SwiftUI

struct TabTitle: View {
    
    @State var title: String
    
    var body: some View {
        
        ZStack (alignment: .leading) {
            
            // Title
            Text(title)
                .bold()
                .multilineTextAlignment(.leading)
                .font(.title)
            .padding(.horizontal, 40)
            
            // NYT API Attribution
            Link(destination: Constants.labelUrl!){
                Image("APILable")
            }
        }
    }
}
