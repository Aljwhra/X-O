//
//  ViewController.swift
//  X-O
//
//  Created by Aljwhra Alnasser on 14/12/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//
//    @IBAction func btnStart(_ sender: Any) {
//        
//        let vcSecondUI = self.storyboard?.instantiateViewController(identifier: "secondUIID")
//        navigationController?.pushViewController(vcSecondUI!, animated: true)
//    }
  
    @IBAction func btnStart(_ sender: Any) {
        
        let vcSecondUI = self.storyboard?.instantiateViewController(identifier: "secondUIID")
        navigationController?.pushViewController(vcSecondUI!, animated: true)
    }
    
    
}

