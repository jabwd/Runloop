import XCTest

import RunloopTests

var tests = [XCTestCaseEntry]()
tests += RunloopTests.allTests()
XCTMain(tests)
