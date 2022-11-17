//
//  Superhero.swift
//  Superheroes
//
//  Created by leogoba on 17.11.2022.
//

import Foundation

// MARK: - Superhero
struct Superhero: Decodable {
    let id: Int
    let name: String
    let slug: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let connections: Connections
    let images: Images
}

// MARK: - Appearance
struct Appearance: Decodable {
    let gender: Gender
    let race: String?
    let height: [String]
    let weight: [String]
    let eyeColor, hairColor: String
}

// MARK: - Gender
enum Gender: String, Decodable {
    case empty = "-"
    case female = "Female"
    case male = "Male"
}

// MARK: - Biography
struct Biography: Decodable {
    let fullName: String
    let alterEgos: String
    let aliases: [String]
    let placeOfBirth: String
    let firstAppearance: String
    let publisher: String?
    let alignment: Alignment
}

// MARK: - Alignment
enum Alignment: String, Decodable {
    case bad = "bad"
    case empty = "-"
    case good = "good"
    case neutral = "neutral"
}

// MARK: - Connections
struct Connections: Decodable {
    let groupAffiliation: String
    let relatives: String
}

// MARK: - Images
struct Images: Decodable {
    let xs, sm, md, lg: String
}

// MARK: - Powerstats
struct Powerstats: Decodable {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
}

// MARK: - Work
struct Work: Decodable {
    let occupation: String
    let base: String
}
