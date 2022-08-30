//
//  GameTabViewModelTests.swift
//  WordsGameTests
//
//  Created by Sergey Lobanov on 30.08.2022.
//

import XCTest
@testable import WordsGame

class GameTabViewModelTests: XCTestCase {
    private var sut: GameTabViewModel!
    
    override func setUp() {
        super.setUp()
        sut = GameTabViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testInitViewModel() {
        XCTAssertEqual(sut.mainWord, "")
        XCTAssertEqual(sut.players.count, sut.quantityOfPlayers)
        XCTAssertEqual(sut.placeholderNames.count, sut.quantityOfPlayers)
        XCTAssertFalse(sut.isDisabledMinusButton)
        XCTAssertFalse(sut.isDisabledPlusButton)
        XCTAssertFalse(sut.isShowGameView)
        XCTAssertFalse(sut.isError)
        XCTAssertEqual(sut.errorDescription, "")
    }
    
    func testResetState() {
        sut.mainWord = "mainword"
        XCTAssertEqual(sut.players.count, sut.quantityOfPlayers)
        XCTAssertEqual(sut.placeholderNames.count, sut.quantityOfPlayers)
        sut.quantityOfPlayers = 5
        
        sut.resetState()
        XCTAssertEqual(sut.mainWord, "")
        XCTAssertEqual(sut.players.count, sut.quantityOfPlayers)
        XCTAssertEqual(sut.placeholderNames.count, sut.quantityOfPlayers)
    }
    
    func testErrorOnIncrementPlayers() {
        sut.isDisabledMinusButton = true
        sut.quantityOfPlayers = 100
        sut.onIncrementPlayers()
        
        XCTAssertFalse(sut.isDisabledMinusButton)
        XCTAssertTrue(sut.isDisabledPlusButton)
        XCTAssertTrue(sut.isError)
        XCTAssertEqual(sut.errorDescription, Localizable.numberOfPlayersExceeded.localized)
    }
    
    func testSuccsessOnIncrementPlayers() {
        sut.isDisabledMinusButton = true
        let currentQuantityOfPlayers = sut.quantityOfPlayers
        let countOfPlayers = sut.players.count
        let countOfPlaceholderNames = sut.placeholderNames.count
        
        sut.onIncrementPlayers()
        
        XCTAssertFalse(sut.isDisabledMinusButton)
        XCTAssertEqual(sut.quantityOfPlayers, currentQuantityOfPlayers + 1)
        XCTAssertEqual(sut.players.count, countOfPlayers + 1)
        XCTAssertEqual(sut.placeholderNames.count, countOfPlaceholderNames + 1)
    }
    
    func testErrorOnDecrementPlayers() {
        sut.isDisabledPlusButton = true
        sut.quantityOfPlayers = 0
        sut.onDecrementPlayers()
        
        XCTAssertFalse(sut.isDisabledPlusButton)
        XCTAssertTrue(sut.isDisabledMinusButton)
        XCTAssertTrue(sut.isError)
        XCTAssertEqual(sut.errorDescription, Localizable.minimumNumberOfPlayers.localized)
    }
    
    func testSuccsessOnDecrementPlayers() {
        sut.isDisabledMinusButton = true
        let currentQuantityOfPlayers = sut.quantityOfPlayers
        let countOfPlayers = sut.players.count
        let countOfPlaceholderNames = sut.placeholderNames.count
        
        sut.onDecrementPlayers()
        
        XCTAssertFalse(sut.isDisabledPlusButton)
        XCTAssertEqual(sut.quantityOfPlayers, currentQuantityOfPlayers - 1)
        XCTAssertEqual(sut.players.count, countOfPlayers - 1)
        XCTAssertEqual(sut.placeholderNames.count, countOfPlaceholderNames - 1)
    }
}
