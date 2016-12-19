//
//  ItemVC.swift
//  Wisher
//
//  Created by Eugene Pavlov on 12/19/16.
//  Copyright © 2016 Eugene Pavlov. All rights reserved.
//

import UIKit

class ItemVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Override title for back button, in this case to leave it empty and just have back icon
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
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
