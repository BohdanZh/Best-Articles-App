//
//  ArticleSaved+CoreDataProperties.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 03.09.2022.
//
//

import Foundation
import CoreData


extension ArticleSaved {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleSaved> {
        return NSFetchRequest<ArticleSaved>(entityName: "ArticleSaved")
    }

    @NSManaged public var abstract: String?
    @NSManaged public var adxKeywords: String?
    @NSManaged public var byLine: String?
    @NSManaged public var id: UUID?
    @NSManaged public var imageData: Data?
    @NSManaged public var nytdSection: String?
    @NSManaged public var publishedDate: String?
    @NSManaged public var section: String?
    @NSManaged public var source: String?
    @NSManaged public var title: String?
    @NSManaged public var type: String?
    @NSManaged public var updatedDate: String?
    @NSManaged public var uri: String?
    @NSManaged public var url: String?

}

extension ArticleSaved : Identifiable {

}
