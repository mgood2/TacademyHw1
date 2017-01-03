//
//  ViewController.swift
//  TacademyHw1
//
//  Created by Eunmin Lee on 03/01/2017.
//  Copyright © 2017 Eunmin Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageNames : [String]! = ["image0.jpg", "image1.jpg", "image2.jpg", "image3.jpg", "image4.jpg"]
    var seq : Int! = 0
    var image : UIImage!
    var imageView : UIImageView!
    var leftButton : UIButton!
    var rightButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image = UIImage(named: imageNames[seq])
        imageView = UIImageView(image: image)
        self.view.addSubview(imageView)
        
        
        
        leftButton = UIButton()
        leftButton.setImage(UIImage(named: "left_1"), for: .normal)
        leftButton.setImage(UIImage(named: "left_2"), for: .disabled)
        self.view.addSubview(leftButton)
        
        rightButton = UIButton()
        rightButton.setImage(UIImage(named: "right_1"), for: .normal)
        rightButton.setImage(UIImage(named: "right_2"), for: .disabled)
        self.view.addSubview(rightButton)
        
        
        
        
        
        initialButtonStates(leftButton,rightButton)
        
        
        leftButton.addTarget(self, action: #selector(previousImage(_:)), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(nextImage(_:)), for: .touchUpInside)
        
        
        
        
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        
        let constraintsViews : [String:Any] = [ "leftButton":leftButton, "rightButton":rightButton]
        
        let constraints1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[leftButton]->=100-[rightButton]-20-|", options: [], metrics: nil, views: constraintsViews)
        let constraints2 = NSLayoutConstraint.constraints(withVisualFormat: "V:[leftButton]-20-|", options: [], metrics: nil, views: constraintsViews)
        let constraints3 = NSLayoutConstraint.constraints(withVisualFormat: "V:[rightButton]-20-|", options: [], metrics: nil, views: constraintsViews)
        let constraints4 = NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageView]|", options: [], metrics: nil, views: ["imageView":imageView])
        let constraints5 = NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy:.equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        let constraints6 = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: imageView, attribute: .height, multiplier: 16.0/9.0, constant: 0)
        
        self.view.addConstraints(constraints1)
        self.view.addConstraints(constraints2)
        self.view.addConstraints(constraints3)
        self.view.addConstraints(constraints4)
        self.view.addConstraints([constraints5,constraints6])
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func initialButtonStates(_ leftButton: UIButton, _ rightButton: UIButton){
        if seq == 0 {
            leftButton.isEnabled = false
        }
        if seq == imageNames.count-1 {
            rightButton.isEnabled = false
        }
        
    }
    
   
    func previousImage(_ sender : Any){
        if seq > 0 {
            rightButton.isEnabled = true
            leftButton.isEnabled = true
            seq = seq - 1
            self.imageView.image = UIImage(named: imageNames[seq])
        } else {
            leftButton.isEnabled = false
        }
    }
    
    func nextImage(_ sender : Any){
        if seq < imageNames.count-2{
            leftButton.isEnabled = true
            seq = seq + 1
            self.imageView.image = UIImage(named: imageNames[seq])
        } else {
            rightButton.isEnabled = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

