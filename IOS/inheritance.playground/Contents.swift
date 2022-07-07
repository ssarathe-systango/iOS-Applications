class Appliance{
    var make: String
    var model: String
    init(){
        self.make = "default"
        self.model = "default"
        print("sarathe")
    }
    func printDetails(){
        print("Make: \(self.make) \nModel: \(self.model)")
    }
}
//define a new class
class Toaster: Appliance{
    //new property
    var slices: Int
    
    //we are modifying the behaviour of init method in subclass then we must add the keyword "override", because we are overriding init method in subclass.
    
    // as soon as the object of Toaster class will be created, firstly this(subclass) init method will be invoke, after that super class init method will be invoked.
    override init(){
        self.slices = 2
        print("sanil")
        super.init() // If we want to call the method of super class into subclass we use the keyword "super" .
    }
    //new method
    func toast(){
        print("Irriadiating now...")
    }
}


var myToaster = Toaster()
myToaster.make = "This is sanil"
myToaster.model = "Carbonizer"
myToaster.printDetails()
myToaster.toast()


