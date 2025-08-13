//
//  Util.swift
//  Runner
//
//  Created by fancy on 2024/9/18.
//

import Foundation

func hexString(from data: Data) -> String {
    return data.map { String(format: "%02hhx", $0) }.joined()
}
