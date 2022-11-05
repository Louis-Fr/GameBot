
import Foundation

func launchGame() {
    let bot1 = Bot()
    
    bot1.health = 100
    bot1.strength = 1
    
    let player1 = Player()
    
    player1.health = 100
    player1.strenght = 1
    
    print("Votre pseudo :")
    let nameUser = Utilisateur.saisirTexte()
    player1.nickname = nameUser
    
    var count = 0
    while bot1.health > 0 && player1.health > 0 {
        
        print("\(nameUser) appuyez sur Entrée pour tirer au sort le joueur qui débutera")
        _ = Utilisateur.saisirTexte()
        
        print("\(player1.nickname) lance le dè")
        let launchPlayer = startGamePlayer()
        print("\(bot1.nickname) lance le dè")
        let launchBot = startGameBot()
        
        print()
        
        if launchPlayer == launchBot {
            
            print("Egalité relancer le dès")
            
            
        } else if launchBot > launchPlayer {
            if bot1.health > 0 {
                print("\(bot1.nickname) commence")
                attack(from: bot1, to: player1)
                display(player: player1)
                print()
                attack(from: player1, to: bot1)
                display(bot: bot1)
            }
           
        } else if launchPlayer > launchBot {
            if player1.health > 0 {
                print("\(player1.nickname) commence")
                attack(from: player1, to: bot1)
                display(bot: bot1)
                print()
                attack(from: bot1, to: player1)
                display(player: player1)
            }
        }
        
        count += 1
        print("Fin du tour \(count)")
        print()
        
    }
    
    if player1.health > bot1.health {
        print("\(player1.nickname) à Gagné")
    } else if bot1.health > player1.health {
        print("\(bot1.nickname) à Gagné")
    }
 
 
    func attack(from player: Player, to bot: Bot) {
        let attackPlayer = rollDices(name: player1.nickname)
        bot1.health = bot1.health - attackPlayer
        print("\(player1.nickname) a attaqué \(bot1.nickname) de \(attackPlayer)")
    }
    
    func attack(from bot: Bot, to player: Player) {
        let attackBot = rollDices(name: "\(bot1.nickname)")
        player1.health = player1.health - attackBot
        print("\(bot1.nickname) a attaqué \(player1.nickname) de \(attackBot)")
    }
    
    func display(bot: Bot){
        print("\(bot1.nickname) a \(bot1.health) point de vie et une force de \(bot1.strength)")
    }
    
    func display(player: Player) {
        print("\(player1.nickname) a \(player1.health) point de vie et une force de \(player1.strenght)")
        
    }
    
   
    func rollDices(name: String) -> Int {
        let rollDice = Int.random(in: 1...6) + Int.random(in: 1...6)
        return rollDice
    }
    
    func startGamePlayer() -> Int {
        let rollDice = Int.random(in: 1...6)
        print("\(rollDice)")
        return rollDice
    }
    
    func startGameBot() -> Int {
        let rollDice = Int.random(in: 1...6)
        print("\(rollDice)")
        return rollDice
    }
}
    
 launchGame()


