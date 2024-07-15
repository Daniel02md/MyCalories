//
//  RouterView.swift
//  MyCalories
//
//  Created by Marcos Bezerra on 09/07/24.
//
import SwiftUI

struct RouterView<Content: View>: View {
    @StateObject var router = AppRouter()
    
    private let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content){
        self.content = content()
        
    }
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            content
                .navigationDestination(for: MCRouterDestination.self) { route in
                    router.view(for: route)
                }
        }
        .environmentObject(router)
    }
}

#Preview {
    RouterView {
        Text("teste")
    }
}

