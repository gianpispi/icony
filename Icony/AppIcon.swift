//
//  AppIcon.swift
//  Icony
//
//  Created by Gianpiero Spinelli on 29/11/21.
//

import SwiftUI

enum AppIcon: String, CaseIterable, Hashable {
    case `default` = "AppIcon"
    case nightyNight = "nighty-night"
    case chaos = "chaos"
    case moon = "moon"
    
    var thumbnail: String {
        return "thumb-" + self.rawValue
    }
    
    var name: String {
        switch self {
        case .default:
            return "Sunnish"
        case .nightyNight:
            return "Nighty night"
        case .chaos:
            return "Chaos"
        case .moon:
            return "Moon landing"
        }
    }
    
    var iconName: String? {
        if self == .default {
            return nil
        }
        return rawValue
    }
    
    static var selectedIcon: AppIcon {
        guard let name = UIApplication.shared.alternateIconName else { return .default }
        
        guard let appIcon = AppIcon(rawValue: name) else {
            fatalError("Provided unknown app icon value")
        }
        
        return appIcon
    }
}
