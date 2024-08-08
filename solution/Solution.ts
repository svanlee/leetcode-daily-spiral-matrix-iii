function numberToWords(num: number): string {
    if(num === 0) return "Zero";
    let thousands = 0;
    let res = "";
    while(num >= 1) {
        const hundreds = num % 1000;
        const hundredsStr = convertHundreds(hundreds);
        const thousandsStr = convertThousands(thousands);

        if(thousands > 0 && hundreds > 0) {
            res = `${hundredsStr} ${thousandsStr} ${res}`;
        } else if (hundreds > 0) {
            res = hundredsStr;
        }

        num = Math.floor(num / 1000);
        thousands++;
    }
    return res.trim();
};


function convertHundreds(number) {
    let res = "";
    if(number > 99) {
        const hundred = NUM_TO_STR[Math.floor(number/100)];
        res = `${hundred} Hundred`;
        number = number % 100;
    }

    if(number > 19) {
        const tens = NUM_TO_STR[Math.floor(number/10) * 10];
        res = `${res} ${tens}`;
        number = number % 10;
    }

    if(number > 0) {
        res = `${res} ${NUM_TO_STR[number]}`
    }

    return res.trim();
}

function convertThousands(thousands) {
    switch(thousands) {
        case 1:
            return "Thousand";
        case 2:
            return "Million";
        case 3:
            return "Billion";
        case 4:
            return "Trillion";
    }
    return "";
}

const NUM_TO_STR = {
    1: "One",
    2: "Two",
    3: "Three",
    4: "Four",
    5: "Five",
    6: "Six",
    7: "Seven",
    8: "Eight",
    9: "Nine",
    10: "Ten",
    11: "Eleven",
    12: "Twelve",
    13: "Thirteen",
    14: "Fourteen",
    15: "Fifteen",
    16: "Sixteen",
    17: "Seventeen",
    18: "Eighteen",
    19: "Nineteen",
    20: "Twenty",
    30: "Thirty",
    40: "Forty",
    50: "Fifty",
    60: "Sixty",
    70: "Seventy",
    80: "Eighty",
    90: "Ninety",
}