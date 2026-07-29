import 'dart:math';

void main() {

  // Q1 print numbers 1 to 10 using for loop
  print("Q1: Numbers 1 to 10");
  for (int i = 1; i <= 10; i++) {
    print(i);
  }

  // Q2 print numbers 10 to 1 using while loop
  print("Q2: Numbers 10 to 1");
  int i = 10;
  while (i >= 1) {
    print(i);
    i--;
  }

  // Q3 even numbers between 1 and 50
  print("Q3: Even numbers 1 to 50");
  for (int n = 1; n <= 50; n++) {
    if (n % 2 == 0) {
      print(n);
    }
  }

  // Q4 odd numbers between 1 and 50
  print("Q4: Odd numbers 1 to 50");
  for (int n = 1; n <= 50; n++) {
    if (n % 2 != 0) {
      print(n);
    }
  }

  // Q5 sum from 1 to N
  print("Q5: Sum from 1 to N");
  int N = 10;
  int sum = 0;
  for (int k = 1; k <= N; k++) {
    sum = sum + k;
  }
  print("Sum = $sum");

  // Q6 multiplication table
  print("Q6: Table of 5");
  int num = 5;
  for (int j = 1; j <= 10; j++) {
    print("$num x $j = ${num * j}");
  }

  // Q7 count digits in a number
  print("Q7: Count digits in 12345");
  int number = 12345;
  int count = 0;
  int temp = number;
  while (temp != 0) {
    temp = temp ~/ 10;
    count++;
  }
  print("Digits = $count");

  // Q8 reverse a number
  print("Q8: Reverse of 123");
  int original = 123;
  int reversed = 0;
  temp = original;
  while (temp != 0) {
    int digit = temp % 10;
    reversed = reversed * 10 + digit;
    temp = temp ~/ 10;
  }
  print("Reversed = $reversed");

  // Q9 palindrome check
  print("Q9: Palindrome check for 121");
  int palNum = 121;
  reversed = 0;
  temp = palNum;
  while (temp != 0) {
    reversed = reversed * 10 + (temp % 10);
    temp = temp ~/ 10;
  }
  if (palNum == reversed) {
    print("$palNum is a palindrome");
  } else {
    print("$palNum is not a palindrome");
  }

  // Q10 factorial
  print("Q10: Factorial of 5");
  int factNum = 5;
  int factorial = 1;
  for (int f = 1; f <= factNum; f++) {
    factorial = factorial * f;
  }
  print("5! = $factorial");

  // Q11 star pattern ascending
  print("Q11: Star pattern");
  for (int row = 1; row <= 5; row++) {
    String line = "";
    for (int col = 0; col < row; col++) {
      line = line + "*";
    }
    print(line);
  }

  // Q12 star pattern descending
  print("Q12: Descending star pattern");
  for (int row = 5; row >= 1; row--) {
    String line = "";
    for (int col = 0; col < row; col++) {
      line = line + "*";
    }
    print(line);
  }

  // Q13 number pattern
  print("Q13: Number pattern");
  for (int row = 1; row <= 4; row++) {
    String line = "";
    for (int col = 1; col <= row; col++) {
      line = line + col.toString();
    }
    print(line);
  }

  // Q14 largest number in list
  print("Q14: Largest in list");
  List<int> numbers = [3, 67, 12, 89, 45, 23];
  int largest = numbers[0];
  for (int val in numbers) {
    if (val > largest) {
      largest = val;
    }
  }
  print("Largest = $largest");

  // Q15 count even and odd in array
  print("Q15: Even and odd count");
  List<int> arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int evenCount = 0;
  int oddCount = 0;
  for (int val in arr) {
    if (val % 2 == 0) {
      evenCount++;
    } else {
      oddCount++;
    }
  }
  print("Even = $evenCount, Odd = $oddCount");

  // Q16 sum of digits
  print("Q16: Sum of digits of 123");
  int digitNum = 123;
  int digitSum = 0;
  temp = digitNum;
  while (temp != 0) {
    digitSum = digitSum + (temp % 10);
    temp = temp ~/ 10;
  }
  print("Sum of digits = $digitSum");

  // Q17 prime check
  print("Q17: Is 17 prime?");
  int primeNum = 17;
  bool isPrime = true;
  if (primeNum < 2) {
    isPrime = false;
  }
  for (int d = 2; d <= sqrt(primeNum).toInt(); d++) {
    if (primeNum % d == 0) {
      isPrime = false;
      break;
    }
  }
  print("17 is prime: $isPrime");

  // Q18 fibonacci series
  print("Q18: Fibonacci up to 10 terms");
  int a = 0;
  int b = 1;
  for (int t = 0; t < 10; t++) {
    print(a);
    int next = a + b;
    a = b;
    b = next;
  }

  // Q19 input until 0
  print("Q19: Keep taking input until 0 (simulated)");
  List<int> inputs = [5, 3, 8, 0];
  int idx = 0;
  while (inputs[idx] != 0) {
    print("Input: ${inputs[idx]}");
    idx++;
  }
  print("Got 0, stopping");

  // Q20 guess the number game
  print("Q20: Guess the number game (simulated)");
  int secret = 42;
  List<int> guesses = [10, 55, 42];
  for (int guess in guesses) {
    if (guess == secret) {
      print("Correct!");
      break;
    } else if (guess < secret) {
      print("$guess is too low");
    } else {
      print("$guess is too high");
    }
  }

  // Q21 divisible by 3 using while
  print("Q21: Numbers divisible by 3 up to 100");
  int w = 1;
  while (w <= 100) {
    if (w % 3 == 0) {
      print(w);
    }
    w++;
  }
}
