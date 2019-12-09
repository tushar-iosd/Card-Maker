//
//  CardDetailVC.swift
//  CardMaker
//
//  Created by Tushar Sharma on 06/12/19.
//  Copyright © 2019 Appecules. All rights reserved.
//

import UIKit

class CardDetailVC: UIViewController {
    @IBOutlet weak var messageView: UITextView!
    @IBOutlet weak var messageTF: UITextField!
    static var templateText: String = "Your Message"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("New SelectedImage",CardOperationVC.selectedImage)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
         messageView.text = CardDetailVC.templateText
        
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
       CardOperationVC.selectedMessage =  messageView.text
        
        CardOperationVC.selectedName =  messageTF.text ?? "Tushars"
        navigate(newControl: "CardOperationVC", StoryBoard: "Main")
    }
    
    @IBAction func textTemplate(_ sender: Any) {
        navigate(newControl: "CardTextTemplateVC", StoryBoard: "Main")
        
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
