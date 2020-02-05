import XCTest

import testfolderTests

var tests = [XCTestCaseEntry]()
tests += testfolderTests.allTests()
XCTMain(tests)
