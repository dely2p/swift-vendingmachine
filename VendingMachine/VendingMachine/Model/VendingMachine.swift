//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    private(set) var coins: Int
    private var inventoryBox: InventoryBox
    private let purchaseProductHistory: PurchaseProductHistory
    init() {
        self.coins = 0
        inventoryBox = InventoryBox()
        purchaseProductHistory = PurchaseProductHistory()
    }
    // 자판기 금액을 원하는 금액만큼 올리는 메소드
    mutating func putCoins(coins: Int) {
        self.coins = coins
    }
    
    // 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    func addInInventory(beverageName: Beverage, number: Int) {
        for _ in 0..<number {
            inventoryBox.storageBeverageStock(beverage: beverageName)
        }
    }
    
    func deleteInventory(beverageName: Beverage, number: Int) {
        for _ in 0..<number {
            inventoryBox.deleteBeverageStock(beverage: beverageName)
        }
    }
    
    // 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func listOfDrinksAvailable() -> [ObjectIdentifier: [Beverage]] {
        return inventoryBox.priceLessThan(coins: self.coins)
    }
    
    // 음료수를 구매하는 메소드
    mutating func buyBeverage(beverageKey: ObjectIdentifier) {
        do {
            let beverageOfChoice = try inventoryBox.sellDrink(beverageKey: beverageKey)
            purchaseProductHistory.recordOfPurchaseHistory(date: Date(), beverage: beverageOfChoice.name)
            self.coins -= beverageOfChoice.price
        } catch {
            print("Beverage error")
        }
    }
    
    // 잔액을 확인하는 메소드
    func checkBalance () -> Int {
        return self.coins
    }
    
    // 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func showEntireInventory() -> [ObjectIdentifier: [Beverage]] {
        return inventoryBox.overallProductInventory()
    }
    
    // 유통기한이 지난 재고만 리턴하는 메소드
    func showOutOfStockInventory() -> [Beverage] {
        return inventoryBox.outOfStockInventory()
    }
    
    // 따뜻한 음료만 리턴하는 메소드
    func showHotDrinks() -> [Beverage] {
        return inventoryBox.hotDrinkInventory()
    }
    
    // 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func showPurchaseProductHistory() -> [String] {
        return purchaseProductHistory.historyOfPurchase()
    }
    
    func choiceBeverageData(number: Int) -> Beverage {
        return inventoryBox.numberToInventoryMenu(number: number)
    }
    
}
