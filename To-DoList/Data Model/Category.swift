//
//  Category.swift
//  To-DoList
//
//  Created by Sujata on 02/09/18.
//  Copyright © 2018 Sujata Shyam. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object
{
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
