import Foundation

struct User: Codable {
    let name: String
    init(name: String) {
        self.name = name
    }
}

func fetchMultipleUser() async throws -> [User] {
    
    let userIds = [1,2,3,4,5,6,7,8]
    return try await withThrowingTaskGroup { group in
        for id in userIds {
            group.addTask {
                let url = URL(string: "http://www.google.com/user")!
                let (data, _) = try await URLSession.shared.data(from: url)
                return try JSONDecoder().decode(User.self, from: data)
            }
        }
        
        // Collect users
        var users: [User] = []
        for try await user in group {
            users.append(user)
        }
        return users
    }
}
