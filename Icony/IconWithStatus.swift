//
//  IconWithStatus.swift
//  Icony
//
//  Created by Gianpiero Spinelli on 29/11/21.
//

import Foundation

/// Since we need to keep track of the status of
/// the icon, this is a nice way to do that
struct IconWithStatus: Hashable {
    let icon: AppIcon
    var isSelected: Bool
}
