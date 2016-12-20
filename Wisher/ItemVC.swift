//
//  ItemVC.swift
//  Wisher
//
//  Created by Eugene Pavlov on 12/19/16.
//  Copyright © 2016 Eugene Pavlov. All rights reserved.
//

import UIKit
import CoreData

class ItemVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    
    @IBOutlet weak var thumbImage: UIImageView!
    
    var stores = [Store]()
    var itemToEdit: Item? // optional variable to store item to edit
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Override title for back button, in this case to leave it empty and just have back icon
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        storePicker.dataSource = self
        storePicker.delegate = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
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
        
        if itemToEdit != nil {
            loadItemData()
        }
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
    
    /**
     Function to save/edit item in CoreData
     
     - parameter sender: Any
     
     - returns: void
     */
    @IBAction func saveTapped(_ sender: Any) {
        var item: Item!
        
        // Check if we editing or adding new item
        if itemToEdit == nil {
            item = Item(context: context)
        } else {
            item = itemToEdit
        }
        
        if let title = titleField.text {
            item.title = title
        }
        if let price = priceField.text {
            item.price = (price as NSString).doubleValue
        }
        if let details = detailsField.text {
            item.details = details
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        // Save image
        let picture = Image(context: context)
        picture.image = thumbImage.image
        item.toImage = picture
        
        // Save data
        ad.saveContext()
        
        // Close/dismiss view controller
        _ = navigationController?.popViewController(animated: true)
    }
    
    /**
     Function to load item to edit if user taps on table view item
     
     - returns: void
     */
    func loadItemData() {
        if let item = itemToEdit {
            titleField.text = item.title
            priceField.text = "\(item.price)"
            detailsField.text = item.details
            
            thumbImage.image = item.toImage?.image as? UIImage
            
            if let store = item.toStore {
                var index = 0
                repeat {
                    let s  = stores[index]
                    if s.name == store.name {
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                    }
                    index += 1
                } while (index < stores.count)
            }
        }
    }
    
    /**
     Function to delete existing wisher item
     */
    @IBAction func deleteTapped(_ sender: Any) {
        if itemToEdit != nil {
            context.delete(itemToEdit!)
            ad.saveContext()
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    /**
     Function to add image to wisher item.
     Presents image picker view controller to the user
     */
    @IBAction func addImage(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    /**
     Function to to fire after user selects image on device
     */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            thumbImage.image = img
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
}
