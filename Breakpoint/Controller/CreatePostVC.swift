//
//  CreatePostVC.swift
//  Breakpoint
//
//  Created by Sanjay Vekariya on 9/4/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        sendBtn.bindToKeyboard()
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        if textView.text != nil && textView.text != "Say something here..." {
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: textView.text, forUID: (Auth.auth().currentUser?.uid)!, forGroupKey: nil, sendComplete: { (success) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print("There was an error")
                }
                self.sendBtn.isEnabled = true
            })
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
