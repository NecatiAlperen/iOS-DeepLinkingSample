//
//  DeepLinkHandler.swift
//  ios-DeepLinkingSample
//
//  Created by Necati Alperen IŞIK on 1.08.2024.
//

import UIKit

public enum DeepLink: String {
    case movies
    case settings
}

final class DeeplinkHandler {
    static func handleDeeplink(_ deeplink: DeepLink, in window: UIWindow?) {
        guard let tabBarController = window?.rootViewController as? UITabBarController else { return }
        
        switch deeplink {
        case .movies:
            tabBarController.selectedIndex = 0
        case .settings:
            tabBarController.selectedIndex = 1
        }
    }
    
    static func handleURL(_ url: URL, in window: UIWindow?) -> Bool {
        guard let deeplink = DeepLink(rawValue: url.host ?? "") else {
            return false
        }
        handleDeeplink(deeplink, in: window)
        return true
    }
}
