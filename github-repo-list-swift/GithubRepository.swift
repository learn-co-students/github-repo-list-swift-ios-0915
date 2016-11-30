//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    
    let fullName: String
    let htmlURL: URL
    let repositoryID: String

    init(dictionary: Dictionary <String, Any>) {
        self.fullName = dictionary["full_name"] as! String
        let htmlString = dictionary["html_url"] as! String
        self.htmlURL = URL(string: htmlString)!
        let idInt = dictionary["id"] as! Int
        self.repositoryID = String(idInt)
    }
/*
    init(fullname: String, htmlURLstring: String, repositoryID: String) {
        self.fullname = fullname
        self.htmlURL = URL(string: htmlURLstring)!
        self.repositoryID = repositoryID
    }
 */
}

/*
 - `fullName` should be a stored property of type `String`. It will represent the full name of the repository object (which will be retrieved from the dictionary we get back from the API request).
 - `htmlURL` should be a stored property of type `URL`. The dictionary we retrieve from the API request has a `String` value for the key `html_url`. This value returned back by this key is of type `String` (hint: It might need to be casted as a `String`). After doing so, you can then pass that `String` value to the initializer of `URL` to create an instance of `URL` that can be assigned as a value to the `htmlURL` stored property.
 - `repositoryID` should be a stored property of type `String`. This will represent the ID of the repository (again, this is retrieved from the dictionary).
 */
