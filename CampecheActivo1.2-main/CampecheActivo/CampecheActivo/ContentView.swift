//
//  ContentView.swift
//  CampecheActivo
//
//  Created by Alumno 13 on 07/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0

    init() {
        // --- APARIENCIA GLOBAL ---
        UITabBar.appearance().backgroundColor = UIColor(named: "appBlancoTarjeta")
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            
            // --- PESTAÑA 1: RUTAS ---
            Text("Aquí irá RutasView") // Temporal
                RutasView()
                .tabItem {
                    TabItemView(
                        imageName: "map",
                        title: "Rutas",
                        isSelected: selectedTab == 0
                    )
                }
                .tag(0)
            
            // --- PESTAÑA 2: RETOS ---
            Text("Aquí irá RetosView") // Temporal
                RetosView()
                .tabItem {
                    TabItemView(
                        imageName: "flag.checkered", // Reemplaza con tu ícono
                        title: "Retos",
                        isSelected: selectedTab == 1
                    )
                }
                .tag(1)

            // --- PESTAÑA 3: PREMIOS ---
            Text("Aquí irá PremiosView") // Temporal
                PremiosView()
                .tabItem {
                    TabItemView(
                        imageName: "trophy",
                        title: "Premios",
                        isSelected: selectedTab == 2
                    )
                }
                .tag(2)

            // --- PESTAÑA 4: PERFIL ---
            Text("Aquí irá PerfilView") // Temporal
                PerfilView()
                .tabItem {
                    TabItemView(
                        imageName: "person",
                        title: "Perfil",
                        isSelected: selectedTab == 3
                    )
                }
                .tag(3)
        }
        .accentColor(.appNaranjaPrincipal)
    }
}

// --- VISTA PERSONALIZADA PARA EL BOTÓN DEL TAB ---
struct TabItemView: View {
    let imageName: String
    let title: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: imageName)
                .font(.system(size: 22))
            
            Text(title)
                .font(.system(size: 10, weight: .medium))
        }
        .padding(.top, 8)
        .padding(.horizontal, 12)
        .background(isSelected ? Color.appNaranjaTab : Color.clear)
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
