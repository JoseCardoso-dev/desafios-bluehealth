import 'package:desafio_bluehealth/app/src/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final ResponsiveUltils responsiveUltils = ResponsiveUltils();
  final String imgUrl;
  final String name;
  ProfileWidget({
    super.key,
    required this.imgUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 120 * responsiveUltils.getImageScale(context),
          width: 120 * responsiveUltils.getImageScale(context),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFD9D9D9),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.onPrimary,
                width: 2,
              ),
            ),
            child: ClipOval(
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: responsiveUltils.getHeightSpacing(context, 10),
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: responsiveUltils.getHeightSpacing(context, 60),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveUltils.getWidthSpacing(context, 20),
          ),
          child: Text(
            '"Tecnologia, Cuidado e Personalização muito mais que um plano de Saúde."',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
