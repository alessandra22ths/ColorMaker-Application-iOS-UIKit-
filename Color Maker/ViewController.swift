//
//  ViewController.swift
//  ColorMaker
//
//  Created by Sofia Alessandra on 6/07/25.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    @IBOutlet weak var redSlid: UISlider!
    @IBOutlet weak var greenSlid: UISlider!
    @IBOutlet weak var blueSlid: UISlider!
    
    @IBOutlet weak var btnRandom: UIButton!
    @IBOutlet weak var btnGo: UIButton!
    @IBOutlet weak var lblColorHex: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlid.value = 0
        greenSlid.value = 0
        blueSlid.value = 0
        
        //Fonction
        changeCouleur()
        
    }
    
    func changeCouleur() {
        let red:CGFloat = CGFloat(redSlid.value)/255
        let green:CGFloat = CGFloat(greenSlid.value)/255
        let blue:CGFloat = CGFloat(blueSlid.value)/255
        let couleur = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        view.backgroundColor = couleur
        btnRandom.backgroundColor = couleur
        
        
        let redInt:Int = Int(redSlid.value)
        let greenInt:Int = Int(greenSlid.value)
        let blueInt:Int = Int(blueSlid.value)
        
        let hexCode = String(format: "#%02X%02X%02X", redInt, greenInt, blueInt)
        lblColorHex.text = hexCode.uppercased()
    }
    
    @IBAction func redSlid(_ sender: UISlider) {
        changeCouleur()
    }
    
    @IBAction func greenSlid(_ sender: UISlider) {
        changeCouleur()
    }
    
    @IBAction func blueSlid(_ sender: UISlider) {
        changeCouleur()
    }
    
    @IBAction func btnGo(_ sender: UIButton) {
      guard let hexaCouleur = lblColorHex.text?.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of:"#" , with:"").lowercased(), hexaCouleur.count == 6 else { return }
                
                let lienString = "https://coolors.co/\(hexaCouleur)"
                if let lien = URL(string: lienString){
                    let safView = SFSafariViewController(url: lien)
                    present(safView, animated: true, completion: nil)
                }
    }
    
    @IBAction func btnRandom(_ sender: UIButton) {
        redSlid.value = Float.random(in: 0...255)
                blueSlid.value = Float.random(in: 0...255)
                greenSlid.value = Float.random(in: 0...255)
        changeCouleur()
    }
    
}

