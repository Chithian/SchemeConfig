//
//  ViewController.swift
//  Scheme Config
//
//  Created by Samony Chithian on 8/9/22.
//

import UIKit

class ViewController: UIViewController {

    //Create label
    lazy var lable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Greeting User"
        lable.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
  
        return lable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //add sub view
        view.addSubview(lable)
        view.backgroundColor = .systemGray5
        
        //add constraint
        NSLayoutConstraint.activate([
            lable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lable.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        //Check Conditional Scheme
        #if DEV
            print("I am in Dev Mode")
            lable.text = "Hello Developer"
            lable.textColor = UIColor(named: "DevAccentColor")
            
        #elseif QA
            print("I am in QA mode")
            lable.text = "Hello QA Testing"
            lable.textColor = UIColor(named: "DevAccentColor")
   
        #elseif DEBUG
            print("I am in Debug Mode")
            lable.text = "Hello Debuger"

        
        #elseif PROD
            print("I am in PROD Mode")
            lable.text = "Hello Users"

        #endif
        
        //Info.plist
        var nsDictionary: NSDictionary?
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            nsDictionary = NSDictionary(contentsOfFile: path)
            
            print(nsDictionary!["APPLICATION_NAME"] as? String ?? "default App Name")
            print(nsDictionary!["BASE_URL"] as? String ?? "default URL")
        }
    }
}
