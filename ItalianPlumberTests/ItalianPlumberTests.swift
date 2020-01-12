//
//  ItalianPlumberTests.swift
//  ItalianPlumberTests
//
//  Created by Balazs Szamody on 27/11/19.
//  Copyright © 2019 Balazs Szamody. All rights reserved.
//

import XCTest
import Combine
@testable import ItalianPlumber

class ItalianPlumberTests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let text = "Test Pass"
        
        let viewModel = MockViewModel(text)
        let exp = expectation(description: "expectation")
        var result: String?
        
        let subscription = viewModel.timeString.sink { (text) in
            result = text
            exp.fulfill()
        }
        
        viewModel.send()
        waitForExpectations(timeout: 30, handler: nil)
        
        XCTAssertEqual(result, text)
        
    }
    
    func testTwo() {
        let one = 2
        
        XCTAssertEqual(one, 2)
    }
    
    func testThree() {
        let two = 2
        XCTAssertEqual(two, 2)
    }
}


class MockViewModel: ViewModel {
    let text: String
    var timeString = PassthroughSubject<String?, Never>()
    
    var disposeBag = DisposeBag()
    
    init(_ text: String) {
        self.text = text
    }
    
    func send() {
        timeString.send(text)
    }
}
