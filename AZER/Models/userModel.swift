//
//  userModel.swift
//  AZER
//
//  Created by Gehad Eid on 05/12/2023.

import SwiftUI
import Foundation

//struct Room: Codable, Hashable {
//    var name: String
//    var description: String
//    var people: [String]
//    var challenge: String
//    var time: TimeInterval
//
//    private var timer: Timer?
//
//    mutating func startTimer() {
//        guard timer == nil else {
//            return // Timer already running
//        }
//
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak room = self] timer in
//            guard let room = room else {
//                timer.invalidate()
//                return
//            }
//
//            if room.time <= 0 {
//                timer.invalidate()
//            } else {
//                // Access the local variable 'room' to modify 'time'
//                var updatedRoom = room
//                updatedRoom.time -= 1
//                self = updatedRoom
//            }
//        }
//    }
//
//    mutating func stopTimer() {
//        timer?.invalidate()
//        timer = nil
//    }
//
//    func remainingTime() -> TimeInterval {
//        return time
//    }
//}

struct Room: Codable, Hashable {
    var name: String
    var description: String
    var people: [String]
    var challenge: String
}

struct User: Codable {
    var username: String
    var email: String
    var password: String
    var days: Int
    var moods: [Int]
    var rooms: [Room]
    var friends: [String]

    init(username: String, email: String, password: String, days: Int = 0, moods: [Int] = [], rooms: [Room] = [], friends: [String] = []) {
        self.username = username
        self.email = email
        self.password = password
        self.days = days
        self.moods = moods
        self.rooms = rooms
        self.friends = friends
    }
}

class UserModel: ObservableObject {
    @AppStorage("AUTH_KEY") var authenticated = true {
           willSet { objectWillChange.send() }
       }
       
       @AppStorage("USER_KEY") var currentUserIndex = 0
       @Published var users: [User] = []
       
    init() {
        let sampleUser = User(
            username: "SampleUser",
            email: "sample@example.com",
            password: "password",
            days: 11,
            moods: [1, 2, 3, 4, 5, 0, 4], // Example moods array
            rooms: [
                Room(name: "Room1", description: "Room 1 Description", people: [], challenge: "Challenge 1"),
                Room(name: "Room2", description: "Room 2 Description", people: [], challenge: "Challenge 2")
            ],
            friends: ["Friend1", "Friend2"]
        )
        
        // Appending the sample user to the users array
        self.users.append(sampleUser)
        
        // Save updated users array to UserDefaults
        saveUsers()
        
        // Load users from UserDefaults on initialization
        loadUsers()
        
        // Debugging - Print the loaded users and their count
        print("Loaded users: \(users)")
        print("Users count: \(users.count)")
    }
    
    func authenticate(username: String, password: String) {
        guard let user = users.first(where: { $0.username.lowercased() == username.lowercased() }) else {
            print("Invalid username")
            return
        }
        
        if password == user.password {
            if let index = users.firstIndex(where: { $0.username.lowercased() == username.lowercased() }) {
                currentUserIndex = index
                authenticated = true
            }
        } else {
            print("Invalid password")
            return
        }
    }
    
    func loadUsers() {
        if let storedUsers = UserDefaults.standard.data(forKey: "USERS_KEY") {
            let decoder = JSONDecoder()
            if let decodedUsers = try? decoder.decode([User].self, from: storedUsers) {
                self.users = decodedUsers
            }
        }
    }
        
    // Function to save users to UserDefaults
    func saveUsers() {
        let encoder = JSONEncoder()
        if let encodedUsers = try? encoder.encode(users) {
            UserDefaults.standard.set(encodedUsers, forKey: "USERS_KEY")
        }
    }

        // Function to add a new user to the users array and save it
    func addUser(username: String, email: String, password: String) {
        let newUser = User(username: username, email: email, password: password)
        users.append(newUser)
        saveUsers() // Save the updated users array to UserDefaults
    }
        
//    func addUser(username: String, email: String, password: String) {
//        let newUser = User(username: username, email: email, password: password)
//        users.append(newUser)
//        
//        // Save updated users array to UserDefaults
//        let encoder = JSONEncoder()
//        if let encodedUsers = try? encoder.encode(users) {
//            UserDefaults.standard.set(encodedUsers, forKey: "USERS_KEY")
//        }
//        
//        // Debugging
//        print("Currently logged on: \(authenticated)")
//        print("Users: \(users)")
//    }
    
//    func saveUsers() {
//        let encoder = JSONEncoder()
//        if let encodedUsers = try? encoder.encode(users) {
//            UserDefaults.standard.set(encodedUsers, forKey: "USERS_KEY")
//        }
//    }
    
    // Function to get the username of the current user
    func getCurrentUsername() -> String? {
        guard currentUserIndex >= 0, currentUserIndex < users.count else {
            // Return nil if the current user index is out of bounds
            return nil
        }
        
        let currentUsername = users[currentUserIndex].username
        return currentUsername
    }
    
    // Function to get the email of the current user
    func getCurrentUserEmail() -> String? {
        guard currentUserIndex >= 0, currentUserIndex < users.count else {
            // Return nil if the current user index is out of bounds
            return nil
        }
        
        let currentUserEmail = users[currentUserIndex].email
        return currentUserEmail
    }
    
    // Function to get the last 6 elements of the userArray of the current user
    func getLastSixElementsOfCurrentUserArray() -> [Int] {
        guard currentUserIndex >= 0, currentUserIndex < users.count else {
            // Return an empty array if the current user index is out of bounds
            return []
        }
        
        let currentArray = users[currentUserIndex].moods
        
        if currentArray.count >= 6 {
            // Return the last 6 elements if available
            return Array(currentArray.suffix(6))
        } else {
            // Return all elements if there are less than 6
            return currentArray
        }
    }
    
    // Function to get the days of the current user
    func getCurrentUserDays() -> Int? {
        guard currentUserIndex >= 0, currentUserIndex < users.count else {
            // Return nil if the current user index is out of bounds
            return nil
        }
        
        let currentUserDays = users[currentUserIndex].days
        return currentUserDays
    }
    
    func logOut() {
        authenticated = false
    }
}
