//
//  ViewController.swift
//  ScreenFlashLight
//
//  Created by Genius Doan on 4/25/17.
//  Copyright © 2017 IceTeaViet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var mUIView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.uiViewTapped))
        tap.delegate = self
        
        mUIView.addGestureRecognizer(tap)
    }
    
    
    // Receive action
    func uiViewTapped(gr:UITapGestureRecognizer)
    {
        performSegue(withIdentifier: "ToSettingsSegue",sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "ToSettingsSegue"){
            let setting = segue.destination as! SettingsViewController
            
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha:  CGFloat = 0
            
            
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}

