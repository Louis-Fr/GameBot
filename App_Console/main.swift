
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
    

    while bot1.health > 0 && player1.health > 0 {
        
        print("\(nameUser) appuyez sur Entrée pour tirer au sort le joueur qui débutera")
        _ = Utilisateur.saisirTexte()
        
        print("\(player1.nickname) lance le dè")
        let launchPlayer = startGamePlayer()
        print("\(bot1.nickname) lance le dè")
        let botPlayer = startGameBot()
        
        print()
        
        if launchPlayer == botPlayer {
            
            print("Egalité relancer le dès")
            /*print("\(nameUser) appuyez sur Entrée pour tirer au sort le joueur qui débutera")
            _ = Utilisateur.saisirTexte()*/
            
            
        } else if botPlayer > launchPlayer {
            
            print("\(bot1.nickname) commence")
            attackBotPlayer(player: Player(), bot: Bot())
            playerInfo(player: Player())
            print()
            attackPlayerBot(player: Player(), bot: Bot())
            botInfo(bot: Bot())

           
        } else if launchPlayer > botPlayer {
            
            print("\(player1.nickname) commence")
            attackPlayerBot(player: Player(), bot: Bot())
            botInfo(bot: Bot())
            print()
            attackBotPlayer(player: Player(), bot: Bot())
            playerInfo(player: Player())
        
        }
        
        print()
        
    }
    
    if player1.health > bot1.health {
        print("\(player1.nickname) à Gagné")
    } else if bot1.health > player1.health {
        print("bot1.nickname à Gagné")
    }
 
 
    func attackPlayerBot(player: Player, bot: Bot) -> Int {
        let attackPlayer = rollDices(name: player1.nickname)
        bot1.health = bot1.health - attackPlayer
        print("\(player1.nickname) a attaqué \(bot1.nickname) de \(attackPlayer)")
        return attackPlayer
    }
    
    func attackBotPlayer(player: Player, bot: Bot) -> Int {
        let attackBot = rollDices(name: "\(bot1.nickname)")
        player1.health = player1.health - attackBot
        print("\(bot1.nickname) a attaqué \(player1.nickname) de \(attackBot)")
        return attackBot
    }
    
    func botInfo(bot: Bot){
        print("\(bot1.nickname) a \(bot1.health) point de vie et une force de \(bot1.strength)")
    }
    
    func playerInfo(player: Player) {
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


