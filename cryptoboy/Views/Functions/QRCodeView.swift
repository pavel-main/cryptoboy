//
//  QRCodeView.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    @EnvironmentObject var state: AppState
    @State private var data = ""
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        Form {
            Section(header: Text("Input Message")) {
                HStack {
                    Image(systemName: "terminal")
                    
                    TextEditor(text: $data)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    Button(action: {
                        data = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
            
            if (!data.isEmpty) {
                Section(header: Text("QR Code")) {
                    Image(uiImage: generateQRCode(from: data))
                        .interpolation(.none)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 320, height: 320)
                }
            }

        }
        .modifier(NavigationViewModifier(page: .qrcode))
        .environmentObject(state)
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let bytes = Data(string.utf8)
        filter.setValue(bytes, forKey: "inputMessage")

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView()
            .environmentObject(AppState())
    }
}
