// Solution in JS
/**
 * @param {number} num
 * @return {string}
 */
var numberToWords = function(num) {
    // Base case: if the number is 0, return "Zero"
    if (num === 0) {
        return "Zero";
    }

    // Arrays of words for numbers below 20, tens, and thousands
    var belowTwenty = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"];
    var tens = ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"];
    var thousands = ["", "Thousand", "Million", "Billion"];

    // Helper function to convert a number to words
    function helper(num) {
        // If the number is less than 20, use the belowTwenty array
        if (num < 20) {
            return belowTwenty[num];
        } 
        // If the number is between 20 and 99, use the tens array and the helper function recursively
        else if (num < 100) {
            return tens[Math.floor(num / 10)] + (num % 10 > 0 ? " " + helper(num % 10) : "");
        } 
        // If the number is between 100 and 999, use the helper function recursively
        else if (num < 1000) {
            return belowTwenty[Math.floor(num / 100)] + " Hundred" + (num % 100 > 0 ? " " + helper(num % 100) : "");
        } 
        // If the number is 1000 or greater, use a loop to convert each group of three digits to words
        else {
            var result = "";
            var i = 0;
            while (num > 0) {
                // If the current group of three digits is not zero, convert it to words and append the corresponding thousand word
                if (num % 1000 > 0) {
                    result = helper(num % 1000) + " " + thousands[i] + (result.length > 0 ? " " + result : "");
                }
                // Move to the next group of three digits
                num = Math.floor(num / 1000);
                i++;
            }
            // Return the result string after trimming leading and trailing spaces
            return result.trim();
        }
    }

    // Call the helper function to convert the number to words
    return helper(num);
};