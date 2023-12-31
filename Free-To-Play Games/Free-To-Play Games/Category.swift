//
//  Category.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import Foundation

import Foundation

enum Category: String,CaseIterable,Codable {
    case shooter
    case mmorpg
    case strategy
    case moba
    case racing
    case sports
    case social
    case sandbox
    case pvp
    case pve
    case survival
    
    func getLogo() -> String {
        switch self {
        case .shooter:
            return "figure.archery"
        case .mmorpg:
            return "figure.arms.open"
        case .strategy:
            return "map"
        case .moba:
            return "figure.stand.line.dotted.figure.stand"
        case .racing:
            return "car.rear.fill"
        case .sports:
            return "figure.basketball"
        case .social:
            return "figure.2"
        case .sandbox:
            return "building"
        case .pvp:
            return "figure.arms.open"
        case .pve:
            return "figure.arms.open"
        case .survival:
            return "figure.climbing"
        }
        
    }
}
