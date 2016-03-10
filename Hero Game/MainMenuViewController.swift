//
//  ViewController.swift
//  Hero Game
//
//  Created by Tran Thai Phuoc on 2016-03-02.
//  Copyright © 2016 Tran Thai Phuoc. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let p1 = Player(name: "Player", health: 100, atk: 100, def: 100)
        print(p1.sword)
        print(GameCharacter.monsters[0].name)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

