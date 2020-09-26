//
//  ViewController.swift
//  UILabelAnimation
//
//  Created by miura hiroyuki on 2020/09/25.
//  Copyright © 2020 miura hiroyuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let searchBox: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = ""
        return searchBar
    }()
    
    var placeholders = ["トマト", "ほうれん草","野菜","シリアル","トイレットペーパー",]
    
    func getUdatedPlaceHolder() -> String {
        let shuffle = placeholders.shuffled()
        return shuffle[0]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(searchBox)
        searchBox.frame = view.frame
        
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: .default)
        
        self.placeholders = self.placeholders.shuffled()
       
    }
    
    let keyframes:[Double] = [0.0, 3.0, 6.0, 7.0]
    var animationStartDate = Date()
    let animationDelay:Double = 3
    var placeHolderOpcity:Double = 1

    var currentPlaceholder = 0


    func setPlaceholderTextAndOpacity(opacity:Double, text:String) {
        searchBox.searchTextField.attributedPlaceholder = NSAttributedString( string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0, green: 0, blue: 0, alpha: CGFloat(opacity))])
    }

    @objc func handleUpdate() {

        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)

        switch elapsedTime {
            case 0 ..< keyframes[1]:
                //keyframe 0

                let percentage:Double = elapsedTime / (keyframes[1] - keyframes[0])
                placeHolderOpcity = percentage
                setPlaceholderTextAndOpacity(opacity: placeHolderOpcity, text: placeholders[currentPlaceholder])
            
            case keyframes[1] ..< keyframes[2]:
                //keyframe 1
                placeHolderOpcity = 1
                
                setPlaceholderTextAndOpacity(opacity: placeHolderOpcity, text: placeholders[currentPlaceholder])

            
            case keyframes[2] ..< keyframes[3]:
                
                //keyframe 2
                let percentage:Double = (elapsedTime - keyframes[2]) / (keyframes[3] - keyframes[2])
                placeHolderOpcity = 1 - percentage
                setPlaceholderTextAndOpacity(opacity: placeHolderOpcity, text: placeholders[currentPlaceholder])

            default:
                animationStartDate = Date()

                if currentPlaceholder == placeholders.count - 1 {
                    currentPlaceholder = 0
                } else {
                    currentPlaceholder += 1
                }
                setPlaceholderTextAndOpacity(opacity: 0, text: placeholders[currentPlaceholder])
        }
    }
}
