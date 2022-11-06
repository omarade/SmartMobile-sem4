//
//  User.swift
//  Bucketlist
//
//  Created by Omar on 06/11/2022.
//

import Foundation

//Identifiable for showing the list
//Comparable to compare users lastnames
struct User: Identifiable, Comparable {
    let id = UUID()
    let firstname: String
    let lastname: String
    
    //To sort users in list based on last names
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastname < rhs.lastname
    }
}
