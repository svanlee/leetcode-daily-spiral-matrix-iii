// Solution in GO
func numberToWords(num int) string {
    if num == 0 {
        return "Zero"
    }
    
    ones := []string{"", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"}
    teens := []string{"Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"}
    tens := []string{"", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"}
    thousands := []string{"", "Thousand", "Million", "Billion"}
    
    var result string
    
    i := 0
    for num > 0 {
        if num % 1000 != 0 {
            temp := helper(num % 1000, ones, teens, tens)
            if temp != "" {
                if result != "" {
                    result = temp + " " + thousands[i] + " " + result
                } else {
                    result = temp + " " + thousands[i]
                }
            }
        }
        num /= 1000
        i++
    }
    
    return strings.TrimSpace(result)
}

func helper(num int, ones, teens, tens []string) string {
    if num == 0 {
        return ""
    } else if num < 10 {
        return ones[num]
    } else if num < 20 {
        return teens[num-10]
    } else if num < 100 {
        if num % 10 == 0 {
            return tens[num/10]
        } else {
            return tens[num/10] + " " + ones[num%10]
        }
    } else {
        if num % 100 == 0 {
            return ones[num/100] + " Hundred"
        } else {
            return ones[num/100] + " Hundred " + helper(num%100, ones, teens, tens)
        }
    }
}