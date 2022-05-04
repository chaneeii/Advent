//
//  DB_Manager.swift
//  AdventCalendar
//
//  Created by Chanhee Jeong on 2022/05/02.
//

import Foundation
import SQLite


class DB_Manager {
    
    // sqlite instance
    private var db: Connection!
    // table
    private var postcards: Table!
    // columns instances of table
    private var day: Expression<String>!
    private var name: Expression<String>!
    private var content: Expression<String>!
    
    
    //constructuor of this class
    init() {
        
        // exception handling
        do {
            
            // path of document directory
            let path: String =
            NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
            
            // creating database connection
            db = try Connection("\(path)/postcards.sqlite3")
            
            // creating table object
            postcards = Table("postcards")
            
            // create instances of each column
            day = Expression<String>("day")
            name = Expression<String>("name")
            content = Expression<String>("content")
            
            
            // check if the user's table is already created
            if (!UserDefaults.standard.bool(forKey: "is_db_created")){
                
                // if not, then create the table
                try db.run( postcards.create { (t) in
                    t.column(day, primaryKey: true)
                    t.column(name)
                    t.column(content)
                    
                })
                
                // set the value to true, so it will not attempt to create the table again
                UserDefaults.standard.set(true, forKey: "is_db_created")
                
            }
            
        } catch {
            // show error message if any
            print(error.localizedDescription)
            
        }
        
        
    }
    
    public func addPost(dayValue:String, nameValue: String, contentValue: String ){
        
        do{
            try db.run(postcards.insert(day <- dayValue, name <- nameValue, content <- contentValue ))
            
        } catch{
            print(error.localizedDescription)
        }
        
    }
    
    public func findPost(dayValue:String) -> Int {

        
        var postCount: Int = 0
        
        do{
            
            let count = try db.scalar(postcards.filter(day == dayValue).count)
            postCount = count
            
        } catch{
            print(error.localizedDescription)
        }
        
        return postCount
        
    }

    
    // return array of post card models
    public func getPostcards() -> [PostCard] {
        
        // create empty array
        var postcardModels: [PostCard] = []
        
        // get all postcards in descending order
//        postcards = postcards.order(id.desc)
        
        // exception handling
        do {
            
            // loop through all users
            for postcard in try db.prepare(postcards){
                
                // create new model in each loop iteration
                let postcardModel: PostCard = PostCard()
                
                // set values in model from database
                postcardModel.day = postcard[day]
                postcardModel.name = postcard[name]
                postcardModel.content = postcard[content]
                
                // append in new array
                postcardModels.append(postcardModel)
                
            }
        }catch{
            print(error.localizedDescription)
        }
        // return array -> postcardModels
        return postcardModels
        
    }

}
