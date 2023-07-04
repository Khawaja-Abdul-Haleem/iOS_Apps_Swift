//
//  Constant.swift
//  Orix-File-Manager
//
//  Created by Khawaja Abdul Haleem on 26/06/2023.
//

import Foundation
import UIKit

class Constants {
    // MARK:  SegueConstant
    static let SEGUE_GOTO_FVC = "goToFVC"
    
    // MARK:  StringConstant
    static let notFoundTitle = "No Title Found"
    static let headerDefaultTitle = "All Items"
    static let notFoundDirectory = "No directory Found"
    static let orixDirectory = "Figma File"
    static let defaultDirectory = "Items"
    
    // MARK:  getStoragePercentage
    static func getStoragePercentage(type: StorageTypeEnum) -> Float {
        let value = type == StorageTypeEnum.used ? Float(UIDevice.current.usedDiskSpaceInBytes) : Float(UIDevice.current.freeDiskSpaceInBytes)
        let percentage = (value / Float(UIDevice.current.totalDiskSpaceInBytes)) * 100
        
        return percentage
    }
    
    static func getUsedStorage() -> String {
        "\(Int(Constants.getStoragePercentage(type: .used)))% USED"
    }
    
    static func getFolderStorage(documentsPath: String) -> String {
        let fileManager = FileManager.default
        var count = 0
        var dirContents = [String]()
        var size = ""
        var items = 0
        var folderName = ""
        
        do {
            let documentDirectory = URL(string: "file://\(documentsPath)")
            if let sizeOnDisk = try documentDirectory?.sizeOnDisk() {
                size = sizeOnDisk
            }
            dirContents = try fileManager.contentsOfDirectory(atPath: documentsPath)
            count = dirContents.count
            for item in dirContents {
                if item == ".DS_Store" {
                    count -= 1
                } else {
                    folderName = item
                    dirContents = try fileManager.contentsOfDirectory(atPath: "\(documentsPath)/\(item)")
                    items = dirContents.count
                }
            }
        } catch {
            // failed to read directory – bad permissions, perhaps?
        }
        
        return "Files: \(count) Items: \(items - 1) Used: \(size) folderName: \(folderName)"
    }
}
