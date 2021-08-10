//
//  Constants.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//


import Foundation

struct Constants {
    
    // MARK: Date formats
    static let decodeApiDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
    static let alternativeDecodeApiDateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    static let humanDateFormat = "dd/MM/yyyy"
    
    // MARK: Urls
    static let privacyUrl = ""
    static let termsUrl = ""
    
    // MARK: Keys
    static let publicKey = "425efc29213fe4aae7a5e9fad2050585"
    static let privateKey = "398a17fe03778e948c7effd8950d7e9e37d02b42"
    
    static let apiURL: String = Configuration.valueIfPresent(for: "API_URL")!
    static let baseAPIURL = "https://" + apiURL
    
    // MARK: Notifications
    static let tokenExpiredNotificationName = NSNotification.Name("tokenExpired")
    static let maintenanceNotificationName = NSNotification.Name("maintenance")

    // MARK: Languages
    static let availableLanguages = ["en", "es"]
    static let defaultLanguage = "es"

    // MARK: API
    static let defaultStartPage: Int = 1
    static let defaultPageSize: Int = 10
    static let defaultOrdering: String = "-created"
    static let scoreOrdering: String = "-annotated_score"

}
