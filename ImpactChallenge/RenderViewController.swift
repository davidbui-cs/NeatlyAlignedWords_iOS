//
//  RenderViewController.swift
//  ImpactChallenge
//
//  Created by David Bui on 2/12/22.
//

import UIKit

class RenderViewController: UIViewController {

    @IBOutlet weak var formattedTextView: UITextView!
    
    var sentenceText: String!
    var numColumns: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let separators = CharacterSet(charactersIn: " \n.")
        let splittedText = sentenceText.components(separatedBy: separators).filter { !$0.isEmpty }
        
        var currentCol = 0
        var maxLenInColumnList = [Int]()
        
        //Initialize Column List
        if(numColumns == nil || numColumns < 0){
            numColumns = 1
        }
        for num in 0...numColumns-1{
            maxLenInColumnList.append(0)
        }
        
        
        for word in splittedText{
            if(currentCol == numColumns){
                currentCol = 0
            }
            if(word.count > maxLenInColumnList[currentCol]){
                maxLenInColumnList[currentCol] = word.count
            }
            currentCol = currentCol + 1
        }
        
        //begin string format
        
        currentCol = 0
        
        var formattedText = ""
        for word in splittedText{
            if(currentCol == numColumns){
                currentCol = 0
                formattedText += "\n"
            }
            let spacingCount = maxLenInColumnList[currentCol] - word.count
            let spacing = String(repeating: " ", count: spacingCount + 1)
            formattedText += word + spacing
            currentCol += 1
        }
        print(formattedText) //for raw console output
        formattedTextView.text = formattedText
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
