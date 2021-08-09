//
//  Notifications+Custom.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation

extension Notification.Name {
    static let tokenExpired = Notification.Name("tokenExpired")
    static let maintenance = Notification.Name("maintenance")
    static let deepLinkDetailNotice = Notification.Name("deepLinkDetailNotice")   //DeepLinkOption
}
