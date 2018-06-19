//
//  ArrayExtension.swift
//  CI2Go
//
//  Created by Atsushi Nagase on 2018/06/17.
//  Copyright © 2018 LittleApps Inc. All rights reserved.
//

import UIKit

extension Array where Element == Build {
    func merged(with elements: [Element]) -> Array<Element> {
        return elements.reduce(into: self, { (result, element) in
            if let i = result.index(where: { element.apiPath == $0.apiPath }) {
                result[i] = element
                return
            }
            result.append(element)
        })
    }
}
