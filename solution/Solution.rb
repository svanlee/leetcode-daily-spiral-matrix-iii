def number_to_words(num)
  return "Zero" if num == 0

  ones = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"]
  teens = ["Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
  tens = ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
  thousands = ["", "Thousand", "Million", "Billion"]

  result = ""

  i = 0
  while num > 0
    if num % 1000 != 0
      temp = helper(num % 1000, ones, teens, tens)
      if temp != ""
        if result != ""
          result = temp + " " + thousands[i] + " " + result
        else
          result = temp + " " + thousands[i]
        end
      end
    end
    num /= 1000
    i += 1
  end

  result = result.gsub(/\s+/, " ").strip

  return result
end

def helper(num, ones, teens, tens)
  if num == 0
    return ""
  elsif num < 10
    return ones[num]
  elsif num < 20
    return teens[num-10]
  elsif num < 100
    if num % 10 == 0
      return tens[num/10]
    else
      return tens[num/10] + " " + ones[num%10]
    end
  else
    if num % 100 == 0
      return ones[num/100] + " Hundred"
    else
      return ones[num/100] + " Hundred " + helper(num%100, ones, teens, tens)
    end
  end
end