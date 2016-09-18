
import UIKit

class CompleteViewController: UIViewController {
    
    
    var pageIndex :Int = 0
    
    @IBOutlet weak var pizzaLabel: UILabel!
    @IBOutlet weak var masaLabel: UILabel!
    @IBOutlet weak var quesoLabel: UILabel!
    @IBOutlet weak var ingredientesLabel: UILabel!
    
    var pizza = ""
    var masa = ""
    var queso = ""
    var ingredientes = [String]()
    var texto = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pizzaLabel.text = pizza
        self.masaLabel.text = masa
        self.quesoLabel.text = queso
        ingredientes.forEach { (ingrediente) -> () in
            self.texto += "\(ingrediente) \n"
        }
        self.ingredientesLabel.text = texto
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

