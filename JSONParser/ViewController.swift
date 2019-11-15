//
//  ViewController.swift
//  JSONParser
//
//  Created by Marc Jacques on 11/15/19.
//  Copyright © 2019 Marc Jacques. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let path = Bundle.main.path(forResource: "usersAPI", ofType: "txt") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            print(json)
            guard let array = json as? [Any] else { return }
            
            for user in array {
                guard let userDict = user as? [String: Any] else { return }
                guard let userID = userDict["id"] as? Int else { print("not as Int"); return }
                guard let name = userDict["name"] as? String else { return }
                guard let company = userDict["company"] as? [String: String] else { return }
                guard let companyName = company["name"] else { return }
                
                print(userID)
                print(name)
                print(companyName)
                print(" ")
            }
    } catch {
    print(error)
    }
    
}


}

