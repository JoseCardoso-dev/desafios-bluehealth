import 'package:desafio_bluehealth/app/src/utils/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardBackWidget extends StatelessWidget {
  final String rg;
  final String emergencyContact;
  final String planCoverge;
  final String planValidity;

  final ResponsiveUltils responsiveUltils = ResponsiveUltils();
  CardBackWidget({
    super.key,
    required this.rg,
    required this.emergencyContact,
    required this.planCoverge,
    required this.planValidity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary,
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      height: responsiveUltils.getHeightSpacing(context, 200),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: responsiveUltils.getHeightSpacing(context, 15),
                  ),
                  Text(
                    'RG: $rg',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Contato de Emergëncia: \n$emergencyContact',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  Text(
                    'Cobertura $planCoverge',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  Text(
                    'Validade: $planValidity',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/qrcode.svg',
                  height: 75.0 * responsiveUltils.getImageScale(context),
                ),
                SizedBox(
                  height: responsiveUltils.getHeightSpacing(context, 15),
                ),
                SvgPicture.asset(
                  'assets/images/logo_bluehealth_white.svg',
                  height: 15.0 * responsiveUltils.getImageScale(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
