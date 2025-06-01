//
//  User.swift
//  CoreModule
//
//  Created by Gaurang Lathiya on 01/06/25.
//

import Foundation

public struct User: Codable, Identifiable, Sendable {
    public var id: Int
    public let name: String
    public let company: String
    public let username: String
    public let email: String
    public let address: String
    public let zip: String
    public let state: String
    public let country: String
    public let phone: String
    public let photo: String

    public init(
        id: Int,
        name: String,
        company: String,
        username: String,
        email: String,
        address: String,
        zip: String,
        state: String,
        country: String,
        phone: String,
        photo: String
    ) {
        self.id = id
        self.name = name
        self.company = company
        self.username = username
        self.email = email
        self.address = address
        self.zip = zip
        self.state = state
        self.country = country
        self.phone = phone
        self.photo = photo
    }

    public static let preview: User = .init(id: 1,
                                            name: "Therese Stiedemann",
                                            company: "Bailey - Turcotte",
                                            username: "Hector30",
                                            email: "Carleton6@hotmail.com",
                                            address: "86481 Olson Flat",
                                            zip: "71329-5878",
                                            state: "Wisconsin",
                                            country: "South Georgia and the South Sandwich Islands",
                                            phone: "(416) 516-0195 x4857",
                                            photo: "https://json-server.dev/ai-profiles/74.png")
}
