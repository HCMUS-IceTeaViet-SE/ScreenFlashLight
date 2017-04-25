//
//  SettingsViewController.swift
//  ScreenFlashLight
//
//  Created by Genius Doan on 4/25/17.
//  Copyright © 2017 IceTeaViet. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redTxtField: UITextField!
    @IBOutlet weak var greenTxtField: UITextField!
    @IBOutlet weak var blueTxtField: UITextField!
    @IBOutlet weak var alphaTxtField: UITextField!
    
    @IBOutlet weak var previewView: UIView!
    
    @IBAction func onSaveButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "ToMainAndSaveSegue", sender: self)
    }
    
    @IBAction func onBackButtonTapped(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onRedSliderValueChanged(_ sender: UISlider) {
        red = redSlider.value
        redTxtField.text = "\(red *  255)"
        updatePreviewColor()
    }
    
    @IBAction func onGreenSliderValueChanged(_ sender: UISlider) {
        green = greenSlider.value
        greenTxtField.text = "\(green *  255)"
        updatePreviewColor()
    }
    
    @IBAction func onBlueSliderValueChanged(_ sender: UISlider) {
        blue = blueSlider.value
        blueTxtField.text = "\(blue *  255)"
        updatePreviewColor()
    }
    
    @IBAction func onAlphaSliderValueChanged(_ sender: UISlider) {
        alpha = alphaSlider.value
        alphaTxtField.text = "\(alpha *  255)"
        updatePreviewColor()
    }
    
    //MARK: *** Data model
    var red: Float = 0.5
    var green: Float = 0.5
    var blue: Float = 0.5
    var alpha: Float = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        previewView.backgroundColor = UIColor(red:0.5,green:0.5,blue: 0.5,alpha:1)
        
        if (red != nil){
            redSlider.value = Float(CGFloat((red)))
            greenSlider.value = Float(CGFloat((green)))
            blueSlider.value = Float(CGFloat((blue)))
            alphaSlider.value = Float(CGFloat((alpha)))
            
            updatePreviewColor()
            redTxtField.text = "\( redSlider.value *  255)"
            greenTxtField.text = "\( greenSlider.value *  255)"
            blueTxtField.text = "\( blueSlider.value *  255)"
            alphaTxtField.text = "\( alphaSlider.value *  255)"
            
            redTxtField.delegate = self
            greenTxtField.delegate = self
            blueTxtField.delegate = self
            alphaTxtField.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Logic functions
    func updatePreviewColor(){
        previewView.backgroundColor = UIColor(red:CGFloat(red),green:CGFloat(green),blue: CGFloat(blue),alpha:CGFloat(alpha))
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var redValue = redTxtField.text!
        var greenValue = greenTxtField.text!
        var blueValue = blueTxtField.text!
        var aphaValue = alphaTxtField.text!
        
        if (textField == redTxtField){
            redValue += string
            redSlider.value = (redValue as! NSString).floatValue / 255
            red = redSlider.value
            updatePreviewColor()
        }
        else if (textField == greenTxtField){
            greenValue += string
            greenSlider.value = (greenValue as! NSString).floatValue / 255
            green = greenSlider.value
            updatePreviewColor()
        }
        else if (textField == blueTxtField){
            blueValue += string
            blueSlider.value = (blueValue as! NSString).floatValue / 255
            blue = blueSlider.value
            updatePreviewColor()
        }
        else if (textField == alphaTxtField){
            aphaValue += string
            alphaSlider.value = (aphaValue as! NSString).floatValue / 255
            alpha = alphaSlider.value
            updatePreviewColor()
        }
        
        return true
    }
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "ToMainAndSaveSegue"){
            let destination = segue.destination as! ViewController
            
            destination.currColor = UIColor(red:CGFloat(red),green:CGFloat(green),blue: CGFloat(blue),alpha:CGFloat(alpha))
            UserDefaults.standard.set(red, forKey: "red")
            UserDefaults.standard.set(green, forKey: "green")
            UserDefaults.standard.set(blue, forKey: "blue")
            UserDefaults.standard.set(alpha, forKey: "alpha")
            
            
        }
    }

}
