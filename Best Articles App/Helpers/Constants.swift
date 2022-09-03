//
//  Constants.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 02.09.2022.
//

import Foundation

struct Constants {
    
    // Data managment
    static var apiUrl = "https://api.nytimes.com/svc/mostpopular/v2/"
    static var period = allowedPeriod.month
    static var emaildKey = "emailed"
    static var sharedKey = "shared"
    static var viewedKey = "viewed"
    
    // Such credentials shouldn't be within the app but I put it here for simplicity
    static var apiKey = "6nGQ6qAeglQOLXXqvf5GG8ftUGypryH3"
    
    // There is only three possible options of requasting articles for a specific period
    enum allowedPeriod {
        static var day = "1"
        static var week = "7"
        static var month = "30"
    }
    
   // Tab managment
    static var emaildTab = 0
    static var sharedTab = 1
    static var viewedTab = 2
    static var savedTab = 3
    
    // API branding
    static var labelUrl = URL(string: "https://developer.nytimes.com")
    
}
