
import UIKit

class IngredientsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let ingredientes = ["Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ingredientes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.ingredientes[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let getAction = UITableViewRowAction(style: .Normal, title: "Agregar") { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            
            let firstActiveItem = self.ingredientes[indexPath.row]
            
            info.ingredientes[indexPath.row] = firstActiveItem
        }
        
        let removeAction = UITableViewRowAction(style: .Normal, title: "Quitar") { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            
            info.ingredientes.removeValueForKey(indexPath.row)
            
        }
        
        getAction.backgroundColor = UIColor.blueColor()
        removeAction.backgroundColor = UIColor.redColor()
        
        if (info.ingredientes.indexForKey(indexPath.row) != nil) {
            return [getAction, removeAction]
        }
        
        else {
            return [getAction]
        }
        
    }
    
}

