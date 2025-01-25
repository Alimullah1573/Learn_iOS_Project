//
//  ViewController.swift
//  test_Todo List
//
//  Created by Alimullah on 25/1/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    
    
    var Table_view = UITableView()
    
    var taskss = [String]()
    
    var Text_fild = UITextField()
    var button_ = UIButton()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Table_view.dataSource = self
        Table_view.delegate = self
        
        
        Table_view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        Table_view.frame = CGRect(x: 0, y: 150, width: Int(self.view.frame.width), height: Int(self.view.frame.height - 200 ))
        self.view.addSubview(Table_view)
        
        
        
        Text_fild.placeholder = "Enter Task"
        Text_fild.backgroundColor = .green
        Text_fild.layer.cornerRadius = 20
        Text_fild.textAlignment = .center
        Text_fild.frame = CGRect(x: 20, y: 100, width:280, height: 40)
        Text_fild.borderStyle = .roundedRect
        self.view.addSubview(Text_fild)
        
        
        
        button_.setTitle("Add", for: .normal)
        button_.frame = CGRect(x: 310, y: 100, width: 80, height: 40)
        button_.layer.cornerRadius = 1
        button_.backgroundColor = .black
        button_.addTarget(self, action: #selector( add_Task ), for: .touchUpInside)
        self.view.addSubview(button_)
        
        
        }

    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskss.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Table_view.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = taskss[indexPath.row]
    
        
  
        return cell
    }
    
    @objc func add_Task(){
        
        if let task = Text_fild.text, !task.isEmpty{
            
            taskss.append(task)
            Text_fild.text = ""
            
            Table_view.reloadData()
            
        }
        
        
    }
    

}

