import 'package:desafio_bluehealth/app/model/user_model.dart';
import 'package:desafio_bluehealth/app/widgets/homeViewWidgets/card_back_widget.dart';
import 'package:desafio_bluehealth/app/widgets/homeViewWidgets/card_front_widget.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final UserModel user;
  const CardWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      fill: Fill.fillBack,
      direction: FlipDirection.HORIZONTAL,
      side: CardSide.FRONT,
      front: CardFrontWidget(
        imgUrl: user.imgUrl!,
        name: user.name!,
        cpf: user.cpf!,
        bloodGroup: user.bloodGroup!,
        healthInsurance: user.healthInsurance!,
      ),
      back: CardBackWidget(
        rg: user.rg!,
        emergencyContact: user.emergencyContact!,
        planCoverge: user.planCoverage!,
        planValidity: user.planValidity!,
      ),
    );
  }
}
