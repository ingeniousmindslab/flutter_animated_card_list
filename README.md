# Flutter Animated Card List

Welcome to Flutter Animated Card List, a powerful Flutter package that allows users to display a list of animated credit cards and debit cards. With this package, you can create an engaging and visually appealing card list screen with smooth animations.

## Features

* Animated card list display, providing an interactive and visually pleasing user experience
* Support for popular card types, including Visa, Mastercard, American Express, RuPay, and Discover
* Customizable card design and styling options to match your app's branding
* Easy integration with Flutter projects, allowing you to quickly implement the animated card list

## Usage Example

To use the Flutter Animated Card List package, follow these steps:

1. Add the package to your `pubspec.yaml` file:

   ```
   dependencies:
     flutter_animated_card_list: ^1.0.0

   ```
2. Import the package in your Dart code:

```
import 'package:flutter_animated_card_list/flutter_animated_card_list.dart';
```

3. Create a list of `CreditCardData` objects representing the credit cards or debit cards you want to display. Each `CreditCardData` object contains details such as the card number, cardholder name, valid until date, card type, and card background color.
4. Use the `CreditCardListWidget` widget to display the animated card list. Pass the list of `CreditCardData` objects to the `cardsData` parameter.

```
CreditCardListWidget(
  cardsData: [
    CreditCardData(
      cvvText: "981",
      cardHolderName: "Mr. Marcia Fadel",
      cardNumber: "4660 9282 5392 9728",
      validUntill: "7/2026",
      cardtype: CardType.masterCard,
      backgroundColor: Colors.indigo[900],
    ),
    // Add more CreditCardData objects as needed
  ],
)
```

5. Customize the card design and styling by providing a `CardDecoration` object to the `cardDecoration` parameter of the `CreditCardData` class. The `CardDecoration` class allows you to control various aspects of the card's appearance, such as showing an image, contactless icon, styling for company name, CVV, card holder label, valid till label, authorized text, card holder details, valid till details, card number text, standard text, and declaration text.

```
CreditCardData(
  // Card data properties...
  cardDecoration: CardDecoration(
    showImage: true,
    showContactLessIcon: true,
    companyNameStyle: TextStyle(fontSize: 16),
    cvvTextStyle: TextStyle(fontSize: 12),
    // Other style properties...
  ),
)

```

Supported Card Types

The Flutter Animated Card List package currently supports the following card types:

* Visa
* Mastercard
* American Express
* RuPay
* Discover

## License

This package is released under the MIT License. See the [LICENSE](https://github.com/your-username/flutter_animated_card_list/blob/main/LICENSE) file for more details.

Feel free to contribute to this project by submitting issues or pull requests. We hope you find the Flutter Animated Card List package useful for creating dynamic and en

gaging card list screens in your Flutter apps!

## About [Ingenious Minds Lab](https://ingeniousmindslab.com/)

[Ingenious Minds Lab](https://ingeniousmindslab.com/) is a software development company focused on creating innovative solutions for mobile and web applications. With a dedicated team of skilled professionals, we aim to deliver high-quality products that exceed our clients' expectations. Our passion for cutting-edge technologies drives us to explore new possibilities and develop creative solutions.
