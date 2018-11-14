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
        case itemNotFound
        case setItemFailed(errorMessage: String)
    }

    let keychain: Keychain

    init(with keychain: Keychain = Keychain(service: Constants.keychainServiceKey)) {
        self.keychain = keychain
    }

    func getItem(for key: String) throws -> String {
        guard let obtainedItem = keychain[string: key] else {
            throw KeychainManagerError.itemNotFound
        }

        return obtainedItem
    }

    func setItem(_ item: String, for key: String) throws {
        do {
            try keychain.set(item, key: key)
        } catch let error {
            print("Couldn't set \(item) for \(key)")
            throw KeychainManagerError.setItemFailed(
                errorMessage: error.localizedDescription
            )
        }
    }
}
