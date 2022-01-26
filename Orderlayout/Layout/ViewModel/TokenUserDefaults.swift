//
//  TokenUserDefaults.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 25/01/2022.
//

import Foundation

extension UserDefaults {
    
    func setToken(token: String) {
        set(token, forKey: UserDefaultsKeys.token.rawValue)
    }
    
    func getToken() -> String {
        return string(forKey: UserDefaultsKeys.token.rawValue) ?? ""
    }
    
    func removeToken() {
        removeObject(forKey: UserDefaultsKeys.token.rawValue)
    }
}

enum UserDefaultsKeys : String {
    case token
}
