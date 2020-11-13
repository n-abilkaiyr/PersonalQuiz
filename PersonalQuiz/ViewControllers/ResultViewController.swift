//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Abilkaiyr Nurzhan on 11/13/20.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var textLabel: UILabel!
    
    // MARK: - Public properities
    var choosenAnswers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        showResult()
        
    }
    
}

// MARK: - Private methods
extension ResultViewController {
    
    private func showResult() {
        let frequenceChoosenAnimal = returnFrequenceAnimalType()
        titleLabel.text = "Вы - \(frequenceChoosenAnimal.rawValue)!"
        textLabel.text = frequenceChoosenAnimal.definition
    }
    
    private func returnFrequenceAnimalType() -> AnimalType {
        var (countOfDog,
             countOfCat,
             countOfRabbit,
             countOfTurtle)  = (0, 0, 0, 0)
        
        for answer in choosenAnswers {
            switch answer.type {
            case .dog: countOfDog += 1
            case .cat: countOfCat += 1
            case .rabbit: countOfRabbit += 1
            case .turtle: countOfTurtle += 1
            }
        }
        
        guard let maxNumber = [countOfDog, countOfCat, countOfRabbit, countOfTurtle].max()
        else {
            return .dog
        }
        
        switch maxNumber {
        case countOfDog: return .dog
        case countOfCat: return.cat
        case countOfRabbit: return .rabbit
        case countOfTurtle: return .turtle
        default: return .dog
        
    }
        
    }
}
