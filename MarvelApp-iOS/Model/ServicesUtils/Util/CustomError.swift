//
//  Model
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation

enum CustomError: Error {

    case defaultError
    case defaultDetailedError(message: String)
    case networkError(error: Error)
    case standardHttpError(statusCode: Int, errorResponse: ErrorResponse?)
    case authenticationError
    case maintentanceError
    case parseError(error: Error?)
    case applicationError(error: Error)
}

extension CustomError: LocalizedError {
        
    public var localizedDescription: String {
        switch self {
        case .defaultError:
            return "defaultError"
        case .defaultDetailedError(let message):
            return message
        case .networkError(let error):
            return error.localizedDescription
        case .standardHttpError(let statusCode, let errorResponse):
            if let errorMessage = errorResponse?.errorDescription {
                return errorMessage
            }
            if statusCode == 400 {
                return "ALERT_UNEXPECTED_ERROR".localized()
            }
            return "HTTP Error: \(statusCode)"
        case .authenticationError:
            return "ALERT_SESSION_EXPIRED".localized()
        case .maintentanceError:
            return "ALERT_MAINTENANCE".localized()
        case .parseError(let error):
            return error?.localizedDescription ?? ""
        case .applicationError(let error):
            return error.localizedDescription
        }
    }
}
