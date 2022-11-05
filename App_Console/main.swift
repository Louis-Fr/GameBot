
import Foundation

func launchGame() {
    let bot1 = Bot()
    
    bot1.health = 100
    bot1.strength = 1
    
    print("Votre pseudo :")
    let nameUser = Utilisateur.saisirTexte()
    
    var count = 0
    while bot1.health > 0
    {
        count += 1
        //var nbTour: Int = 0
        print("\(nameUser), appuyez sur Entrée pour lancer les dés")
        _ = Utilisateur.saisirTexte()
        let dicesValues = rollDices(name: nameUser)
        bot1.health = bot1.health - dicesValues
        print("\(nameUser) assène un coup sur le bot de \(dicesValues)")
        print("Le bot a \(bot1.health) % de vie.")
        print("Fin du tour : \(count)")
        print()
    }
}

launchGame()


func rollDices(name: String) -> Int {
    let rollDice = Int.random(in: 1...6) + Int.random(in: 1...6)
    print("\(name) a lancé les dés... \(rollDice)")
    return rollDice
    
}
