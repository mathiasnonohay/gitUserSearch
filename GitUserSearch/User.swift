//
//  User.swift
//  GitUserSearch
//
//  Created by Mathias Nonohay on 10/02/22.
//

import Foundation

struct Root: Codable {
    let user: [User]
}

struct User: Codable {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: String?
    let siteAdmin: Bool?
    let name: String?
    let company: String?
    let blog, location: String?
    let email: String?
    let hireable: Bool?
    let bio: String?
    let twitterUsername: String?
    let publicRepos, publicGists, followers, following: Int?
    let createdAt, updatedAt: Date?

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
        case name, company, blog, location, email, hireable, bio
        case twitterUsername = "twitter_username"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers, following
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct Roots: Codable {
    let contacts: [Contact]
}

// MARK: - Contact
struct Contact: Codable {
    let id, name, email: String
    let address: Address
    let gender: Gender
    let phone: Phone
}

enum Address: String, Codable {
    case xxXxXxxxXStreetXCountry = "xx-xx-xxxx,x - street, x - country"
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

// MARK: - Phone
struct Phone: Codable {
    let mobile: Mobile
    let home, office: Home
}

enum Home: String, Codable {
    case the00000000 = "00 000000"
}

enum Mobile: String, Codable {
    case the910000000000 = "+91 0000000000"
}

struct Cat: Codable {
    let status: Status
    let id, user, text, type: String
    let deleted: Bool
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case status
        case id = "_id"
        case user, text, type, deleted, createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - Status
struct Status: Codable {
    let verified: Bool?
    let sentCount: Int
}

import Foundation

// MARK: - Welcome
struct UserList: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - Item
struct Item: Codable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let siteAdmin: Bool
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

struct TaskEntry: Codable {
    let id: Int
    let tagName: String
    let name: String
}
