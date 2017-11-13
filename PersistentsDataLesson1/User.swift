//
//  User.swift
//  PersistentsDataLesson1
//
//  Created by Ildar Zalyalov on 13.11.2017.
//  Copyright © 2017 Ildar Zalyalov. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding {
    
    @objc var name: String
    @objc var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(name, forKey: #keyPath(User.name))
        aCoder.encode(age, forKey: #keyPath(User.age))
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        name = aDecoder.decodeObject(forKey: #keyPath(User.name)) as? String ?? ""
        age = aDecoder.decodeInteger(forKey: #keyPath(User.age))
    }
}
