//
//  ItemVC.swift
//  Wisher
//
//  Created by Eugene Pavlov on 12/19/16.
//  Copyright © 2016 Eugene Pavlov. All rights reserved.
//

import UIKit
import CoreData

class ItemVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    
    var stores = [Store]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Override title for back button, in this case to leave it empty and just have back icon
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        storePicker.dataSource = self
        storePicker.delegate = self
        
        /*
        // Create "stores" data
        let store = Store(context: context)
        store.name = "BestBuy"
        let store1 = Store(context: context)
        store1.name = "Test Dealership"
        let store2 = Store(context: context)
        store2.name = "Targer"
        let store3 = Store(context: context)
        store3.name = "Amazon"
        let store4 = Store(context: context)
        store4.name = "eBay"
        let store5 = Store(context: context)
        store5.name = "Microcenter"
        
        // save data to DB
        ad.saveContext()
        */
        
        getStores()
        
        self.hideKeyboardWhenTappedAround()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // update when selected
    }
    
    func getStores() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.stores = try context.fetch(fetchRequest)
            // reload storePicker
            self.storePicker.reloadAllComponents()
        } catch {
            // handle the error
        }
    }
    
}
