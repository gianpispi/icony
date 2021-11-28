//
//  IconViewModel.swift
//  Icony
//
//  Created by Gianpiero Spinelli on 29/11/21.
//

import Foundation

class IconViewModel: ObservableObject {
    lazy var appIcons: [IconWithStatus] = loadIcons()
    
    func refreshIcons() {
        self.appIcons = loadIcons()
    }
    
    private func loadIcons() -> [IconWithStatus] {
        objectWillChange.send()
        return AppIcon.allCases.map { IconWithStatus(icon: $0, isSelected: $0 == AppIcon.selectedIcon) }
    }
}
