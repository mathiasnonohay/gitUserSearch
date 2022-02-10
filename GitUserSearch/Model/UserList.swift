//
//  UserList.swift
//  GitUserSearch
//
//  Created by Mathias Nonohay on 10/02/22.
//

import Foundation

// MARK: - UserList
struct UserList: Codable {
    let items: [Item]?

    enum CodingKeys: String, CodingKey {
        case items
    }
}

// MARK: - Item
struct Item: Codable {
    let login: String
    let id: Int
    let nodeID: String?
    let avatarURL: URL?
    let gravatarID: String?
    let url: String
    let htmlURL: String?
    let followersURL: String?
    let followingURL: String?
    let gistsURL: String?
    let starredURL: String?
    let subscriptionsURL: String?
    let organizationsURL: String?
    let reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: String
    let siteAdmin: Bool?
    let score: Int

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
        case score
    }
}
