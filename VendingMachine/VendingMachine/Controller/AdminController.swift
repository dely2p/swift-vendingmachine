//
//  AdminController.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class AdminController {
    
    static func mode(vendingMachine: VendingMachine) {
        let inputView = InputView()
        let adminOutputView = AdminOutputView()
        var isAdminModeContinue = true
        repeat {
            
            // 전체 재고 출력
            var entireInventory = vendingMachine.showEntireInventory()
            adminOutputView.printBeverageMenu(entireInventory: entireInventory)
            adminOutputView.printInventoryUseMenu()
            
            // 메뉴 입력
            let inputValue = inputView.getMenuInput()
            let choiceBeverage = vendingMachine.choiceBeverageData(number: inputValue[1])
            
            // 메뉴 입력에 따른 분류
            switch inputValue[0] {
                case 1:
                    vendingMachine.addInInventory(beverageName: choiceBeverage, number: inputValue[2])
                    adminOutputView.printAddInventory(choiceBeverage: choiceBeverage, number: inputValue[2])
                case 2:
                    vendingMachine.deleteInventory(beverageName: choiceBeverage, number: inputValue[2])
                    adminOutputView.printDeleteInventory(choiceBeverage: choiceBeverage, number: inputValue[2])
                case -1:
                    isAdminModeContinue = false;
                default: break
            }
            entireInventory = vendingMachine.showEntireInventory()
            adminOutputView.printBeverageMenu(entireInventory: entireInventory)
        } while isAdminModeContinue
    }
}