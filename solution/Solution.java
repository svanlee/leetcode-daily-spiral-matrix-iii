// Solution in JAVA
class Solution {
    // Array of strings for numbers below 20
    private final String[] belowTwenty = {"", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine",
            "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"};
    
    // Array of strings for tens
    private final String[] tens = {"", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"};

    // Main method to convert a number to words
    public String numberToWords(int num) {
        // Base case: if the number is 0, return "Zero"
        if (num == 0) {
            return "Zero";
        }
        // Call the helper method to convert the number to words
        return helper(num);
    }

    // Helper method to convert a number to words
    private String helper(int num) {
        // Create a StringBuilder to build the result string
        StringBuilder result = new StringBuilder();
        
        // If the number is less than 20, use the belowTwenty array
        if (num < 20) {
            result.append(belowTwenty[num]);
        } 
        // If the number is between 20 and 99, use the tens array and the belowTwenty array
        else if (num < 100) {
            result.append(tens[num / 10]).append(" ").append(belowTwenty[num % 10]);
        } 
        // If the number is between 100 and 999, use the helper method recursively
        else if (num < 1000) {
            result.append(helper(num / 100)).append(" Hundred ").append(helper(num % 100));
        } 
        // If the number is between 1000 and 999999, use the helper method recursively
        else if (num < 1000000) {
            result.append(helper(num / 1000)).append(" Thousand ").append(helper(num % 1000));
        } 
        // If the number is between 1000000 and 999999999, use the helper method recursively
        else if (num < 1000000000) {
            result.append(helper(num / 1000000)).append(" Million ").append(helper(num % 1000000));
        } 
        // If the number is 1000000000 or greater, use the helper method recursively
        else {
            result.append(helper(num / 1000000000)).append(" Billion ").append(helper(num % 1000000000));
        }
        
        // Return the result string after trimming leading and trailing spaces
        return result.toString().trim();
    }
}