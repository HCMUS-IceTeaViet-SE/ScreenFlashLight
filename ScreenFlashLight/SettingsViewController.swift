//
//  SettingsViewController.swift
//  ScreenFlashLight
//
//  Created by Genius Doan on 4/25/17.
//  Copyright © 2017 IceTeaViet. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redTxtField: UITextField!
    @IBOutlet weak var greenTxtField: UITextField!
    @IBOutlet weak var blueTxtField: UITextField!
    @IBOutlet weak var alphaTxtField: UITextField!
    
    @IBAction func onRedSliderValueChanged(_ sender: UISlider) {
    }
    
    @IBAction func onGreenSliderValueChanged(_ sender: UISlider) {
    }
    
    @IBAction func onBlueSliderValueChanged(_ sender: UISlider) {
    }
    
    @IBAction func onAlphaSliderValueChanged(_ sender: UISlider) {
    }
    
    //MARK: *** Data model
    var red: Float = 0.5
    var green: Float = 0.5
    var blue: Float = 0.5
    var alpha: Float = 0.5
    var defaultColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
