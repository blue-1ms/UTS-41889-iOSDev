/*
 Collections - Dictionary
 Dictionary are useful to store Key-Value pair
 */
// Declare a Dictionary variable named `game` with
// - A String variable named `playerName`
// - A Double variable named `currentHighScore`
// - A Int varialbe named `numberOfBubbles`
var game = [
    "playerName": "Jack",
    "currentHighScore": 95.5,
    "numberOfBubbles": 15
] as [String : Any];
print(game)

var game1: [String : Any] = [
    "playerName": "Jack",
    "currentHighScore": 95.5,
    "numberOfBubbles": 15
]
print(game1)

// Access the properties from Dictionary
let playerName = game["playerName"] as? String; // Access the value, by ["keyName"]

// Updating the properties in the Dictonary
game["currentHighScore"] = 100.0
print("New High Score \(String(describing: game["currentHighScore"]))")
