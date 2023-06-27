//
//  My_NutritionTests.swift
//  My NutritionTests
//
//  Created by Igna on 26/06/2023.
//

import XCTest
@testable import My_Nutrition

final class Predictor_tests: XCTestCase {

    func test_simple_case() {
        let food1 = Food(name: "Carne", type: .protein)
        let food2 = Food(name: "Pollo", type: .protein)
        let food3 = Food(name: "Ensalada", type: .vegetables)
        let food4 = Food(name: "Papas", type: .carboohydrates)
        let pred = Predictor()
        
        XCTAssertEqual(pred.most_used().0, Food())
        XCTAssertEqual(pred.most_used().1, Food())
        
        pred.update_value(food1)
        
        XCTAssertEqual(pred.most_used().0, food1)
        XCTAssertEqual(pred.most_used().1, Food())
        
        pred.update_value(food1)
        pred.update_value(food2)
        
        XCTAssertEqual(pred.most_used().0, food1)
        XCTAssertEqual(pred.most_used().1, food2)
        
        pred.update_value(food3)
        pred.update_value(food4)
        
        XCTAssertEqual(pred.most_used().0, food1)
        XCTAssertEqual(pred.most_used().1, food2)
        
        pred.update_value(food3)
        pred.update_value(food3)
                
        XCTAssertEqual(pred.most_used().0, food3)
        XCTAssertEqual(pred.most_used().1, food1)
    }

}
