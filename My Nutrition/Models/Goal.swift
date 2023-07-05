//
//  Goal.swift
//  My Nutrition
//
//  Created by Igna on 05/07/2023.
//

import Foundation

class Goal: Codable, CustomStringConvertible, Comparable, Identifiable {
    
    let id                  : String
    private var _progress   : Int
    private var _title      : String
    private let _startDate  : Date
    private var _endDate    : Date?
    
    // Constructor
    init(progress: Int, title: String, startDate: Date = Date(), endDate: Date? = nil) {
        self.id = UUID().uuidString
        self._progress = progress
        self._title = title
        self._startDate = startDate
        self._endDate = endDate
    }
    
    convenience init(title: String) {
        self.init(progress: 0, title: title)
    }
    
    // Custom String Convertible
    var description: String {
        return _title + ": \(_progress)/100"
    }
    
    // Comparable
    static func < (lhs: Goal, rhs: Goal) -> Bool {
        return lhs._progress < rhs._progress
    }
    
    // Equatable
    static func == (lhs: Goal, rhs: Goal) -> Bool {
        return lhs._title == rhs._title && lhs._progress == rhs._progress
    }
    
    // MARK: - GETs
    
    func progress() -> Int {
        return _progress
    }
    
    func title() -> String {
        return _title
    }
    
    func completed() -> Bool {
        return _progress == 100
    }
    
    func startDate() -> Date {
        return _startDate
    }
    
    func endDate() -> Date? {
        return _endDate
    }
    
    func hasEndDate() -> Bool {
        return _endDate == nil
    }
    
    // MARK: - SETs
    
    func setProgress(_ progress:Int) {
        _progress = progress
    }
    
    func setTitle(_ title: String) {
        _title = title
    }
    
    func setEndDate(_ date: Date) {
        _endDate = date
    }
    
    /// Extend the end date with the **time** passed, if the end time was a nil it will take from now + **time**
    func extendEndDate(_ time:TimeInterval) {
        if var endDate = _endDate {
            endDate += time
            _endDate = endDate
        } else {
            _endDate = Date() + time
        }
    }
    
}
