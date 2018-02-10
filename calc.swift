import Foundation

var string = String(readLine()!)

string.append(" ")

func getAllNumbers(_ string: inout String) -> [Double]{ // Returns array of all numbers
    // And replaces numbers with N
    var number = 0.0
    var isDotMet = false
    var isNumberReplaced = false
    var (a,b) = (10.0, 1.0)
    var numbers: [Double] = []
    for char in string{
        if let currNumber = Double("\(char)"){
            
            number = number * a + currNumber * b
            if isDotMet == true { b = b / 10 }
            if let i = string.index(of: char){
                string.remove(at: i)
                if !isNumberReplaced{
                    string.insert("N", at: i)
                    isNumberReplaced = true
                }
            }
            
        }
        else if char == "."{
            (a,b) = (1.0, 0.1)
            isDotMet = true
            if let i = string.index(of: char){
                string.remove(at: i)
                
            }
            
        }
        else if number != 0.0 {
            
            isNumberReplaced = false
            numbers.append(number)
            number = 0.0
            (a,b) = (10.0, 1.0)
            isDotMet = false
        }
        
    }
    var modifiedString = string.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range:nil)
    print(modifiedString)
    return (numbers)
}

print(getAllNumbers(&string))
