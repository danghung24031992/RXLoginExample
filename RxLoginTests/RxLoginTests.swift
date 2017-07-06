//
//  RxLoginTests.swift
//  RxLoginTests
//
//  Created by Dang'S on 7/4/17.
//  Copyright © 2017 OMI. All rights reserved.
//

import XCTest
@testable import RxLogin

class RxLoginTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func testExample() {
        let strings:[Int] = [0,1,2,3]
        let bools = strings.map{
            "\($0)"
        }
        print(bools)
    }
    
}
