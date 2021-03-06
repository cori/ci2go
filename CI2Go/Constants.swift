//
//  Constants.swift
//  CI2Go
//
//  Created by Atsushi Nagase on 2018/06/17.
//  Copyright © 2018 LittleApps Inc. All rights reserved.
//

import Foundation

// swiftlint:disable:next force_try
let tokenRegularExpression = try! NSRegularExpression(pattern: "([a-f0-9]{40})",
                                                      options: NSRegularExpression.Options(rawValue: 0))

// swiftlint:disable:next force_try
let totpRegularExpression = try! NSRegularExpression(pattern: "^([0-9]{6})$",
                                                     options: NSRegularExpression.Options(rawValue: 0))

func isValidToken(_ token: String) -> Bool {
    return tokenRegularExpression.matches(
        in: token,
        options: .anchored,
        range: NSRange(location: 0, length: token.count)
    ).count == 1 && token.count == 40
}

func isTOTP(_ token: String) -> Bool {
    return totpRegularExpression.firstMatch(
        in: token,
        options: NSRegularExpression.MatchingOptions(rawValue: 0),
        range: NSRange(location: 0, length: token.count)) != nil
}

let shortHashLength = 7

let inAppHost = "ci2go.app"
