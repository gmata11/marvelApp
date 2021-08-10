//
//  Model
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation

class FieldError {
    
    var name: String?
    var messages: [String]?
    
    init(name: String?,
        messages: [String]?) {
        self.name = name
        self.messages = messages
    }
}

class ErrorResponse: Codable {
    var error: String?
    var errorDescription: String?
    
    init(dictionary: [String: Any]) {
        if dictionary.keys.contains("error_description"),
           let errorDescription = dictionary["error_description"] as? String,
           dictionary.keys.contains("error"),
           let error = dictionary["error"] as? String {
            self.error = error
            self.errorDescription = errorDescription
        } else {
            
            let sortedKeys = dictionary.keys.sorted {
                if ($0 == "code") {
                    return false
                } else if ($1 == "code") {
                    return true
                }
                return false
            }
            
            if let firstKey = sortedKeys.first,
                let firstErrorDicitonary = dictionary[firstKey] as? [String: Any],
                let firstErrorKey = firstErrorDicitonary.keys.first,
                let firstErrorList = firstErrorDicitonary[firstErrorKey] as? [String] {
                self.error = firstErrorKey
                self.errorDescription = firstErrorList.joined(separator: "\n")
            } else if let firstErrorKey = sortedKeys.first,
                let firstErrorList = dictionary[firstErrorKey] as? [String] {
                self.error = firstErrorKey
                self.errorDescription = firstErrorList.joined(separator: "\n")
            } else {
                self.error = dictionary["code"] as? String
                self.errorDescription = dictionary["detail"] as? String
            }
        }
    }
}
