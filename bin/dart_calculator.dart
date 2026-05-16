import 'dart:io';

void main() {
  bool running = true;

  print("=================================");
  print("      ADVANCED DART CALCULATOR   ");
  print("=================================");

  while (running) {
    print("\nChoose an option:");
    print("1. Addition");
    print("2. Subtraction");
    print("3. Multiplication");
    print("4. Division");
    print("5. Modulus");
    print("6. Power");
    print("7. Square Root");
    print("8. Exit");

    stdout.write("\nEnter your choice (1-8): ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        calculate("+");
        break;

      case '2':
        calculate("-");
        break;

      case '3':
        calculate("*");
        break;

      case '4':
        calculate("/");
        break;

      case '5':
        calculate("%");
        break;

      case '6':
        powerCalculation();
        break;

      case '7':
        squareRoot();
        break;

      case '8':
        print("\nThank you for using the calculator!");
        running = false;
        break;

      default:
        print("\nInvalid choice. Please try again.");
    }
  }
}

double getNumber(String message) {
  while (true) {
    stdout.write(message);
    String? input = stdin.readLineSync();

    try {
      return double.parse(input!);
    } catch (e) {
      print("Invalid number. Try again.\n");
    }
  }
}

void calculate(String operator) {
  double num1 = getNumber("Enter first number: ");
  double num2 = getNumber("Enter second number: ");

  switch (operator) {
    case "+":
      print("\nResult = ${num1 + num2}");
      break;

    case "-":
      print("\nResult = ${num1 - num2}");
      break;

    case "*":
      print("\nResult = ${num1 * num2}");
      break;

    case "/":
      if (num2 != 0) {
        print("\nResult = ${num1 / num2}");
      } else {
        print("\nError: Cannot divide by zero.");
      }
      break;

    case "%":
      print("\nResult = ${num1 % num2}");
      break;
  }
}

void powerCalculation() {
  double base = getNumber("Enter base number: ");
  double exponent = getNumber("Enter exponent: ");

  double result = 1;

  for (int i = 0; i < exponent; i++) {
    result *= base;
  }

  print("\nResult = $result");
}

void squareRoot() {
  double number = getNumber("Enter number: ");

  if (number < 0) {
    print("\nCannot find square root of negative number.");
    return;
  }

  double guess = number / 2;

  for (int i = 0; i < 10; i++) {
    guess = (guess + number / guess) / 2;
  }

  print("\nSquare Root = ${guess.toStringAsFixed(2)}");
}