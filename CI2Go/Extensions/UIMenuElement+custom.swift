//
//  UIMenuElement+custom.swift
//  CI2Go
//
//  Created by Atsushi Nagase on 2020/05/12.
//  Copyright © 2020 LittleApps Inc. All rights reserved.
//

import UIKit

extension UIMenuElement {
    static var navigate: UIMenu {
        return UIMenu(
            title: "Navigate",
            image: nil,
            identifier: .navigate,
            options: .destructive,
            children: [.back, .reload])
    }
    static var preferences: UIMenu {
        return UIMenu(
            title: "Settings",
            image: nil,
            identifier: .preferences,
            options: .displayInline,
            children: [.preferencesCommand])
    }
    static var preferencesCommand: UIKeyCommand {
        let command = UIKeyCommand(
            input: ",",
            modifierFlags: [.command],
            action: #selector(AppDelegate.preferencesAction(_:)))
        command.title = "Settings"
        command.discoverabilityTitle = "Settings"
        return command
    }
    static var back: UIKeyCommand {
        let command = UIKeyCommand(
            input: "[",
            modifierFlags: [.command],
            action: #selector(AppDelegate.backAction(_:)))
        command.title = "Back"
        command.discoverabilityTitle = "Back"
        return command
    }
    static var reload: UIKeyCommand {
        let command = UIKeyCommand(
            input: "R",
            modifierFlags: [.command],
            action: #selector(AppDelegate.reloadAction(_:)))
        command.title = "Reload"
        command.discoverabilityTitle = "Back"
        return command
    }
}
