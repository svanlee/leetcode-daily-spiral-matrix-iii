// Solution in CS
public class Solution
{
    // Helper method to check if a number is divisible by another number
    private bool _IsRemainderZero(int num, int divisionBy)
        => (num % divisionBy) == 0;

    // Main method to convert a number to words
    public string NumberToWords(int num)
    {
        // Base case: if the number is 0, return "Zero"
        if (num == 0)
        {
            return "Zero";
        }

        // If the number is between 1 and 19, use the array of words for numbers below 20
        if (num >= 1 && num <= 19)
        {
            string[] arr = { "", "One", "Two", "Three", "Four", "Five",
                             "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve",
                             "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen",
                             "Eighteen", "Nineteen" };

            return arr[num];
        }

        // If the number is between 20 and 99, use the array of words for tens and the helper method recursively
        if (num >= 20 && num <= 99)
        {
            string[] arr = { "", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty",
                             "Seventy", "Eighty", "Ninety" };

            return $"{arr[num / 10]} {(_IsRemainderZero(num, 10) ? string.Empty : NumberToWords(num % 10))}".Trim();
        }

        // If the number is between 100 and 999, use the helper method recursively
        if (num >= 100 && num <= 999)
        {
            return $"{NumberToWords(num / 100)} Hundred {(_IsRemainderZero(num, 100) ? string.Empty : NumberToWords(num % 100))}".Trim();
        }

        // If the number is between 1000 and 999999, use the helper method recursively
        if (num >= 1000 && num <= 999999)
        {
            return $"{NumberToWords(num / 1000)} Thousand {(_IsRemainderZero(num, 1000) ? string.Empty : NumberToWords(num % 1000))}".Trim();
        }

        // If the number is between 1000000 and 999999999, use the helper method recursively
        if (num >= 1000000 && num <= 999999999)
        {
            return $"{NumberToWords(num / 1000000)} Million {(_IsRemainderZero(num, 1000000) ? string.Empty : NumberToWords(num % 1000000))}".Trim();
        }

        // If the number is 1000000000 or greater, use the helper method recursively
        if (num >= 1000000000)
        {
            return $"{NumberToWords(num / 1000000000)} Billion {(_IsRemainderZero(num, 1000000000) ? string.Empty : NumberToWords(num % 1000000000))}".Trim();
        }

        // Default case: return an empty string
        return string.Empty;
    }
}