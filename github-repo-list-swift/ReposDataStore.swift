//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    var repositories : [GithubRepository] = []
    
    /*
    func getRepositoriesFromAPI(with completion: @escaping (Bool) -> Void) {
        
        do {
            try GithubAPIClient.getRepositories { (responseArray) in
                print("\nresponse Dictionary in Data Store: \(responseArray)")

                for dict in responseArray {
                    let name = dict["full_name"] as! String
                    let htmlString = dict["html_url"] as! String
                    let idInt = dict["id"] as! Int
                    let id = String(idInt)
                    //let id = dict["id"]!.stringValue!
                
                    let newRepo = GithubRepository.init(fullname: name, htmlURLstring: htmlString, repositoryID: id)
                    self.repos.append(newRepo)
                }
            completion(true)
            }
        }
        catch {
            print("\nAPI call failed so getRepos in dataStore failed.\n")
        }
    }
    */
    
    func getRepositoriesFromAPI(_ completion: @escaping () -> ()) {
        
        GithubAPIClient.getRepositories { (responseArray) in
            print("\nresponse Dictionary in Data Store: \(responseArray)")
            self.repositories.removeAll()
                
            for dict in responseArray {
                //let name = dict["full_name"] as! String
                //let htmlString = dict["html_url"] as! String
                //let idInt = dict["id"] as! Int
                //let id = String(idInt)
                //let id = dict["id"]!.stringValue!
                    
                //let newRepo = GithubRepository.init(fullname: name, htmlURLstring: htmlString, repositoryID: id)
                let newRepo = GithubRepository.init(dictionary: dict)
                self.repositories.append(newRepo)
            }
            completion()
        }
    }

    
    
    
}
