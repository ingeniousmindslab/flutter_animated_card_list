import 'package:flutter/material.dart';

import '../utils/utills.dart';

class CreditCardData {
  CreditCardData({
    this.stdText,
    this.cardDecoration,
    required this.cardNumber,
    required this.cardHolderName,
    required this.validUntill,
    required this.backgroundColor,
    required this.cardtype,
    this.cvvText,
    this.declarationText,
    this.authoRizedText,
  });
  final Color? backgroundColor;
  final CardType cardtype;
  final String? cvvText;
  final String? declarationText;
  final String? stdText;
  final String? authoRizedText;
  final String cardNumber;
  final String cardHolderName;
  final String validUntill;
  final CardDecoration? cardDecoration;
}

class CardDecoration {
  final bool? showImage;
  final bool? showContactLessIcon;
  final TextStyle? companyNameStyle;
  final TextStyle? cvvTextStyle;
  final TextStyle? cardHolderLabelStyle;
  final TextStyle? validTillLabelStyle;
  final TextStyle? authoRizedTextStyle;
  final TextStyle? cardHolderDetailsStyle;
  final TextStyle? validTillDetailsStyle;
  final TextStyle? cardNumberTextStyle;
  final TextStyle? stdTextStyle;
  final TextStyle? declarationTextStyle;

  CardDecoration({
    this.authoRizedTextStyle,
    this.declarationTextStyle,
    this.cvvTextStyle,
    this.showImage,
    this.stdTextStyle,
    this.cardNumberTextStyle,
    this.cardHolderDetailsStyle,
    this.validTillDetailsStyle,
    this.showContactLessIcon,
    this.cardHolderLabelStyle,
    this.validTillLabelStyle,
    this.companyNameStyle,
  });
}
