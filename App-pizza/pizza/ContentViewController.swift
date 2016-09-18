//
//  ViewController.swift
//  pizza
//
//  Created by Walter Llano on 18/09/2016.
//  Copyright © 2016 Walter Llano. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pizzaImage: UIImageView?
    @IBOutlet weak var pizzaLabelText: UILabel?
    
    var images = ["pizza", "masa", "cheese"]
    var textos = ["Selecciona el tamaño de tu pizza", "Que masa prefieres", "Que tipo de queso gustas"]
    
    var quesos = [["Grande", "Mediana", "Chica"],["Delgada", "Crujiente", "Gruesa"],["Mozarela", "Cheddar", "Parmesano", "Sin queso"]]

    var pageIndex :Int = 0
    
    @IBOutlet weak var pizzaSize: UIPickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pizzaSize?.dataSource = self
        self.pizzaSize?.delegate = self
        self.pizzaImage?.image = UIImage(named: self.images[pageIndex])
        self.pizzaLabelText?.text = textos[pageIndex]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func passValuesToCompleteView(index: Int, data: String) {
        if index == 0 {
            info.pizza = data
        }
        
        if index == 1 {
            info.masa = data
        }
        
        if index == 2 {
            info.queso = data
        }
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return quesos[pageIndex].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return quesos[pageIndex][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        passValuesToCompleteView(pageIndex, data: quesos[pageIndex][row])
    }
}

