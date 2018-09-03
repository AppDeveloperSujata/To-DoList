//
//  Item.swift
//  To-DoList
//
//  Created by Sujata on 02/09/18.
//  Copyright © 2018 Sujata Shyam. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object
{
    @objc dynamic var title : String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
