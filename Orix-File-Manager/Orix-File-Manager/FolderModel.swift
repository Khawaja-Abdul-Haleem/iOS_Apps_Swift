//
//  FolderModel.swift
//  Orix-File-Manager
//
//  Created by Khawaja Abdul Haleem on 27/06/2023.
//

import Foundation

struct FolderModel {
    let folderImage: String
    let folderName: String
    let folderDate: String
    let folderDetail: String
}

let myFolderModel = [
    FolderModel(folderImage: "oneDrive", folderName: "One Drive", folderDate: "03 July 2023", folderDetail: "Files: 75 Items 620 Used: 60GB"),
    FolderModel(folderImage: "GoogleDrive", folderName: "Google Drive", folderDate: "03 July 2023", folderDetail: "Files: 28 Items: 100 Usage: 10GB"),
    FolderModel(folderImage: "dropBox", folderName: "DropBox", folderDate: "03 July 2023", folderDetail: "Files: 25 Items: 100 Usage: 9.9GB")
]
