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
    
    static let baseAPIURL = "https://" + Configuration.valueIfPresent(for: "API_URL")!
    
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
