//
//  HomeMarvelPresenter.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation
import CryptoKit
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

protocol HomeMarvelPresenterDelegate: CharactersUseCaseDelegate {

}

final class HomeMarvelPresenter: CharactersUseCase {

    // MARK: - Properties.
    weak var delegate: HomeMarvelPresenterDelegate?
    private let repositoryFactory: RepositoryFactory
    var charactersRepository: CharactersRepository
    var characters: Characters?
    var request: CharactersRequest = CharactersRequest(apikey: "", hash: "", ts: "")
    
    // MARK: - Init.
    init(repositoryFactory: RepositoryFactory) {
        self.repositoryFactory = repositoryFactory
        charactersRepository = repositoryFactory.repository()!
    }
    
    func fetchCharacters() {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(string: "\(ts)\(Constants.privateKey)\(Constants.publicKey)")
        let md5Hex = hash.map { String(format: "%02hhx", $0) }.joined()
        request = CharactersRequest(apikey: Constants.publicKey, hash: md5Hex, ts: ts)
        runCharactersUseCase(request: request)
    }
    
    func hash(data: String) -> String {
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
    
    func MD5(string: String) -> Data {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: length)
        
        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }

}

extension HomeMarvelPresenter: CharactersUseCaseDelegate {
    func didStartCharactersUseCase() {
        delegate?.didStartCharactersUseCase()
    }
    
    func didEndCharactersUseCase(with error: CustomError?) {
        delegate?.didEndCharactersUseCase(with: error)
    }
    
}
