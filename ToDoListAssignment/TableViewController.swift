//
//  TableViewController.swift
//  ToDoListAssignment
//
//  Created by IMCS2 on 7/25/19.
//  Copyright © 2019 Tanishk. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //var vc: ViewController
    @IBOutlet weak var TableViewOutlet: UITableView!
   
    //var listArray1: [String] = []
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ToDoListTableViewCell
        
     //  print("fff \(secondVC.listArray)")
        
               cell.CellLabel.text = listArray[indexPath.row]
       
       
      
        
                //Configure the cell...
        
        
                return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // self.TableViewOutlet.reloadData()
//        tableView.dataSource = self
//        tableView.delegate = self
        TableViewOutlet.dataSource = self
        TableViewOutlet.delegate = self
       
      // UserDefaults.standard.removeObject(forKey: "name")
    }
   
    override func viewDidAppear(_ animated: Bool) {
      //  let secondVC = ViewController()
       
        
    //listArray1 = listArray
        
        if let storedArray = UserDefaults.standard.value(forKey: "name"){
            listArray = storedArray as? [String] ?? []
        }else {
            UserDefaults.standard.set(listArray, forKey: "name")
        }
        TableViewOutlet.reloadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let cell = self.TableViewOutlet.cellForRow(at: indexPath) as! ToDoListTableViewCell
        cell.CellLabel.textColor = .black
        self.TableViewOutlet.reloadData()
        
        
        if editingStyle == .delete {
            
            listArray.remove(at: indexPath.row)
           // print("\(listArray[indexPath.row])  deleted")
            
            self.TableViewOutlet.deleteRows(at: [indexPath], with: .automatic)
            
            
            
            UserDefaults.standard.set(listArray, forKey: "name")
           
    }
        
//        let cell = self.TableViewOutlet.cellForRow(at: indexPath) as! ToDoListTableViewCell
        cell.CellLabel.textColor = .black
       // self.TableViewOutlet.reloadData()
        
        
        self.TableViewOutlet.reloadData()
    
    }
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let cell = self.TableViewOutlet.cellForRow(at: indexPath) as! ToDoListTableViewCell
        cell.CellLabel.textColor = .blue
//        self.TableViewOutlet.reloadData()
//
//        let closeAction = UIContextualAction(style: .normal, title:  "Make color Blue", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
//            print("OK, marked as Closed")
//            let cell = self.TableViewOutlet.cellForRow(at: indexPath) as! ToDoListTableViewCell
//            cell.CellLabel.textColor = UIColor.blue
//
//
//           // success(true)
//        })
//
        
        
        
//        closeAction.backgroundColor = .purple
//        cell.CellLabel.textColor = .black
        self.TableViewOutlet.reloadData()
        
        
        return nil
        
        
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
