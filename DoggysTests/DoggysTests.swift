//
//  DoggysTests.swift
//  DoggysTests
//
//  Created by Pablo Márquez Marín on 21/3/24.
//

import XCTest
@testable import Doggys
import SwiftUI

final class DoggysTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: - Test Models -
    func testModelUser() throws {
        let user1 = User(id: "123456abcde",
                         email: "doggys@doggys.com",
                         password: "unknown")
        
        XCTAssertEqual(user1.id, "123456abcde")
        XCTAssertEqual(user1.email, "doggys@doggys.com")
        XCTAssertEqual(user1.password, "unknown")
    }
    
    func testModelDogBreed() throws {
        XCTAssertNotNil(DogBreed.beagle)
        XCTAssertEqual(DogBreed.akita.description, "Akita")
    }
    
    func testDogGender() throws {
        XCTAssertNotNil(DogGender.female)
        XCTAssertEqual(DogGender.female.description, "Hembra")
    }
    
    func testWalkLong() throws {
        XCTAssertNotNil(DogWalkLong.long)
        XCTAssertEqual(DogWalkLong.medium.description, "Paseo Medio / 40min Aprox.")
    }
    
    func testDogFriendly() throws {
        XCTAssertNotNil(DogFriendly.yes)
        XCTAssertEqual(DogFriendly.no.description, "No")
    }
    
    func testMarkerMap() throws {
        let mocksMap = MapViewDataManager()
        var mapsMarker = mocksMap.mockUsersData
        
        XCTAssertEqual(mapsMarker.first?.name, "Rosco")
        XCTAssertEqual(mapsMarker.first?.coordinate.latitude, 40.411964)
    }
    
    func testUserProfile() throws {
        let userProfile1 = UserProfile(id: "789456789",
                                       imageProfile: "perro",
                                       humanName: "Marco",
                                       dogName: "perrito",
                                       dogYears: "4",
                                       dogBreed: DogBreed.boxer,
                                       dogGender: DogGender.male,
                                       dogWalk: DogWalkLong.veryLong,
                                       dogFriendly: DogFriendly.yesFemale)
        
        XCTAssertEqual(userProfile1.dogBreed, DogBreed.boxer)
        XCTAssertEqual(userProfile1.dogYears, "4")
    }
    
    // MARK: - Testing Views -
    func testLoginView() throws {
        let main = LoginWireFrame().viewController
        XCTAssertNotNil(main)
    }
    
    func testSplashView() throws {
        let splashw = SplashWireFrame().viewController
        XCTAssertNotNil(splashw)
    }
    
    func testMapView() throws {
        let mapInit = MapViewWireFrame().viewController
        XCTAssertNotNil(mapInit)
    }
    
    func testProfile() throws {
        let profile = ProfileWireFrame().viewController
        XCTAssertNotNil(profile)
    }
    
    func testRegister() throws {
        let register = RegisterWireFrame()
        XCTAssertNotNil(register)
        
    }
    
    func testRecovery() throws {
        let recovery = RecoveryWireFrame()
        XCTAssertNotNil(recovery)
        
    }
    
    func testSettings() throws {
        let settings = SettingsWireframe()
        XCTAssertNotNil(settings)
        
    }
    
    // MARK: - Testing components -
    func testComponents() throws {
        let mapMarker = MapMarkerIcon(name: "test")
        XCTAssertNotNil(mapMarker.body)
        XCTAssertEqual(mapMarker.name, "test")
    }
    
    func testLogo() throws {
        let logo = LogoHeader(text: "Login")
        XCTAssertNotNil(logo.body)
        XCTAssertEqual(logo.text, "Login")
    }
    
    func testLogoTitleHeader() throws {
        let header = TextTitleHeader()
        XCTAssertNotNil(header.body)
    }
    
    func testRecoveryText() throws {
        let rec = RecoveryText()
        XCTAssertNotNil(rec.body)
    }
    
    func testRegisterText() throws {
        let register = RegisterText()
        XCTAssertNotNil(register.body)
    }
    
    func testButtonLabel() throws {
        let button = ButtonLabel(word: "test")
        XCTAssertNotNil(button.body)
        XCTAssertEqual(button.word, "test")
    }
}
