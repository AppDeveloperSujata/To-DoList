//
//  ViewController.swift
//  To-DoList
//
//  Created by Sujata Shyam on 8/20/18.
//  Copyright © 2018 Sujata Shyam. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController
{
    var itemArray = [Item]()
    //let defaults = UserDefaults.standard
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //print(dataFilePath)
        
        /*
        let newItem = Item()
        newItem.title = "Find Peace"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggs"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Destroy Fairyland"
        itemArray.append(newItem3)
        */
        
        loadItems()
    }

    //MARK: Tableview Datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        //Ternary operator ==>
        //value = condition ? valueIfTrue : valueIfFalse
        cell.accessoryType = item.done ? .checkmark : .none
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveItems()
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: Add New Items
    
    @IBAction func btnAdd_Click(_ sender: UIBarButtonItem)
    {
        var textField = UITextField()
        
        // Add Alert
        let alert = UIAlertController(title: "Add New To Do Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) {
            (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            self.saveItems()
        }
        alert.addTextField{
            (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
    
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
   
    //MARK - Model Manipulation Methods
    
    fileprivate func saveItems()
    {
        let encoder = PropertyListEncoder()
        
        do
        {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        }
        catch
        {
            print("Error encoding item array, \(error)")
        }
        self.tableView.reloadData()
    }
    
    fileprivate func loadItems()
    {
        if let data = try? Data(contentsOf: dataFilePath!)
        {
            let decoder = PropertyListDecoder()
            do
            {
                itemArray = try decoder.decode([Item].self, from: data)
            }
            catch
            {
                print("Error Decoding \(error)")
            }
        }
    }
}

