//
//  Repository.swift
//  VKProfile
//
//  Created by Тимур Шафигуллин on 26.10.17.
//  Copyright © 2017 iOS Lab ITIS. All rights reserved.
//

import Foundation

protocol Repository {
    var currentID: Int { set get }
    
    func syncSave(with: News)
    func asyncSave(with: News, completionBlock: @escaping (Bool) -> ())
    func syncGetAll() -> [News]
    func asyncGetAll(completionBlock: @escaping ([News]) -> ())
    func syncSearch(id: Int) -> News?
    func asyncSearch(id: Int, completionBlock: @escaping (News?) -> ())
    
}
