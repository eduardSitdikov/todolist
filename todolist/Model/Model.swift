//
//  Model.swift
//  todolist
//
//  Created by Eduard on 03/07/2019.
//  Copyright © 2019 Eduard Sitdykov. All rights reserved.
//

import Foundation

var ToDoItems: [[String:Any]] {
    set{
        UserDefaults.standard.set(newValue, forKey: "ToDoDateKey")
        UserDefaults.standard.synchronize()
    }
    
    get{
        if let array = UserDefaults.standard.array(forKey: "ToDoDateKey") as? [[String:Any]]{
            return array
        }else{
            return []
        }
    }
}

func addItem(nameItem: String, isCompleted: Bool = false){
    ToDoItems.append(["Name":nameItem,"isCompleted":isCompleted])
}

func removeItem (at index: Int){
    ToDoItems.remove(at: index)
}


func changeState(at item: Int) -> Bool{
    ToDoItems[item]["isCompleted"] = !(ToDoItems[item]["isCompleted"] as! Bool)
    return ToDoItems[item]["isCompleted"] as! Bool

}

func moveItem(from: Int, to: Int){
    let item = ToDoItems[from]
    ToDoItems.remove(at: from)
    ToDoItems.insert(item, at: to)
}
