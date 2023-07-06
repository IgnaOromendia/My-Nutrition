//
//  Goal.swift
//  My Nutrition
//
//  Created by Igna on 05/07/2023.
//

// GOAL TYPES
// - Eat *food* more/less than *amount* of time this *amount of weeks/days*
// - Eat this precentage of *food type* on this *amount of weeks/days*

import Foundation

class Goal: Codable, CustomStringConvertible, Comparable, Identifiable {
    
    let id                  : String
    private var _progress   : Double
    private let _title      : String
    private let _type       : GoalType
    private let _startDate  : Date
    private var _endDate    : Date
    
    // Constructor
    
    init(id: String = UUID().uuidString, _progress: Double = 0, _title: String, _type: GoalType, _startDate: Date, _endDate: Date) {
        self.id = id
        self._progress = _progress
        self._title = _title
        self._type = _type
        self._startDate = _startDate
        self._endDate = _endDate
    }
    
    // Custom String Convertible
    var description: String {
        return _title + ": \(_progress)/10"
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
    
    func progress() -> Double {
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
    
    func initialDuration() -> TimeInterval {
        return _startDate.distance(to: _endDate)
    }
    
    func actualDuaration() -> TimeInterval {
        return Date().distance(to: _endDate)
    }
    
    // MARK: - SETs
    
    func setProgress(_ progress:Double) {
        _progress = progress
    }
    
    func updateProgress() {
        _progress = actualDuaration() * 100 / initialDuration()
    }
    
    func setEndDate(_ date: Date) {
        _endDate = date
    }
    
    /// Extend the end date with the **time** passed, if the end time was a nil it will take from now + **time**
    func extendEndDate(_ time:TimeInterval) {
        _endDate += time
    }
    
}

class GoalA: Goal {
    
    private var food    : Food
    private var amount  : Int
    private var duration: Int
    
    // More = True, less = false
    init(food: Food, amount: Int, duration: Int, more: Bool) {
        self.food = food
        self.duration = duration
        self.amount = amount
        
        let moreLess = more ? "more" : "less"
        let days = duration > 1 ? "days" : "day"
        let title = "Eat \(food.name()) " + moreLess + " than \(amount) times during \(duration) " + days
        super.init(_title: title, _type: .A, _startDate: Date(), _endDate: Date() + TimeInterval(duration))
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
}

class GoalB: Goal {
    private var type        : FoodType
    private var percentage  : Int
    private var duration    : Int
    
    // More = True, less = false
    init(type: FoodType, percentage: Int, duration: Int) {
        self.type = type
        self.percentage = percentage
        self.duration = duration
        
        let days = duration > 1 ? "days" : "day"
        let title = "Eat \(percentage)% of \(passFoodTypeToString(type)) during \(duration) " + days
        super.init(_title: title, _type: .A, _startDate: Date(), _endDate: Date() + TimeInterval(duration))
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
