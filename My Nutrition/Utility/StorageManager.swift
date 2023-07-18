//
//  StorageManager.swift
//  My Nutrition
//
//  Created by Igna on 14/07/2023.
//

import Foundation

final class StorageManager {
    
    private static let encoder = JSONEncoder()
    private static let decoder = JSONDecoder()
    
    /// Returns the document directory
    private static var documentDirectory: URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    static func saveData(_ data: [String:Week]) {
        do {
            // Check if the document directory exists
            guard let documentDirectory = self.documentDirectory else { print("couldn't find directory"); return }
            
            // Create a directory for the app
            try FileManager().createDirectory(at: documentDirectory, withIntermediateDirectories: true, attributes: nil)
            
            // Create the path of the file
            let jsonURL = documentDirectory.appendingPathExtension(masterFileName)
            
            // Format the json
            encoder.outputFormatting = .prettyPrinted
            
            // Encode
            let jsonData = try encoder.encode(data)
            
            // Write the file with json data
            try jsonData.write(to: jsonURL)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func readData() -> [String:Week] {
        var result: [String:Week] = [:]
        
        do {
            // Check if the document directory exists, if not it returns an empty dictionary
            guard let documentDirectory = self.documentDirectory else { print("couldn't find directory"); return result }
            
            // Create the path of the file
            let jsonURL = documentDirectory.appendingPathExtension(masterFileName)
            
            // Read the file
            let savedData = try Data(contentsOf: jsonURL)
            
            // Decode
            result = try decoder.decode(Dictionary<String,Week>.self, from: savedData)
        } catch {
            print(error.localizedDescription)
        }
        
        return result
    }
    
}
