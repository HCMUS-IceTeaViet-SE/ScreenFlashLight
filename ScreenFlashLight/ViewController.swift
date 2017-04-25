//
//  ViewController.swift
//  ScreenFlashLight
//
//  Created by Genius Doan on 4/25/17.
//  Copyright © 2017 IceTeaViet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var mainView: UIView!
    
    
    @IBOutlet weak var mUIView: UIView!
    var currColor:UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let red = UserDefaults.standard.value(forKeyPath: "red")
        let green = UserDefaults.standard.value(forKeyPath: "green")
        let blue = UserDefaults.standard.value(forKeyPath: "blue")
        let alpha = UserDefaults.standard.value(forKeyPath: "alpha")
        
        if (red != nil) {
            currColor = UIColor(red: red as! CGFloat,green:green as! CGFloat,blue: blue as! CGFloat,alpha:alpha as! CGFloat)
        } else {
            currColor = UIColor(red:0.5, green:0.5, blue: 0.5, alpha: 0.5)
            
        }
        
        if (currColor != nil){
            mainView.backgroundColor = currColor
        }
        
        let hold = UILongPressGestureRecognizer(target: self, action: #selector(self.view_LongPressed))
        self.view.addGestureRecognizer(hold)
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.uiViewTapped))
        tap.delegate = self
        
        mainView.addGestureRecognizer(tap)
    }
    
    func view_LongPressed(sender: UITapGestureRecognizer){
        var timer = Timer()
        
        if sender.state == .began{
            timer = Timer.scheduledTimer(timeInterval:0.05,target: self,selector: #selector(eachInterval),userInfo:nil,repeats:true)
        }else if sender.state == .ended{
            timer.invalidate()// dung timer
            self.mainView.backgroundColor = currColor
        }
        
    }
    var black = true
    
    func eachInterval(){
        self.mainView.backgroundColor = black ? UIColor.black : currColor
        black = !black
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
            let settingVC = segue.destination as! SettingsViewController
            
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha:  CGFloat = 0
            
            currColor?.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            settingVC.red = Float(red)
            settingVC.green = Float(green)
            settingVC.blue = Float(blue)
            settingVC.alpha = Float(alpha)
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}

