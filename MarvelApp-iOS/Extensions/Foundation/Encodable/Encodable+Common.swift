//
//  File.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation

extension Encodable {
    
    public func dictionary(decodeDateFormat: String = "MM/dd/yyyy HH:mm:ss") -> [String: Any]? {
        let jsonEncoder = JSONEncoder()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = decodeDateFormat
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0) // UTC
        
        jsonEncoder.dateEncodingStrategy = .formatted(dateFormatter)
        guard let data = try? jsonEncoder.encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: . allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
