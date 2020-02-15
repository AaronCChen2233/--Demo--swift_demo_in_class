//
//  main.swift
//  crawler
//
//  Created by Aaron Chen on 2020-02-14.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation


/// <#Description#>
/// - Parameters:
///   - rootPath: <#rootPath description#>   the director path
///   - level: <#level description#> a space for print have level effet
///   - Dcount: <#Dcount description#> director total count (use inout)
///   - Fcount: <#Fcount description#> file total count (use inout)
func crawler (_ rootPath:String,_ level:String,_ Dcount:inout Int,_ Fcount:inout Int){
    let fileSystem = FileManager.default
    
    do {
        let items = try fileSystem.contentsOfDirectory(atPath: rootPath)
        var itemOrder = 0
        
        for item in items {
            /*scan all files or directorys in this director**/
            itemOrder += 1
            var levelSpace = "│     "
            var connectLine = "├─"
            
            if(itemOrder == items.count){
                /*If is last**/
                levelSpace = "      "
                connectLine = "└─"
            }
            
            let itemfullpath = "\(rootPath)/\(item)"
            
            var isDir:ObjCBool = false
            
            fileSystem.fileExists(atPath: itemfullpath, isDirectory: &isDir)
            if(isDir.boolValue){
                /*If is Directory scan this folder**/
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

let fileManager = FileManager.default
var rootPath = fileManager.currentDirectoryPath
var fcount = 0
var dcount = 0

/*frist argument will be current file full path**/
if CommandLine.arguments.count == 2 {
    rootPath = CommandLine.arguments[1]
}

crawler(rootPath,"",&dcount, &fcount)

/*print the total **/
print("\(dcount) directories, \(fcount) files")


