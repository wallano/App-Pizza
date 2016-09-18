//
//  ConfirmationController.swift
//  pizza
//
//  Created by Walter Llano on 18/09/2016.
//  Copyright © 2016 Walter Llano. All rights reserved.
//

import UIKit

class ConfirmationController: UIViewController {
    
    var pageIndex :Int = 0
    var texto = ""
    
    @IBOutlet weak var ingredientesCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "endPizza" {
            let viewController = segue.destinationViewController as! UINavigationController
            let controller = viewController.viewControllers.first as! CompleteViewController
            controller.pizza = info.pizza
            controller.masa = info.masa
            controller.queso = info.queso
            
            info.ingredientes.values.forEach({ (ingrediente) -> () in
                controller.ingredientes.append(ingrediente)
            })
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "endPizza" {
            if info.ingredientes.count > 5 {
                self.createUIAlert("No puedes tener mas de 5 ingredientes")
                return false
            }
            else if info.ingredientes.count == 0 {
                self.createUIAlert("Elije almenos un ingrediente")
                return false
            }
        }
        return true
    }
    
    @IBAction func unwindSegue(unwindSegue: UIStoryboardSegue) {
        self.texto = ""
        info.ingredientes.values.forEach({ (ingrediente) -> () in
            self.texto += "\(ingrediente) \n"
        })
        
        self.ingredientesCountLabel.text = self.texto
    }
    
    func createUIAlert(mess: String) {
        let alertController = UIAlertController(title: "Numero de Ingredientes", message: mess, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        
        alertController.addAction(defaultAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}
