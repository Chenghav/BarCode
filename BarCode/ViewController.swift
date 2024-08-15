//
//  ViewController.swift
//  BarCode
//
//  Created by Chenghav on 6/8/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var barCodeImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barCodeImage.image = generateQRCode(from: "00020101021229600009khqr@ppcb011311200012730880226Phnom Penh Commercial Bank520459995303840540513.105802KH5911LY CHENGHAO6010PHNOM PENH9917001317108186256066304D5F6")
    }

//    func generateBarcode(from string: String) -> UIImage? {
//        let data = string.data(using: String.Encoding.ascii)
//
//        if let filter = CIFilter(name: "CICode128BarcodeGenerator") {
//            filter.setValue(data, forKey: "inputMessage")
//            let transform = CGAffineTransform(scaleX: 3, y: 3)
//
//            if let output = filter.outputImage?.transformed(by: transform) {
//                return UIImage(ciImage: output)
//            }
//        }
//
//        return nil
//    }
    
//    func generateQRCode(from string: String) -> UIImage? {
//        let data = string.data(using: String.Encoding.ascii)
//
//        if let filter = CIFilter(name: "CIQRCodeGenerator") {
//            filter.setValue(data, forKey: "inputMessage")
//            let transform = CGAffineTransform(scaleX: 3, y: 3)
//
//            if let output = filter.outputImage?.transformed(by: transform) {
//                return UIImage(ciImage: output)
//            }
//        }
//
//        return nil
//    }
    func generateQRCode(from string: String) -> UIImage? {
           let data = string.data(using: .utf8)
           guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
           
           qrFilter.setValue(data, forKey: "inputMessage")
           guard let qrCodeImage = qrFilter.outputImage else { return nil }
           
           let scaleX = UIScreen.main.scale
           let transformedImage = qrCodeImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleX))
           
           return UIImage(ciImage: transformedImage)
       }

}

