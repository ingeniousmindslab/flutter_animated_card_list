import 'package:flutter_animated_card_list/flutter_animated_card_list.dart';
import 'package:flutter_animated_card_list/src/widgets/credit_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class CreditCardListWidget extends StatefulWidget {
  const CreditCardListWidget({
    Key? key,
    this.cardsData = const [],
    this.space = Utils.kSpaceBetweenCard,
  }) : super(key: key);

  final List<CreditCardData> cardsData;
  final double space;

  @override
  State<CreditCardListWidget> createState() => _CreditCardListWidgetState();
}

class _CreditCardListWidgetState extends State<CreditCardListWidget> {
  int? selectedCardIndex;

  List<CreditCard> creditCards = [];

  @override
  void initState() {
    super.initState();

    creditCards = widget.cardsData
        .map((data) => CreditCard(
              declarationText: data.declarationText,
              cvvText: data.cvvText,
              controller: FlipCardController(),
              cardDecoration: data.cardDecoration,
              authoRizedText: data.authoRizedText,
              cardExpireDate: data.validUntill,
              cardHolderName: data.cardHolderName,
              cardNumber: data.cardNumber,
              stdText: data.stdText,
              cardtype: data.cardtype,
              backgroundColor: data.backgroundColor!,
            ))
        .toList();
  }

  int toUnselectedCardPositionIndex(int indexInAllList) {
    if (selectedCardIndex != null) {
      if (indexInAllList < selectedCardIndex!) {
        return indexInAllList;
      } else {
        return indexInAllList - 1;
      }
    } else {
      throw 'Wrong usage';
    }
  }

  double _getCardTopPosititoned(int index, isSelected) {
    if (selectedCardIndex != null) {
      if (isSelected) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.minScrollExtent,
            duration: const Duration(seconds: 2),
            curve: Curves.easeOutBack,
          );
        }

        return widget.space;
      } else {
        /// Space from top to place put unselect cards.
        return Utils.kSpaceUnselectedCardToTop +
            toUnselectedCardPositionIndex(index) *
                Utils.kSpaceBetweenUnselectCard;
      }
    } else {
      /// Top first emptySpace + CardSpace + emptySpace + ...
      return widget.space + index * Utils.kCardHeight + index * widget.space;
    }
  }

  double _getCardScale(int index, isSelected) {
    if (selectedCardIndex != null) {
      if (isSelected) {
        return 1.0;
      } else {
        int totalUnselectCard = creditCards.length - 1;
        return 1.0 -
            (totalUnselectCard - toUnselectedCardPositionIndex(index) - 1) *
                0.05;
      }
    } else {
      return 1.0;
    }
  }

  void unSelectCard() {
    setState(() {
      selectedCardIndex = null;
    });
  }

  double totalHeightTotalCard() {
    if (selectedCardIndex == null) {
      final totalCard = creditCards.length;
      return widget.space * (totalCard + 1) + Utils.kCardHeight * totalCard;
    } else {
      return Utils.kSpaceUnselectedCardToTop +
          Utils.kCardHeight +
          (creditCards.length - 2) * Utils.kSpaceBetweenUnselectCard +
          Utils.kSpaceBetweenCard;
    }
  }

  _onTapCard(i) {
    if (creditCards[i].controller.state?.isFront == false) {
      creditCards[i].controller.toggleCard();
    } else if (selectedCardIndex == i) {
      creditCards[i].controller.toggleCard();
    } else {
      if (selectedCardIndex != null) {
        if (creditCards[selectedCardIndex!].controller.state?.isFront ==
            false) {
          creditCards[selectedCardIndex!].controller.toggleCard();
        }
      }
    }
    setState(() {
      selectedCardIndex = i;
    });
  }

  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return SizedBox.expand(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: Utils.kAnimationDuration,
              height: totalHeightTotalCard(),
              width: mediaQuery.size.width,
            ),
            for (int i = 0; i < creditCards.length; i++)
              AnimatedPositioned(
                top: _getCardTopPosititoned(i, i == selectedCardIndex),
                duration: Utils.kAnimationDuration,
                child: AnimatedScale(
                  scale: _getCardScale(i, i == selectedCardIndex),
                  duration: Utils.kAnimationDuration,
                  child: GestureDetector(
                    onTap: () {
                      if (creditCards[i].controller.controller?.isAnimating ==
                          false) {
                        _onTapCard(i);
                      }
                    },
                    child: creditCards[i],
                  ),
                ),
              ),
            if (selectedCardIndex != null)
              Positioned.fill(
                child: GestureDetector(
                  onVerticalDragEnd: (_) {
                    unSelectCard();
                  },
                  onVerticalDragStart: (_) {
                    unSelectCard();
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}

class CreditCard extends StatelessWidget {
  const CreditCard({
    Key? key,
    required this.backgroundColor,
    required this.cardtype,
    required this.cardNumber,
    required this.cardHolderName,
    required this.cardExpireDate,
    this.cardDecoration,
    this.authoRizedText,
    required this.controller,
    this.cvvText,
    this.stdText,
    this.declarationText,
  }) : super(key: key);
  final String cardNumber;
  final String cardHolderName;
  final String? cvvText;
  final String? stdText;
  final String? authoRizedText;
  final String? declarationText;
  final String cardExpireDate;
  final Color backgroundColor;
  final FlipCardController controller;
  final CardType cardtype;
  final CardDecoration? cardDecoration;
  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
        stdText: stdText,
        declarationText: declarationText,
        controller: controller,
        cardtype: cardtype,
        context: context,
        color: backgroundColor,
        cardNumber: cardNumber,
        cardHolder: cardHolderName,
        cardDecoration: cardDecoration,
        cardExpiration: cardExpireDate,
        cvvText: cvvText,
        authoRizedText: authoRizedText);
  }
}
