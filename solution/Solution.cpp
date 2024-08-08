// Solution in CPP
#include <string>
#include <vector>
using namespace std;

class Solution
{
public:
    // Arrays to hold words for ones, tens, and thousands
    vector<string> ones = {"", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten",
                           "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"};
    vector<string> tens = {"", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"};
    vector<string> thousands = {"", "Thousand", "Million", "Billion"};

    string numberToWords(int num)
    {
        if (num == 0)
            return "Zero";
        return dfs(num).substr(1); // Remove leading space
    }

private:
    // Helper function to convert number to words
    string dfs(int n)
    {
        if (n == 0)
            return "";
        if (n < 20)
            return " " + ones[n];
        if (n < 100)
            return " " + tens[n / 10] + dfs(n % 10);
        if (n < 1000)
            return " " + ones[n / 100] + " Hundred" + dfs(n % 100);

        // Process larger numbers
        for (int i = 3; i >= 0; --i)
        {
            long long div = 1000;
            for (int j = 1; j < i; ++j)
                div *= 1000; // Compute 1000^i
            if (n >= div)
            {
                return dfs(n / div) + " " + thousands[i] + dfs(n % div);
            }
        }
        return "";
    }
};