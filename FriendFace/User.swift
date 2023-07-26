//
//  User.swift
//  FriendFace
//
//  Created by Javier Alaves on 26/7/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    static let example = User(id: UUID(),
                              isActive: true,
                              name: "Javier Alaves",
                              age: 26,
                              company: "Build Forward",
                              email: "javieralaves@me.com",
                              address: "Swift Avenue 999, Swift Town",
                              about: "Javier is a designer and developer building his own ideas. Recently, Javier has built an expense tracker, a habit tracker, a volleyball match score keeper, a cupcake delivery app, and more.",
                              registered: Date.now,
                              tags: ["swift", "calisthenics", "popcorn"],
                              friends: [])
}
