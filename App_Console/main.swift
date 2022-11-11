
import Foundation

func launchGame() {
    
    let bot1 = Bot()
    let player1 = Player()
    
    print("Votre pseudo :")
    let nameUser = Utilisateur.saisirTexte()
    player1.nickname = nameUser
    
    var countBot = 0
    if player1.isAlive {
        
        // function max qui va retourner la valeur la plus élevée des 2
        bot1.strenght = max(1, player1.strenght-1)
        print("\(bot1.nickname) a une force de : \(bot1.strenght)")
        
        var count = 0
        while bot1.health > 0 && player1.health > 0 {
            
            
            print("\(nameUser) appuyez sur Entrée pour tirer au sort le joueur qui débutera")
            _ = Utilisateur.saisirTexte()
            
            
            var launchTurn = Bool.random()
            print("\(launchTurn)")
            if launchTurn {
                print("\(player1.nickname) commence")
            } else {
                print("Le \(bot1.nickname) commence")
            }
            
            if launchTurn == true {
                player1.attack(bot:bot1)
                bot1.display()
                
            } else {
                bot1.attack(player:player1)
                player1.display()
            }
            launchTurn.toggle()
            
            
            count += 1
            print("Fin du tour \(count)")
            
            print()
            
        }
        
        if player1.health > bot1.health {
            player1.didWin(against: bot1)
            print("\(player1.nickname) à Gagné")
            countBot += 1
            print("Nombre de bots vaincus \(countBot)")
            
        } else if bot1.health > player1.health {
            bot1.didWin(against: player1)
            print("\(bot1.nickname) à Gagné")
        }
    }
 
    
   
}
    
  


