//
//  File.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation

extension Bundle {
    
    public enum BundlePlistError: Swift.Error {
        case missingKey, invalidValue
    }

    public static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Self.main.object(forInfoDictionaryKey:key) else {
            throw BundlePlistError.missingKey
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw BundlePlistError.invalidValue
        }
    }

    public static func valueIfPresent<T>(for key: String, default: T? = nil) -> T? where T: LosslessStringConvertible {
        guard let object = Self.main.object(forInfoDictionaryKey:key) else {
            return nil
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            return nil
        }
    }
}
