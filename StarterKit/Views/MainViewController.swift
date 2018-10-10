//
//  ViewController.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 25/09/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import UIKit
import ReSwift
import Firebase
import CoreLocation

class MainViewController: UIViewController, StoreSubscriber {

    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var labelMain: UILabel!
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.subscribe(self)

        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func newState(state: AppState) {
        labelMain.text = "Welcome: \(state.auth.currentUser?.displayName ?? "User")"
    }

    @IBAction func onLogout(_ sender: Any) {
        store.dispatch(AuthEffects.logout())
        dismiss(animated: false)
    }
    
    func group(text: String, pattern: String, index: Int) -> Range<String.Index>? {
        let regex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let matches = regex.matches(in: text, options: [], range: NSMakeRange(0, text.count))
        
        if let match = matches.first {
            let range = match.range(at: index)
            return Range(range, in: text)
        }
        
        return nil
    }
    
    func bonFiscal(text: String) -> Int {
        let pattern = "bon fiscal nr:. *([0-9]+)"
        let range = self.group(text: text, pattern: pattern, index: 1)
        
        if (range != nil) {
            return Int(text[range!]) ?? 0
        }
        
        return 0
    }
    
    func codFiscal(text: String) -> String? {
        let pattern = "cod fiscal:. *([0-9]+)"
        let range = self.group(text: text, pattern: pattern, index: 1)
        
        if (range != nil) {
            return String(text[range!])
        }
        
        return nil
    }
    
//    func scanReceipt() {
//        guard let uiImage = UIImage(named: "receipt4") else {
//            return
//        }
//
//        let vision = Vision.vision()
//        let textRecognizer = vision.onDeviceTextRecognizer()
//        let image = VisionImage(image: uiImage)
//
//        textRecognizer.process(image) { result, error in
//            guard error == nil else {
//                print(error?.localizedDescription)
//                return
//            }
//
//            let resultText = result!.text
//            print(resultText)
//            let range = self.group(text: resultText, pattern: "tucano coffee", index: 0)
//            let bon = self.bonFiscal(text: resultText)
//            let cod = self.codFiscal(text: resultText)
//
//            if range != nil {
//                print(resultText[range!])
//            }
//
//            print("Bon fiscal: \(bon)")
//            print("Cod fiscal: \(cod)")
//        
//        }
//    }
    
    @IBAction func onScan(_ sender: Any) {
        
        // fiscal nr:\s*([0-9]+)
    }
}

extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let distance = location.distance(from: CLLocation(latitude: 45.756627, longitude: 21.222390))
        print("Distance: ", distance)
    }
}
