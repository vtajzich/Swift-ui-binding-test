//
//  Model.swift
//  SwiftUiBindingTest
//
//  Created by Vitek Tajzich on 13.06.2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var level1: Level1 = Level1()
    @Published var root: String = "0"
    
    func updateRoot() {
        
        root = generateRandom()
        
        print("Updated root level, new value: \(root)")
    }
    
    func reassignLevel1() {
        
        let current = level1
        
        self.level1 = Level1()
        
        self.level1 = current
    }
    
    func updateLevel1() {
        
        level1.value = generateRandom()
        
        print("Updated level1, new value: \(level1.value)")
    }
    
    func updateLevel2() {
        
        level1.level2.value = generateRandom()
        
        print("Updated level2, new value: \(level1.level2.value)")
    }
    
    func updateLevel3() {
        
        level1.level2.level3.value = generateRandom()
        
        print("Updated level3, new value: \(level1.level2.level3.value)")
    }
    
    private func generateRandom() -> String {
        return "\(arc4random_uniform(100))"
    }
    
}

class Level1: ObservableObject {
    
    @Published var name: String = "level 1"
    @Published var value: String = "1"
    
    @Published var level2: Level2 = Level2()
}

class Level2: ObservableObject {
    
    @Published var name: String = "level 2"
    @Published var value: String = "2"
    
    @Published var level3: Level3 = Level3()
}

class Level3: ObservableObject {
    
    @Published var name: String = "level 3"
    @Published var value: String = "3"
}
