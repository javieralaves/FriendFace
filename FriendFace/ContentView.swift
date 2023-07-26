//
//  ContentView.swift
//  FriendFace
//
//  Created by Javier Alaves on 26/7/23.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        List(users) { user in
            NavigationLink {
                UserView(user: user)
            } label: {
                HStack {
                    Circle()
                        .fill(user.isActive ? .green : .red)
                        .frame(width: 8)
                    Text(user.name)
                }
            }
        }
        .navigationTitle("FriendFace")
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
        NavigationView {
            ContentView()
        }
    }
}
