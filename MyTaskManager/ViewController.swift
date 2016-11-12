//
//  ViewController.swift
//  MyTaskManager
//
//  Created by Juan Morillo on 12/11/16.
//  Copyright © 2016 Juan Morillo. All rights reserved.
//

import UIKit

  var task = [String]()

class ViewController: UIViewController, UITableViewDataSource {
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return task.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellID = "cell"
    let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
    cell.textLabel?.text = task[indexPath.row]
    return cell
  }
  
  @IBAction func addTask(_ sender: Any) {
    //AlertView
    let alertView = UIAlertController(title: "Nueva Tarea", message: "Añade una nueva tarea", preferredStyle: UIAlertControllerStyle.alert)
    let saveAction = UIAlertAction(title: "Guardar", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction) -> Void in
      
      //Guardamos el texto en el array
    let textField = alertView.textFields?.first
      task.append((textField?.text)!)
    self.tableView.reloadData()
      
    })
    
    //Creamos el UIAlertAction que nos permitirá cancelar
    let cancelAction = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.default) { (action: UIAlertAction) -> Void in
    }
    //Añadimos el TextFiel al UialertController
    alertView.addTextField { (textField: UITextField) -> Void in
    }
    
    //Añadimos las dos UIAlertAction que hemos creado
    alertView.addAction(saveAction)
    alertView.addAction(cancelAction)
    
    //Lanzamos el UIAlertController
    present(alertView, animated: true, completion: nil)
  }

}

