
import Foundation

class Bot {
    var nickname: String = "Bot"
    var strenght:Int = 2
    var health:Int = 100
    
    func rollDices(name: String) -> Int {
        let rollDice = Int.random(in: 1...6) + Int.random(in: 1...6)
        return rollDice
    }
    
    func display(){
        print("\(nickname) a \(health) PDV et une force de \(strenght)")
    }
    
    func attack(player: Player) {
        let attackBot = (rollDices(name: nickname) * strenght)
        let hitStrenght = attackBot * strenght
        player.health = player.health - hitStrenght
        print("\(nickname) a attaqué \(player.nickname) de \(hitStrenght)")
    }
    
    func didWin(against player:Player) {
        self.strenght = self.strenght + player.strenght
        print(self.strenght)
    }
}


class Player {
    var nickname: String = ""
    var strenght: Int = 2
    var health: Int = 100
    
    /*
    init(nickname: String, strenght: Int, health: Int) {
        self.nickname = nickname
        self.strenght = strenght
        self.health = health
    }
    */
    
    var isAlive: Bool { health > 0 }
    
    func rollDices(name: String) -> Int {
        let rollDice = Int.random(in: 1...6) + Int.random(in: 1...6)
        return rollDice
    }
    
    func display() {
        print("\(nickname) a \(health) point de vie et une force de \(strenght)")
    }
    
    func rollDice() -> Int {
        let rollDice = Int.random(in: 1...6)
        return rollDice
    }
    
    func WinGame() -> Int {
        strenght = strenght + rollDice()
        return self.strenght
    }
    
    func attack(bot: Bot) {
        let attackPlayer = (rollDices(name:nickname))
        let hitStrenght = attackPlayer * strenght
        bot.health = bot.health - hitStrenght
        print("\(nickname) a attaqué \(bot.nickname) de \(hitStrenght)")
    }
    
    func didWin(against bot:Bot) {
        self.strenght = self.strenght + bot.strenght
        raiseHealt(factor: 1.4)
    }
    
    func raiseHealt(factor: Double) {
        guard factor > 1 else {
            return
        }
        let newHealth = Int(Double(self.health) * factor)
        // function min qui va retourner la valeur la moins elevée des 2
        self.health = min(newHealth, 100)
    }
}





