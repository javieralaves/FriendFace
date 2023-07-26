//
//  ContentView.swift
//  FriendFace
//
//  Created by Javier Alaves on 26/7/23.
//

import SwiftUI

struct Users: Codable {
    var users: [User]
}

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        List(users, id: \.id) { user in
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.headline)
                Text(user.isActive ? "Active" : "Inactive")
            }
        }
        .task {
            await fetchUsers()
        }
    }
    
    func fetchUsers() async {
        guard users.isEmpty else { return }
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            users = try decoder.decode([User].self, from: data)
        } catch {
            print("Download failed")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
