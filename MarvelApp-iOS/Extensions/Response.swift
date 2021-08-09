//
//  Extensions
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//


import Moya

extension Response {

    public func isValid() -> Bool {
        let validStatusCodes: [Int] = [200, 201, 202, 203, 204, 205, 206, 207, 208]
        let isValid = validStatusCodes.contains(statusCode)
        return isValid
    }

    public func isAuthError() -> Bool {
        return statusCode == 401
    }

    public func isMaintenanceError() -> Bool {
        return statusCode == 503
    }

}
