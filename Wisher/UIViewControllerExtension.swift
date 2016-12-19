//
//  UIViewControllerExtension.swift
//  Wisher
//
//  Created by Eugene Pavlov on 12/19/16.
//  Copyright © 2016 Eugene Pavlov. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /**
     Function to hide keyboard when tappet outside of the keyboard on the screen
     
     - returns: void
     */
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
