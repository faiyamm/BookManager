//
//  SettingsView.swift
//  BookManager
//
//  Created by Fai on 26/01/26.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage(SETTINGS_THEME_KEY) private var currentTheme: Theme = DEFAULT_SETTINGS_THEME_VALUE
    @AppStorage(FAVORITE_GRID_COLUMNS_KEY) private var numberOfColumns: Int = FAVORITE_GRID_COLUMNS_KEY_DEFAULT
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Appearance")) {
                    Picker("Theme", selection: $currentTheme) {
                        ForEach(Theme.allCases, id: \.self) { theme in
                            Text(theme.rawValue.capitalized).tag(theme)
                        }
                    }
                }
                
//                Section(header: Text("Display Settings")) {
//                    Stepper("Favorite Section Columns: \(numberOfColumns)", value: $numberOfColumns, in: 1...4)
//                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
