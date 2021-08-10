//
//  CharacterDetailPresenter.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

protocol CharacterDetailPresenterDelegate: CharactersDetailsUseCaseDelegate {

}

final class CharacterDetailPresenter: CharactersDetailsUseCase {

    // MARK: - Properties.
    weak var delegate: CharacterDetailPresenterDelegate?
    private let repositoryFactory: RepositoryFactory
    var characterId: Int
    var charactersRepository: CharactersRepository
    var characters: CharactersDetails?
    var request: CharactersDetailsRequest = CharactersDetailsRequest(apikey: "", hash: "", ts: "", id: 0)
    
    // MARK: - Init.
    init(repositoryFactory: RepositoryFactory, characterId: Int) {
        self.repositoryFactory = repositoryFactory
        self.charactersRepository = repositoryFactory.repository()!
        self.characterId = characterId
    }
    
    func fetchCharactersDetails() {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(string: "\(ts)\(Constants.privateKey)\(Constants.publicKey)")
        let md5Hex = hash.map { String(format: "%02hhx", $0) }.joined()
        request = CharactersDetailsRequest(apikey: Constants.publicKey, hash: md5Hex, ts: ts, id: characterId)
        runCharactersDetailsUseCase(request: request)
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

extension CharacterDetailPresenter: CharactersDetailsUseCaseDelegate {
    func didStartCharactersDetailsUseCase() {
        delegate?.didStartCharactersDetailsUseCase()
    }
    
    func didEndCharactersDetailsUseCase(with error: CustomError?) {
        delegate?.didEndCharactersDetailsUseCase(with: error)
    }
}
