import SwiftUI

struct ContentView: View {
    // State değişkenleri
    @State private var inputValue = ""
    @State private var fromUnitIndex = 0
    @State private var toUnitIndex = 1

    // Dönüşüm oranları
    let conversionRates: [[Double]] = [
        // Length
        [1.0, 1000.0, 1000000.0, 0.000001, 0.001],
        // Temperature
        [1.0, 273.15, 255.372, 0.000147, 0.555556],
        // Area
        [1.0, 1000000.0, 100000000.0, 0.000001, 10000.0],
        // Volume
        [1.0, 0.264172, 0.000001, 264.172, 1000.0],
        // Mass
        [1.0, 0.001, 0.000001, 0.000984, 1000.0],
        // Data
        [1.0, 0.125, 0.000122, 0.000125, 0.000000125]
    ]

    var body: some View {
        VStack {
            // Giriş alanı
            TextField("Değer girin", text: $inputValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Birim seçimleri
            Picker("Dönüştürülecek birim", selection: $fromUnitIndex) {
                Text("Kilometer").tag(0)
                Text("Celcius").tag(1)
                Text("Square Kilometer").tag(2)
                Text("US Gallon").tag(3)
                Text("Kilogram").tag(4)
                Text("Bit").tag(5)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Picker("Dönüşen birim", selection: $toUnitIndex) {
                Text("Kilometer").tag(0)
                Text("Celcius").tag(1)
                Text("Square Kilometer").tag(2)
                Text("US Gallon").tag(3)
                Text("Kilogram").tag(4)
                Text("Bit").tag(5)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            // Çevir butonu
            Button("Çevir") {
                convertButtonPressed()
            }
            .padding()

            // Sonuç
            Text("Sonuç: \(convertedValue, specifier: "%.4f")")
                .padding()
        }
        .padding()
    }

    // Çevir butonuna basıldığında yapılacak işlemler
    private func convertButtonPressed() {
        guard let inputValue = Double(inputValue) else { return }

        let conversionRate = conversionRates[fromUnitIndex][toUnitIndex]
        convertedValue = inputValue * conversionRate
    }

    // Dönüştürülen değeri saklamak için State değişkeni
    @State private var convertedValue: Double = 0.0
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

