//
//  KeychainManager.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import KeychainAccess

protocol KeychainManager {
    func getItem(for key: String) throws -> String
    func setItem(_ item: String, for key: String) throws
}

final class KeychainManagerImplementation: KeychainManager {
    struct Constants {
        static let keychainServiceKey = "com.kiattisak.fetchfunny"
    }

    enum KeychainManagerError: Error {
        case itemNotFound(message: String)
        case setItemFailed(message: String)
    }

    let keychain: Keychain

    init(with keychain: Keychain = Keychain(service: Constants.keychainServiceKey)) {
        self.keychain = keychain
    }

    func getItem(for key: String) throws -> String {
        guard let obtainedItem = keychain[string: key] else {
            throw KeychainManagerError.itemNotFound(
                message: "Item for this `Key: \(key)` is not found in Keychain"
            )
        }

        return obtainedItem
    }

    func setItem(_ item: String, for key: String) throws {
        do {
            try keychain.set(item, key: key)
        } catch {
            throw KeychainManagerError.setItemFailed(
                message: "Coudln't set item to this `Key: \(key)`"
            )
        }
    }
}
