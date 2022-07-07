// Defining and Instantiating Classes

class Appliance{
//    properties
    var manufacturer: String = ""
    var model: String = ""
    var voltage: Int = 0
    var capacity: Int?
    
    
    //methods
    func getDetails() -> String{
        var message = "This is the \(self.model) from \(self.manufacturer). "
        if self.voltage >= 200{
            message += "This model is for European usage."
        }
        return message 
    }
}

var kettle = Appliance()
kettle
kettle.manufacturer = "Sanil's Manufacturing"
kettle.model = "Tea Master 5000"
kettle.voltage = 100
print(kettle.getDetails())
