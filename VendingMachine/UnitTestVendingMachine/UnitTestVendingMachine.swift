//
//  UnitTestVendingMachine.swift
//  UnitTestVendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class UnitTestVendingMachine: XCTestCase {

    func test_자판기_음료수_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(Beverage(brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유",
                                 manufactureDate: formatter.date(from: "20161009") ?? Date()))
    }

    func test_자판기_우유_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(Milk(brand: "서울우유", weight: 200, price: 1000, name: "날마다흰우유",
                             manufactureDate: formatter.date(from: "20171012") ?? Date()))
    }

    func test_자판기_우유_유통기한_값확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let justMilk = Milk(brand: "서울우유", weight: 100, price: 1200, name: "서울하얀우유",
                            manufactureDate: formatter.date(from: "20171015") ?? Date())
        XCTAssertFalse(justMilk.isOverExpirationDate())
    }

    func test_자판기_우유_유통기한_메소드_확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let justMilk = Milk(brand: "서울우유", weight: 100, price: 1200, name: "서울하얀우유",
                            manufactureDate: formatter.date(from: "20171015") ?? Date())
        XCTAssertFalse(justMilk.isOverExpirationDate())
    }

    func test_자판기_소다_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(Soda(brand: "칠성", weight: 300, price: 1500, name: "별사이다",
                             manufactureDate: formatter.date(from: "20171211") ?? Date()))
    }

    func test_자판기_소다_당류_메소드_확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let sprite = Sprite(brand: "코카콜라", weight: 100, price: 1200, name: "스프라이트",
                            manufactureDate: formatter.date(from: "20180101") ?? Date(), flavoringSyrups: "coco")
        XCTAssertTrue(sprite.isSweet())
    }

    func test_자판기_커피_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(Coffee(brand: "맥심", weight: 500, price: 4000, name: "더좋은커피",
                               manufactureDate: formatter.date(from: "20171225") ?? Date()))
    }

    func test_자판기_커피_카페인_값확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let goodCoffee = Coffee(brand: "맥심", weight: 500, price: 4000, name: "원두커피",
                                manufactureDate: formatter.date(from: "20180103") ?? Date())
        XCTAssertTrue(goodCoffee.isModerateCaffeine())
    }

    func test_자판기_커피_카페인_함유량이_높은지_확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let goodCoffee = Coffee(brand: "맥심", weight: 500, price: 4000, name: "원두커피",
                                manufactureDate: formatter.date(from: "20180103") ?? Date())
        XCTAssertTrue(goodCoffee.isRichCaffeine())
    }

    func test_자판기_딸기우유_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(StrawberryMilk(brand: "서울우유", weight: 100, price: 1200, name: "서울딸기우유",
                        manufactureDate: formatter.date(from: "20171015") ?? Date(), strawberrySyrup: 5))
    }

    func test_자판기_딸기우유_시럽함유량_값확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let strawberry = StrawberryMilk(brand: "서울우유", weight: 100, price: 1200, name: "서울딸기우유",
                         manufactureDate: formatter.date(from: "20171015") ?? Date(), strawberrySyrup: 5)
        XCTAssertTrue(strawberry.isModerateSyrup())
    }

    func test_자판기_딸기우유_단맛인지_메소드_확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let strawberry = StrawberryMilk(brand: "서울우유", weight: 100, price: 1200, name: "서울딸기우유",
                         manufactureDate: formatter.date(from: "20171015") ?? Date(), strawberrySyrup: 5)
        XCTAssertTrue(strawberry.quantityOfstrawberrySyrup() == 5)
    }

    func test_자판기_초코우유_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(ChocoMilk(brand: "매일우유", weight: 100, price: 1300, name: "매일초코우유",
                                  manufactureDate: formatter.date(from: "20171016") ?? Date(), cocoaPower: 2.0))
    }

    func test_자판기_초코우유_진한초코인지_메소드_확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let chocoMilk = ChocoMilk(brand: "매일우유", weight: 100, price: 1300, name: "매일초코우유",
                                  manufactureDate: formatter.date(from: "20171016") ?? Date(), cocoaPower: 2.0)
        XCTAssertFalse(chocoMilk.isDarkChocolate())
    }

    func test_자판기_바나나우유_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(BananaMilk(brand: "빙그레우유", weight: 100, price: 1500, name: "빙그레바나나우유",
                                   manufactureDate: formatter.date(from: "20171017") ?? Date(), bananaSyrup: 5))
    }

    func test_자판기_바나나우유_바나나시럽함유량_메소드_확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let bananaMilk = BananaMilk(brand: "빙그레우유", weight: 100, price: 1500, name: "빙그레바나나우유",
                                    manufactureDate: formatter.date(from: "20171017") ?? Date(), bananaSyrup: 5)
        XCTAssertTrue(bananaMilk.quantityOfBananaSyrup() == 5)
    }

    func test_자판기_콜라_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(Coke(brand: "코카콜라", weight: 300, price: 2000, name: "코카콜라",
                             manufactureDate: formatter.date(from: "20180102") ?? Date(), calorie: 110))
    }

    func test_자판기_콜라_칼로리가_낮은지_확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let cokacola = Coke(brand: "코카콜라", weight: 300, price: 2200, name: "코코콜라",
                            manufactureDate: formatter.date(from: "20180103") ?? Date(), calorie: 110)
        XCTAssertFalse(cokacola.isLowCalorie())
    }

    func test_자판기_사이다_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(Sprite(brand: "칠성", weight: 300, price: 2000, name: "맛있는사이다",
                               manufactureDate: formatter.date(from: "20180102") ?? Date(), flavoringSyrups: "레몬라임향"))
    }

    func test_자판기_사이다_향첨가_레몬라임향인지_종류확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let cilsungCidar = Sprite(brand: "칠성", weight: 300, price: 2500, name: "달지않은사이다",
                    manufactureDate: formatter.date(from: "20180103") ?? Date(), flavoringSyrups: "스파이시향")
        XCTAssertFalse(cilsungCidar.isLemonLimeFlavor())
    }

    func test_자판기_환타_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(Fanta(brand: "코카콜라", weight: 300, price: 2000, name: "환타",
                              manufactureDate: formatter.date(from: "20180104") ?? Date(), materials: "paper"))
    }

    func test_자판기_환타_캔재질이_알루미늄인지_확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let somiFanta = Fanta(brand: "코카콜라", weight: 300, price: 2500, name: "소미환타",
                              manufactureDate: formatter.date(from: "20180104") ?? Date(), materials: "plastic")
        XCTAssertFalse(somiFanta.isAluminumCan())
    }

    func test_자판기_조지아_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(Georgia(brand: "조지아", weight: 300, price: 2000, name: "고티카",
                                manufactureDate: formatter.date(from: "20180107") ?? Date(), coffeeExtrack: 12.6))
    }

    func test_자판기_조지아_커피추출액량_메소드_확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let maxCoffee = Georgia(brand: "조지아", weight: 300, price: 2500, name: "맥스커피",
                                manufactureDate: formatter.date(from: "20180104") ?? Date(), coffeeExtrack: 20.6)
        XCTAssertTrue(maxCoffee.isRichCaffeine())
    }

    func test_자판기_TOP_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(Top(brand: "맥심", weight: 350, price: 2200, name: "TOP스위트아메리카노",
                            manufactureDate: formatter.date(from: "20180102") ?? Date(), isHotDrink: false))
    }

    func test_자판기_TOP_차가운커피인지_메소드_확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let theBlack = Top(brand: "맥심", weight: 350, price: 2300, name: "TOP더블랙",
                           manufactureDate: formatter.date(from: "20180103") ?? Date(), isHotDrink: false)
        XCTAssertTrue(theBlack.isColdDrink())
    }

    func test_자판기_Kantata_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(Kantata(brand: "롯데칠성", weight: 350, price: 2000, name: "카라멜마끼아또",
                                manufactureDate: formatter.date(from: "20180108") ?? Date(), kindOfBeans: "Columbia"))
    }

    func test_자판기_Kantata_원두종류가_구테말라인지_확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let dutchBlack = Kantata(brand: "롯데칠성", weight: 350, price: 2100, name: "더치블랙",
                                 manufactureDate: formatter.date(from: "20180109") ?? Date(), kindOfBeans: "KenyaAA")
        XCTAssertFalse(dutchBlack.isGuatemalaBeans())
    }

    func test_자판기_통합테스트시나리오로_동작_확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"

        // 재고 생성
        let strawberryMilk: Beverage = StrawberryMilk(brand: "서울우유", weight: 200, price: 1000,
                    name: "날마다딸기우유", manufactureDate: formatter.date(from: "20171009") ?? Date(),
                    strawberrySyrup: 5)
        let bananaMilk = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유",
                    manufactureDate: formatter.date(from: "20171012") ?? Date(), bananaSyrup: 3)
        let coke = Coke(brand: "팹시", weight: 350, price: 2000, name: "다이어트콜라",
                    manufactureDate: formatter.date(from: "20171005") ?? Date(), calorie: 25)
        let coffee = Top(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노",
                    manufactureDate: formatter.date(from: "20171010") ?? Date(), isHotDrink: false)

        // 재고 추가
        var vendingMachine = VendingMachine()
        vendingMachine.addInInventory(beverageName: strawberryMilk, number: 1)
        vendingMachine.addInInventory(beverageName: bananaMilk, number: 1)
        vendingMachine.addInInventory(beverageName: coke, number: 1)
        vendingMachine.addInInventory(beverageName: strawberryMilk, number: 2)
        vendingMachine.addInInventory(beverageName: coffee, number: 1)

        // 재고 확인

        // 잔액 추가 확인
        vendingMachine.putCoins(coins: 2000)

        // 어떤 상품 구매가능한지, 불가능인지 확인
        let beverage = vendingMachine.listOfDrinksAvailable()
        XCTAssertTrue(beverage.keys.contains(ObjectIdentifier(type(of: strawberryMilk))))
        XCTAssertTrue(beverage.keys.contains(ObjectIdentifier(type(of: bananaMilk))))
        XCTAssertTrue(beverage.keys.contains(ObjectIdentifier(type(of: coke))))
        XCTAssertFalse(beverage.keys.contains(ObjectIdentifier(type(of: coffee))))

        // 가능한 상품 구매하고
        vendingMachine.buyBeverage(beverageKey: ObjectIdentifier(type(of: strawberryMilk)))
        XCTAssertTrue(beverage.keys.count == 3)

        // 잔액 바뀌고
        vendingMachine.putCoins(coins: 10000)
        XCTAssertFalse(vendingMachine.coins == 2000)

        // 재고 상태 바뀌고,
        XCTAssertNotEqual(vendingMachine.showEntireInventory().values.count, 6)

        ///구매 상품 이력을 확인한다.
        XCTAssertNotNil(vendingMachine.listOfDrinksAvailable())
    }
    
}
