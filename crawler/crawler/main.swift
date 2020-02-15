//
//  main.swift
//  crawler
//
//  Created by Aaron Chen on 2020-02-14.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func crawler (_ rootPath:String,_ level:String,_ Dcount:inout Int,_ Fcount:inout Int){
    let fileSystem = FileManager.default
    
    do {
        let items = try fileSystem.contentsOfDirectory(atPath: rootPath)
        var itemOrder = 0
        for item in items {
            itemOrder += 1
            var levelSpace = "│     "
            var connectLine = "├─"
            /*Is last**/
            if(itemOrder == items.count){
                levelSpace = "      "
                connectLine = "└─"
            }
            
            let itemfullpath = "\(rootPath)/\(item)"
            var isDir:ObjCBool = false
            
            
            fileSystem.fileExists(atPath: itemfullpath, isDirectory: &isDir)
            if(isDir.boolValue){
                Dcount += 1
                print(level+connectLine+item)
                crawler(itemfullpath,level+levelSpace, &Dcount, &Fcount)
            }else{
                Fcount += 1
                print(level+connectLine+item)
            }
        }
    } catch {
        
    }
    
}
let rootPath = "/Users/aaronchen/MyProjects/--Demo--swift_demo_in_class"
var fcount = 0
var dcount = 0
crawler(rootPath,"",&dcount, &fcount)
print("\(dcount) directories, \(fcount) files")

