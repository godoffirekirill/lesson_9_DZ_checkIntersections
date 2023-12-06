//
//  ViewController.swift
//  Lesson 9 DZ CreateCircle
//
//  Created by Кирилл Курочкин on 25.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var radius: CGFloat = 100
    var views: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(addView))
        self.view.addGestureRecognizer(recognizer)
        
    }
    
    @IBAction func addView(_ sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: self.view)
        let newView = UIView(frame: CGRect(x: tapLocation.x, y: tapLocation.y, width: radius, height: radius))
        newView.backgroundColor = .black
        newView.layer.cornerRadius = newView.frame.size.width/2
        
        self.views.append(newView)
        
        self.view.addSubview(newView)
        checkIntersections()
    }
    
    func checkIntersections() {
        var viewsToRemove: [UIView] = []
        for i in 0..<views.count {
            for j in i+1..<views.count {
                if views[i].frame.intersects(views[j].frame) {
                    print("View \(i + 1) intersects with View \(j + 1)")
                    viewsToRemove.append(views[i])
                }
            }
            
        }
        
        views.removeAll {viewsToRemove.contains($0)}
            
            viewsToRemove.forEach { $0.removeFromSuperview()}
            
            
            
        }
        
    }

