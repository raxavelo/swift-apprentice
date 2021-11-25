import Foundation

public enum GameCharacterType {
  case elf, giant, wizard
}
public protocol GameCharacter: AnyObject {
  var name: String { get }
  var hitPoints: Int { get set }
  var attackPoints: Int { get }
}

class Elf: GameCharacter {
  let name = "Elf"
  var hitPoints = 3
  let attackPoints = 10
}

class Giant: GameCharacter {
  let name = "Giant"
  var hitPoints = 10
  let attackPoints = 3
}

class Wizard: GameCharacter {
  let name: String = "Wizard"
  var hitPoints: Int = 5
  let attackPoints: Int = 5
}

public struct GameCharacterFactory {
  public static func make(ofType gameCharacter: GameCharacterType) -> GameCharacter {
    switch gameCharacter {
    case .elf:
      return Elf()
    case .giant:
      return Giant()
    case .wizard:
      return Wizard()
    }
  }
}

public func battle(_ character1: GameCharacter, vs character2: GameCharacter) {
  
  if character1 === character2 {
    print("\(character1.name) can't fight with himself. :P")
    return
  }
  
  if character1.hitPoints <= 0 {
    print("\(character1.name) is dead. He can't fight.")
    return
  }
  
  if character2.hitPoints <= 0 {
    print("\(character2.name) is already defeated.")
    return
  }
  
  character2.hitPoints -= character1.attackPoints
  
  if character2.hitPoints <= 0 {
    print("\(character2.name) defeated!")
    return
  }
  
  character1.hitPoints -= character2.attackPoints
  
  if character2.hitPoints <= 0 {
    print("\(character1.name) defeated!")
  } else {
    print("Both players still alive.")
  }
}
