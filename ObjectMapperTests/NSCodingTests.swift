//
//  NSCodingTests.swift
//  ObjectMapper
//
//  Created by Matt Nichols on 6/23/16.
//  Copyright © 2016 hearst. All rights reserved.
//

import XCTest
import ObjectMapper

class NSCodingTests: XCTestCase {
	private let userData: [String : AnyObject] = [
		"username": "John Doe",
		"identifier": "user8723",
		"photoCount": 13,
		"age": 1227,
		"weight": 123.23,
		"float": Float(123.231),
		"drinker": true,
		"smoker": false,
		"sex": Sex.Female.rawValue,
		"subUser": [
			"identifier": "user8723",
			"drinker": true,
			"age": 17,
			"username": "sub user"
		]
	]

	func testMapCoding() {
		let userMap = Map(mappingType: .FromJSON, JSONDictionary: userData)
		let encodedMap = NSKeyedArchiver.archivedDataWithRootObject(userMap)
		let decodedMap = NSKeyedUnarchiver.unarchiveObjectWithData(encodedMap) as? Map
		XCTAssertNotNil(decodedMap)
		XCTAssert(decodedMap!.JSONDictionary == userMap.JSONDictionary)
	}
}

/// Allow comparision of Swift Dictionaries
private func ==(lhs: [String: AnyObject], rhs: [String: AnyObject] ) -> Bool {
	return NSDictionary(dictionary: lhs).isEqualToDictionary(rhs)
}
