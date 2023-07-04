//
//  Extension.swift
//  Orix-File-Manager
//
//  Created by Khawaja Abdul Haleem on 26/06/2023.
//

import Foundation
import UIKit

// MARK:  UIView
extension UIView {
    func showCircle(free: Float, used: Float, width: CGFloat, radius: CGFloat) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) { [weak self] in
            guard let self = self else { return }
            let total: Int = 2
            let width: CGFloat = width
            let reducer: CGFloat = 0.02 // add gape b/w segments if reducer > 0
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width / 2,
                                                             y: self.frame.size.height / 2),
                                          radius: self.frame.size.width / radius,
                                          startAngle: CGFloat(-0.5 * Double.pi),
                                          endAngle: CGFloat(1.5 * Double.pi),
                                          clockwise: true)
            
            // these are the percentages
            let percentages = [Double(used / 100), Double(free / 100)]
            
            for i in 1...total {
                let prevPercentage: Double = percentages.prefix(i - 1).reduce(0, +)
                let percentage = percentages[i - 1]
                
                let circleShape = CAShapeLayer()
                circleShape.path = circlePath.cgPath
                
                switch i-1 {
                case 0:
                    circleShape.strokeColor = UIColor.white.cgColor
                    
                case 1:
                    circleShape.strokeColor = UIColor(red: 1.00, green: 0.82, blue: 0.20, alpha: 1.00).cgColor
                    
                default:
                    circleShape.strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                }
                circleShape.fillColor = UIColor.clear.cgColor
                circleShape.lineWidth = width
                circleShape.strokeStart = CGFloat(prevPercentage + reducer)
                circleShape.strokeEnd = CGFloat(prevPercentage + percentage)
                self.layer.addSublayer(circleShape)
            }
        }
    }
}

// MARK:  UIDevice
extension UIDevice {
    func MBFormatter(_ bytes: Int64) -> String {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = ByteCountFormatter.Units.useMB
        formatter.countStyle = ByteCountFormatter.CountStyle.decimal
        formatter.includesUnit = false
        return formatter.string(fromByteCount: bytes) as String
    }
    
    //MARK: Get String Value
    var totalDiskSpaceInGB:String {
        return ByteCountFormatter.string(fromByteCount: totalDiskSpaceInBytes, countStyle: ByteCountFormatter.CountStyle.decimal)
    }
    
    var freeDiskSpaceInGB:String {
        return ByteCountFormatter.string(fromByteCount: freeDiskSpaceInBytes, countStyle: ByteCountFormatter.CountStyle.decimal)
    }
    
    var usedDiskSpaceInGB:String {
        return ByteCountFormatter.string(fromByteCount: usedDiskSpaceInBytes, countStyle: ByteCountFormatter.CountStyle.decimal)
    }
    
    var totalDiskSpaceInMB:String {
        return MBFormatter(totalDiskSpaceInBytes)
    }
    
    var freeDiskSpaceInMB:String {
        return MBFormatter(freeDiskSpaceInBytes)
    }
    
    var usedDiskSpaceInMB:String {
        return MBFormatter(usedDiskSpaceInBytes)
    }
    
    //MARK: Get raw value
    var totalDiskSpaceInBytes:Int64 {
        guard let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String),
              let space = (systemAttributes[FileAttributeKey.systemSize] as? NSNumber)?.int64Value else { return 0 }
        return space
    }
    
    var freeDiskSpaceInBytes:Int64 {
        if #available(iOS 11.0, *) {
            if let space = try? URL(fileURLWithPath: NSHomeDirectory() as String).resourceValues(forKeys: [URLResourceKey.volumeAvailableCapacityForImportantUsageKey]).volumeAvailableCapacityForImportantUsage {
                return space ?? 0
            } else {
                return 0
            }
        } else {
            if let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String),
               let freeSpace = (systemAttributes[FileAttributeKey.systemFreeSize] as? NSNumber)?.int64Value {
                return freeSpace
            } else {
                return 0
            }
        }
    }
    
    var usedDiskSpaceInBytes:Int64 {
        return totalDiskSpaceInBytes - freeDiskSpaceInBytes
    }
    
}

// MARK:  UICollectionView
public extension UITableView {
    
    func registerNib(cell: ReusableCell.Type, in bundle: Bundle? = nil) {
        register(UINib(nibName: cell.ReuseId, bundle: bundle), forCellReuseIdentifier: cell.ReuseId)
        
    }
    
    func dequeueReusableCell<T: ReusableCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.ReuseId, for: indexPath ) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.ReuseId)")
        }
        return cell
    }
    
}

// MARK:  UIView
extension UIView {
    var loadNibView: UIView? {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: nil)
        return nib.instantiate(withOwner: self, options: [:]).first as? UIView
    }
}

extension UITableViewCell: ReusableCell {}

// MARK:  URL
extension URL {
    /// check if the URL is a directory and if it is reachable
    func isDirectoryAndReachable() throws -> Bool {
        guard try resourceValues(forKeys: [.isDirectoryKey]).isDirectory == true else {
            return false
        }
        return try checkResourceIsReachable()
    }
    
    /// returns total allocated size of a the directory including its subFolders or not
    func directoryTotalAllocatedSize(includingSubfolders: Bool = false) throws -> Int? {
        guard try isDirectoryAndReachable() else { return nil }
        if includingSubfolders {
            guard
                let urls = FileManager.default.enumerator(at: self, includingPropertiesForKeys: nil)?.allObjects as? [URL] else { return nil }
            return try urls.lazy.reduce(0) {
                (try $1.resourceValues(forKeys: [.totalFileAllocatedSizeKey]).totalFileAllocatedSize ?? 0) + $0
            }
        }
        return try FileManager.default.contentsOfDirectory(at: self, includingPropertiesForKeys: nil).lazy.reduce(0) {
            (try $1.resourceValues(forKeys: [.totalFileAllocatedSizeKey])
                .totalFileAllocatedSize ?? 0) + $0
        }
    }
    
    /// returns the directory total size on disk
    func sizeOnDisk() throws -> String? {
        guard let size = try directoryTotalAllocatedSize(includingSubfolders: true) else { return nil }
        URL.byteCountFormatter.countStyle = .file
        guard let byteCount = URL.byteCountFormatter.string(for: size) else { return nil}
        return byteCount
    }
    
    private static let byteCountFormatter = ByteCountFormatter()
}
