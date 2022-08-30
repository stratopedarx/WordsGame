//
//  GameViewModelTests.swift
//  WordsGameTests
//
//  Created by Sergey Lobanov on 30.08.2022.
//

import XCTest
@testable import WordsGame

final class GameViewModelTests: XCTestCase {
    private var sut: GameViewModel!
    private var player1: Player!

    override func setUp() {
        super.setUp()
        let gameWord = "большоеслово"
        var _player1 = Player()
        _player1.name = "sergey"
        _player1.points = 10
        var _player2 = Player()
        self.player1 = _player1
        _player2.name = "max"
        _player2.points = 20
        let players = [_player1, _player2]
        let cacheManagerMock: CacheManagerProtocol = CacheManagerMock()
        let yandexDictAPIMock: YandexDictAPIProtocol = YandexDictAPIMock()
        sut = GameViewModel(gameWord: gameWord, players: players, cacheManager: cacheManagerMock, yandexDictAPI: yandexDictAPIMock)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testInitViewModel() {
        XCTAssertEqual(sut.playerWord, "")
        XCTAssertEqual(sut.placeholderPlayerWord, .initPlaceholder)
        XCTAssertFalse(sut.showCloseAlert)
        XCTAssertFalse(sut.isLoading)
        XCTAssertEqual(sut.wordStatus, .notChecked)
        XCTAssertFalse(sut.showAlertCheckedWord)
        XCTAssertFalse(sut.showAlertRefreshGame)
        XCTAssertEqual(sut.allWordsForCurrentGame.count, 0)
        XCTAssertFalse(sut.isError)
        
        XCTAssertEqual(sut.currentPlayer.name, player1.name)
        XCTAssertEqual(sut.currentPlayer.points, player1.points)
        XCTAssertEqual(sut.gameWord, "большоеслово")
        XCTAssertEqual(sut.players.count, 2)
    }
    
    func testCancelAction() {
        XCTAssertFalse(sut.showCloseAlert)
        sut.cancelAction()
        XCTAssertTrue(sut.showCloseAlert)
    }
    
    func testResetGame() {
        sut.cacheManager.saveCurrentGame()
        XCTAssert(sut.cacheManager.savedGame != nil)
        sut.cacheManager.resetCurrentGame()
        XCTAssert(sut.cacheManager.savedGame == nil)
    }
    
    func testValidate() {
        let testData: [(newWord: String, expectedWord: String)] = [
            (newWord: "", expectedWord: ""),
            (newWord: "111aaa222", expectedWord: "aaa"),
            (newWord: ",.,.aaa!!!", expectedWord: "aaa")
        ]
        
        for data in testData {
            sut.validate(data.newWord)
            XCTAssertEqual(sut.playerWord, data.expectedWord)
        }
    }
}
