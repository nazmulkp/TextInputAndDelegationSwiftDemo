//
//  ViewController.swift
//  TextInputAndDelegationSwiftDemo
//
//  Created by Nazmul Hasan on 11/24/16.
//  Copyright © 2016 Nazmul Hasan. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    
    //A UITextField object displays an editable text area in your interface
    @IBOutlet weak var textField1xValue: UITextField!
    
    //The UILabel class implements a read-only text view. You can use this class to draw one or multiple lines of static text
    @IBOutlet weak var lable2xValue: UILabel!
    
    
    //stoe property
   // var value1x : Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //The receiver’s delegate.
         // A text field delegate responds to editing-related messages from the text field. You can use the delegate to respond to the text entered by the user and to some special commands, such as when the return button is pressed.
        textField1xValue.delegate = self
        
        //The visible title of the Return key.
        //Setting this property to a different key type changes the visible title of the Return key and typically results in the keyboard being dismissed when it is pressed. The default value for this property is default.
        textField1xValue.returnKeyType = .done
        
    }
   //This method looks at the current view and its subview hierarchy
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //This method looks at the current view and its subview hierarchy for the text field that is currently the first responder. If it finds one, it asks that text field to resign as first responder. If the force parameter is set to true, the text field is never even asked; it is forced to resign.
         self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:-  spealing mistake  generate
    //it should be work with "2x Value" Button
    @IBAction func genarate2xValue(_ sender: AnyObject) {
        
        //lable2xValue.text = textField1xValue.text
        
         //The default implementation returns true, resigning first responder status. Subclasses can override this method to update state or perform some action such as unhighlighting the selection, or to return false, refusing to relinquish first responder status. If you override this method, you must call super (the superclass implementation) at some point in your code.
        
        self.textField1xValue.resignFirstResponder()
       
    }
    
    //UITextFieldDelegate protocal method . it should be work for keybord return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        self.textField1xValue.resignFirstResponder()
        return true
    }
    
    //computed property
    var value2x : Double? {
        if let  value = value1x{
            return (value * 2)
        }
        else{
            return nil
        }
    }
    
    var value1x : Double? {
        didSet{
            updateLabel2xValue()
        }
    }
    
    func updateLabel2xValue(){
        
        if let value = value2x {
            //lable2xValue.text = "\(value)"
            
            
            //MARK:- ERORR Cannot convert value of type 'Double' to expected argument type 'NSNumber'
            //lable2xValue.text = numberFormatter.string(from: value)
            
            //MARK:- ERROR Argument labels '(_:)' do not match any available overloads
            //lable2xValue.text = numberFormatter.string(from: NSNumber(value))
            lable2xValue.text = numberFormatter.string(from: NSNumber(value:value))
        }
        else {
            lable2xValue.text = "???"
        }
        
    }
    
    var  numberFormatter : NumberFormatter = {
        let ls = NumberFormatter()
        ls.numberStyle = .decimal
        ls.minimumFractionDigits = 0
        ls.maximumFractionDigits = 2
        return ls
    }()
    
    
    @IBAction func textField1xValueEditingChange(_ sender: AnyObject) {
        //print(self.textField1xValue.text)
        if let value = self.textField1xValue.text , let doubleValue = Double(value){
            value1x = doubleValue
            
        }else{
            value1x = nil
        }
    }


}

