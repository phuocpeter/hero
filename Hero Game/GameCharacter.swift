//
//  Player.swift
//  Hero Game
//
//  Created by Tran Thai Phuoc on 2016-03-09.
//  Copyright © 2016 Tran Thai Phuoc. All rights reserved.
//

import Foundation

class GameCharacter: NSObject {
    var name: String
    var health: Int
    var atk: Double
    var def: Double

    init(name: String, health: Int, atk: Double, def: Double) {
        self.name = name
        self.health = health
        self.atk = atk
        self.def = def
        super.init()
    }

    static let monsters: [GameCharacter] = [
        GameCharacter(name: "Tutorial", health: 10, atk: 1, def: 0),
        GameCharacter(name: "Slime", health: 15, atk: 1, def: 1)
    ]
}
