impl Solution {
    pub fn number_to_words(mut num: i32) -> String {
        // Create a hashmap to store the word representations of numbers
        use std::collections::HashMap;
        let map: HashMap<i32, &str> = HashMap::from([
            (0, "Zero"),
            (1, "One"),
            (2, "Two"),
            (3, "Three"),
            (4, "Four"),
            (5, "Five"),
            (6, "Six"),
            (7, "Seven"),
            (8, "Eight"),
            (9, "Nine"),
            (10, "Ten"),
            (11, "Eleven"),
            (12, "Twelve"),
            (13, "Thirteen"),
            (14, "Fourteen"),
            (15, "Fifteen"),
            (16, "Sixteen"),
            (17, "Seventeen"),
            (18, "Eighteen"),
            (19, "Nineteen"),
            (20, "Twenty"),
            (30, "Thirty"),
            (40, "Forty"),
            (50, "Fifty"),
            (60, "Sixty"),
            (70, "Seventy"),
            (80, "Eighty"),
            (90, "Ninety"),
            (100, "Hundred"),
            (1000, "Thousand"),
            (1000000, "Million"),
            (1000000000, "Billion"),
        ]);

        // If the number is less than or equal to 20, return its word representation directly
        if num <= 20 {
            return map[&num].to_string();
        }

        // Initialize variables to store the result and the exponent of 1000
        let mut i = 0;
        let mut result = String::new();

        // Loop until the number becomes 0
        while num > 0 {
            // If the number modulo 1000 is not 0, convert it to words and add it to the result
            if num % 1000 > 0 {
                result = Self::get_value(num % 1000, &map)
                    + if i != 0 { map[&(10i32.pow(i * 3))] } else { "" }
                    + " "
                    + result.as_str();
            }
            // Divide the number by 1000
            num /= 1000;
            // Increment the exponent of 1000
            i += 1;
        }

        // Remove the trailing space and return the result
        result.trim().to_string()
    }

    // Helper function to convert a number to its word representation
    fn get_value(num: i32, map: &std::collections::HashMap<i32, &str>) -> String {
        // If the number is 0, return an empty string
        if num == 0 {
            "".to_string()
        } else if num < 20 {
            // If the number is less than 20, return its word representation directly
            map[&num].to_string() + " "
        } else if num < 100 {
            // If the number is less than 100, convert the tens digit to words and add the ones digit
            map[&(num - (num % 10))].to_string() + " " + Self::get_value(num % 10, map).as_str()
        } else {
            // If the number is 100 or more, convert the hundreds digit to words and add the rest
            map[&(num / 100)].to_string() + " Hundred " + Self::get_value(num % 100, map).as_str()
        }
    }
}