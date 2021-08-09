//
//  OSLog.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//


import Foundation
import os.log

extension OSLog {
    static let network = OSLog(subsystem: Bundle.main.bundleIdentifier ?? "ProtocolModelTemplate", category: "network")
    static let logic = OSLog(subsystem: Bundle.main.bundleIdentifier ?? "ProtocolModelTemplate", category: "logic")
    static let interface = OSLog(subsystem: Bundle.main.bundleIdentifier ?? "ProtocolModelTemplate", category: "interface")
}
