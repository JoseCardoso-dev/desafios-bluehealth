import 'package:desafio_bluehealth/app/src/utils/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardFrontWidget extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String cpf;
  final String bloodGroup;
  final String healthInsurance;
  final ResponsiveUltils responsiveUltils = ResponsiveUltils();
  CardFrontWidget({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.cpf,
    required this.bloodGroup,
    required this.healthInsurance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
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
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/logo_bluehealth_white.svg',
                  height: 30.0 * responsiveUltils.getImageScale(context),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: responsiveUltils.getWidthSpacing(context, 2),
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage(
                            imgUrl,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: responsiveUltils.getHeightSpacing(context, 15),
                  ),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'CPF: $cpf',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Grupo sanguíneo: $bloodGroup',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  Text(
                    healthInsurance,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: responsiveUltils.getHeightSpacing(context, 25),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
