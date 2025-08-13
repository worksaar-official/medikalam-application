//
//  AFNodeDataType.swift
//  Runner
//
//  Created by fancy on 2024/9/18.
//

import Foundation


enum PenMsgType: NSInteger {
    case findDevice = 5
    case connected = 2
    case disConnected = 4
}

struct EncodableAFNode: Encodable {
    let page: Int64
    let x: UInt16
    let y: UInt16
    let type: Int
    let book_no: Int32
    let book_width: Int32
    let book_height: Int32
    let reserved1: Int32

    init(from node: AFNode) {
        self.page = node.page
        self.x = UInt16(node.x)
        self.y = UInt16(node.y)
        self.type = node.type.rawValue
        self.book_no = node.book_no
        self.book_width = node.book_width
        self.book_height = node.book_height
        self.reserved1 = node.reserved1
    }
}

func convertNodesToJSONString(nodes: [AFNode]?) -> [String] {
    guard let nodes = nodes else {
        return []
    }
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted

    var jsonStrings: [String] = []
    for node in nodes {
        let encodableNode = EncodableAFNode(from: node)
        do {
            let jsonData = try encoder.encode(encodableNode)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                jsonStrings.append(jsonString)
            }
        } catch {
            print("Failed to encode node to JSON: \(error)")
        }
    }
    return jsonStrings
}
