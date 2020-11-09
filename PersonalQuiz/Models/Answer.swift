//
//  Answer.swift
//  PersonalQuiz
//
//  Created by Abilkaiyr Nurzhan on 11/9/20.
//

enum  AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравиться быть с друзьями. Вы окружаете себя с людьми, которые вам нравятся и всегда готовы помочь."
        case .cat:
            return "Вы себе на уме. Лююите гулять сами по себе. Вы цените одиночество."
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        case .turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях."
        }
    }

}

struct Answer {
    let text: String
    let type: AnimalType
    
}

