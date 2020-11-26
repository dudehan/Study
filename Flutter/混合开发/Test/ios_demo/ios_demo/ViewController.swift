//
//  ViewController.swift
//  ios_demo
//
//  Created by ddhMacMini on 2020/7/28.
//  Copyright © 2020 ddhMacMini. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn: UIButton = UIButton(frame: CGRect(x: 100, y: 100, width: 120, height: 50))
        btn.backgroundColor = UIColor.red
        btn.setTitle("flutter", for: .normal)
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func btnAction() {
        print("======")
        let engine : FlutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        
        let flutterVC : FlutterViewController = FlutterViewController.init(engine: engine, nibName: nil, bundle: nil)
        flutterVC.modalPresentationStyle = .fullScreen
        self.present(flutterVC, animated: true) {
            
        }
    }

}

