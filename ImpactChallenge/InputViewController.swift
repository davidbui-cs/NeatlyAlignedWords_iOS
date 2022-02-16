//
//  InputViewController.swift
//  ImpactChallenge
//
//  Created by David Bui on 2/12/22.
//

import UIKit

class InputViewController: UIViewController {
    
    
    @IBOutlet weak var columnField: UITextField!
    
    @IBOutlet weak var renderButton: UIButton!
    
    @IBOutlet weak var textInputBoxField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        columnField.attributedPlaceholder = NSAttributedString(string: "Input number of columns here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.75)])
        
        self.renderButton.layer.cornerRadius = 30
        self.renderButton.clipsToBounds = true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Prepare and pass along data for next view controller
        
        var sentenceText = textInputBoxField.text
        var numColumns = columnField.text
        
        let renderViewController = segue.destination as! RenderViewController
        renderViewController.sentenceText = sentenceText
        renderViewController.numColumns = Int(numColumns!)
    }


}

