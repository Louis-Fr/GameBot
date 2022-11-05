
import Foundation

class Math {
    static func nombreAleatoire(comprisEntre min:Int, et max:Int) ->Int {
        return Int(arc4random_uniform(UInt32(max + 1)) + UInt32(min))
    }
}
