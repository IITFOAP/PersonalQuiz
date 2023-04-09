//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Рома Баранов on 07.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var animalLable: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    // MARK: -  Public properties
    var answersChosen: [Answer]!
    
    // MARK: - Private properties
    private var animalType: [Animal: Int] = [:]
    
    // MARK: - View Life Sycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton.toggle()
        definesTheAnimal()
    }
    
    // MARK: - IB Actions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
}

// MARK: - Refreshes screen data
private extension ResultViewController {
    func definesTheAnimal() {
        for answer in answersChosen {
            if let count = animalType[answer.animal] {
                animalType[answer.animal] = count + 1
            } else {
                animalType[answer.animal] = 1
            }
        }
        
        if let mostCommonAnimal = animalType.max(by: { $0.1 < $1.1 })?.key {
            animalLable.text = "В - \(mostCommonAnimal.rawValue)"
            descriptionLabel.text = "\(mostCommonAnimal.definition)"
        }
    }
}
