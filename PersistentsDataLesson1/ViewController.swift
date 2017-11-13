//
//  ViewController.swift
//  PersistentsDataLesson1
//
//  Created by Ildar Zalyalov on 13.11.2017.
//  Copyright © 2017 Ildar Zalyalov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUser = User(name: "Max", age: 18)
        let currentUser2 = User(name: "Max", age: 18)
        let currentUser3 = User(name: "Max", age: 18)
        
        let archiver = NSKeyedArchiver.archivedData(withRootObject: [currentUser, currentUser2, currentUser3])
        
        UserDefaults.standard.set(archiver, forKey: "User")
        UserDefaults.standard.synchronize()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let currentUserData = UserDefaults.standard.data(forKey: "User") {
            
            guard let currentUsers = NSKeyedUnarchiver.unarchiveObject(with: currentUserData) as? [User] else { return }
            
            for model in currentUsers {
                print("User.name: \(model.name) \nAge: \(model.age)")
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func readData() {
        
        if let dataFile = Bundle.main.path(forResource: "data", ofType: "plist") {
            
            if let dataDict = NSDictionary(contentsOfFile: dataFile) {
                let models = dataDict["New item"] as? [[String : Any]]
                
            }
            
        }
    }

}
