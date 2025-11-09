//
//  AppColors.swift
//  CampecheActivo
//
//  Created by Alumno 13 on 07/11/25.
//

import SwiftUI

// --- GUÍA DE COLORES ---


extension Color {
    
    // Colores Principales
    static let appNaranjaPrincipal = Color(hex: "F96A00") // Naranja de botones y headers
    static let appNaranjaHeader = Color(hex: "FF5C00") // Gradiente rojo/naranja del header
    static let appNaranjaTab = Color(hex: "FFF0E6") // Fondo del tab seleccionado
    
    // Colores de Fondo
    static let appFondo = Color(hex: "FDF7F3") // Fondo principal de la app (un beige muy claro)
    static let appBlancoTarjeta = Color.white // Fondo de todas las tarjetas

    // Colores de Texto
    static let appTextoPrincipal = Color(hex: "333333") // Para títulos
    static let appTextoSecundario = Color(hex: "555555") // Para descripciones
    static let appTextoGrisClaro = Color(hex: "888888") // Para íconos/texto de estadísticas

    // Colores de Tarjetas de Resumen
    static let appMoradoRetos = Color(hex: "C42DDE") // Tarjeta de Retos
    static let appAmarilloPremios = Color(hex: "FFB800") // Tarjeta de Premios
    static let appMoradoPerfil = Color(hex: "7B30DE") // Tarjeta de Perfil

    // Colores de Etiquetas (Tags)
    static let appTagVerde = Color(hex: "DBFFD0")
    static let appTagVerdeTexto = Color(hex: "388E3C")
    static let appTagAmarillo = Color(hex: "FFF5D0")
    static let appTagAmarilloTexto = Color(hex: "E6A100")
    static let appTagRojo = Color(hex: "FFD0D0")
    static let appTagRojoTexto = Color(hex: "D32F2F")
}


// --- EXTENSIÓN ÚTIL ---
// Esto nos permite crear colores usando códigos HEX (ej. 

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
