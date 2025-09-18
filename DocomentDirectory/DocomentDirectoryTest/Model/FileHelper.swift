
//
//  FileHelper.swift
//  DocomentDirectoryTest
//
//  Created by Alimullah on 17/9/25.
//

import UIKit

class FileHelper {
    
    static let shared = FileHelper()
    private let fm = FileManager.default
    
    private init() {}
    
    // MARK: - Root Folder
    var rootFolder: URL {
        let url = fm.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("RootFolder")
        if !fm.fileExists(atPath: url.path) {
            try? fm.createDirectory(at: url, withIntermediateDirectories: true)
        }
        return url
    }
    
    // MARK: - Folder Create
    func createFolder(name: String) {
        let folderURL = rootFolder.appendingPathComponent(name)
        if !fm.fileExists(atPath: folderURL.path) {
            try? fm.createDirectory(at: folderURL, withIntermediateDirectories: true)
            print("📁 Folder Created:", folderURL.path)
        }
    }
    
    // MARK: - Delete Folder
    func deleteFolder(name: String) {
        let folderURL = rootFolder.appendingPathComponent(name)
        if fm.fileExists(atPath: folderURL.path) {
            try? fm.removeItem(at: folderURL)
            print("🗑️ Folder Deleted:", folderURL.path)
        }
    }
    

    // MARK: - Get All Folder Names
    func getAllFolders() -> [String] {
        guard let items = try? fm.contentsOfDirectory(at: rootFolder, includingPropertiesForKeys: nil) else { return [] }
        
        return items.filter { url in
            var isDir: ObjCBool = false
            fm.fileExists(atPath: url.path, isDirectory: &isDir)
            return isDir.boolValue
        }
        .map { $0.lastPathComponent }
        .sorted()   // 🔥 Alphabetically sort
    }

    
    // MARK: - Save Image to Folder
    func saveImage(_ image: UIImage, to folder: String) {
        let folderURL = rootFolder.appendingPathComponent(folder)
        if !fm.fileExists(atPath: folderURL.path) {
            try? fm.createDirectory(at: folderURL, withIntermediateDirectories: true)
        }
        
        let fileName = "\(Date().timeIntervalSince1970).png"
        let fileURL = folderURL.appendingPathComponent(fileName)
        
        if let data = image.pngData() {
            try? data.write(to: fileURL)
            print("✅ Image Saved:", fileURL.path)
        }
    }
    
    // MARK: - Load Images from Folder
    func loadImages(from folder: String) -> [UIImage] {
        let folderURL = rootFolder.appendingPathComponent(folder)
        guard let items = try? fm.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil) else { return [] }
        
        var images: [UIImage] = []
        for url in items {
            if let data = try? Data(contentsOf: url),
               let img = UIImage(data: data) {
                images.append(img)
            }
        }
        return images
    }
    
    // MARK: - Delete Image from Folder
    func deleteImage(_ image: UIImage, from folder: String) {
        let folderURL = rootFolder.appendingPathComponent(folder)
        guard let items = try? fm.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil) else { return }
        
        for url in items {
            if let data = try? Data(contentsOf: url),
               let img = UIImage(data: data),
               img.pngData() == image.pngData() {
                try? fm.removeItem(at: url)
                print("🗑️ Image Deleted:", url.path)
                break
            }
        }
    }
}
