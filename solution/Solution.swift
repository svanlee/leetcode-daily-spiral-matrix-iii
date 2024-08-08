class Solution {
    // These are all indexed 0-9 for the values they represent.
    // Special tens is for the teens, and regular tens for anything 20+
    let ones = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"]
    let specialTens = ["Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
    let regularTens = ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
    let compSuffix = ["", "Thousand", "Million", "Billion", "Trillion", "Quadrillion"]
    
    // This function converts a number to words
    func numberToWords(_ num: Int) -> String {
        // If the number is 0, return "Zero"
        guard num != 0 else {
            return "Zero"
        }
        
        // Break the number into components of 0 to 999, from the back
        let comps = components(num)
        
        // Initialize an empty array to store the words
        var answer: [String] = []
        
        // Iterate over the components in reverse order
        for i in (0..<comps.count).reversed() {
            // Get the words for the current component
            var curNames = name(component: comps[i])
            
            // If the current component is not zero, add its words to the answer
            if curNames.count != 0 {
                answer.append(contentsOf: curNames)
                // Add the suffix for the current component (e.g. Thousand, Million, etc.)
                let suffix = compSuffix[i]
                if suffix != "" {
                    answer.append(suffix)
                }
            }
        }
        
        // Join the words with spaces and return the result
        return answer.joined(separator: " ")
    }
    
    // This function breaks a number into components of 0 to 999, from the back
    func components(_ num: Int) -> [Int] {
        let factor = 1000
        var cur = num
        var comps = [Int]()
        while cur > 0 {
            comps.append(cur % factor)
            cur /= factor
        }
        return comps
    }

    // This function converts a component (0 to 999) to words
    func name(component val: Int) -> [String] {
        // Check that the component is within the valid range
        guard val >= 0 && val < 1000 else {
            fatalError("This should be 0 to 1000")
        }
        
        // Extract the ones, tens, and hundreds values from the component
        var onesVal = val % 10
        var tensVal = val % 100 / 10
        var hundsVal = val % 1000 / 100
        
        // Initialize an empty array to store the words
        var names = [String]()
        
        // Add the hundreds value to the words
        names.append(contentsOf: hundreds(hundsVal))
        
        // Add the tens and ones values to the words
        if tensVal == 1 {
            names.append(specialTens[onesVal])
        } else {
            names.append(regularTens[tensVal])
            names.append(ones[onesVal])
        }
        
        // Return the words, filtering out any empty strings
        return names.filter { $0 != "" }
    }

    // This function converts a hundreds value to words
    func hundreds(_ val: Int) -> [String] {
        // Check that the hundreds value is within the valid range
        guard val >= 0 && val < 10 else {
            fatalError("Can't have a value for hundreds above 10")
        }
        
        // If the hundreds value is 0, return an empty array
        if val == 0 {
            return []
        }
        
        // Return the words for the hundreds value
        return [ones[val], "Hundred"]
    }
}