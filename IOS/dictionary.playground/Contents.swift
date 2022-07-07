// Dictionaries
var airlines = ["SWA": "Southwest Airlines",
                "BAW": "British Airways",
                "BHA": "Buddha Air",
                "CPA": "Cathay Pacific"]


// use [ ] to look up a key
if let result = airlines["SWA"]{
    print(result)
}else{
    print("No Match Found")
}


//add or change (if this is already exists it will change the value if does'nt exist it will add new key value pair.
airlines["DVA"] = "Discovery Airlines" // this will add a new key/value
airlines


//remove by setting to nil
airlines["BHA"] = nil
airlines

// Dictionary of String keys and String values
var periodicElements: [String: String]

// Dictionary of Int keys and String values
var employees: [Int: String]


//accessing dictionary using loop
for entry in airlines{
    print(entry)
}

for (key, value) in airlines{
//    print(key)
//    print(value)
}
