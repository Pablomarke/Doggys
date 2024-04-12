//
//  KeyChainDataProvider.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 10/4/24.
//

import Foundation
import KeychainSwift

final class KeyChainDataProvider {
    let keychain = KeychainSwift()

    func setStringKey(value: String, key: String ) {
        keychain.set(value, forKey: key)
    }

    func getStringKey(key: String) -> String? {
        keychain.get(key)
    }

    func deleteStringKey(key: String) {
        keychain.delete(key)
    }

    func allKeysDelete() {
        keychain.clear()
    }

    func setLoginAndPassword(user: String, password: String) {
        setStringKey(value: user,
                     key: KeyChainEnum.user)
        setStringKey(value: password,
                     key: KeyChainEnum.password)
    }
}
