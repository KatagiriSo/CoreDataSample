//
//  CoreDataUtility.swift
//  TimeLine
//
//  Created by 片桐奏羽 on 2015/09/30.
//  Copyright (c) 2015年 SoKatagiri. All rights reserved.
//

import UIKit
import CoreData

@objc(MyManagedObject)
class MyManagedObject : NSManagedObject
{
    @NSManaged var timestamp:NSDate
    @NSManaged var text:String
}


class CoreDataUtility: NSObject {
    var managerContext : NSManagedObjectContext?
    var myManagedObjectEntity : NSEntityDescription?
    
    override init() {
        super.init()
        setUp()
    }
    
    
    func setUp()
    {
        let managedObjectModel = NSManagedObjectModel.mergedModelFromBundles(nil)// モデルを読み込む
        
        // 永続storeとしてsqliteのセット
        let url = NSURL(fileURLWithPath: "".stringByAppendingPathComponent("data.sqlite"))
        let persistetStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel!)
        
        var error:NSError?
        persistetStoreCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil, error: &error)
        
        self.managerContext = NSManagedObjectContext()
        self.managerContext!.persistentStoreCoordinator = persistetStoreCoordinator

        self.myManagedObjectEntity = NSEntityDescription.entityForName("MyManagedObject", inManagedObjectContext: self.managerContext!)
    }
    
    func testDataWrite()
    {
        var newRecord = MyManagedObject(entity: self.myManagedObjectEntity!, insertIntoManagedObjectContext: self.managerContext)
        newRecord.timestamp = NSDate()
        newRecord.text = "hoge"
    }
    
    func testDataRead() -> [MyManagedObject]
    {
        let fetchRequest = NSFetchRequest(entityName: "MyManagedObject")
        fetchRequest.returnsObjectsAsFaults = false
        
        var results : Array! = self.managerContext!.executeFetchRequest(fetchRequest, error: nil)
        
        var records:[MyManagedObject] = []
        
        
        for res in results
        {
            records.append(res as! MyManagedObject)
        }
        
        return records
    }
}

