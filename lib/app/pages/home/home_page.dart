import 'package:animate_do/animate_do.dart';
import 'package:desafio_bluehealth/app/model/user_model.dart';
import 'package:desafio_bluehealth/app/pages/login/login_controller.dart';
import 'package:desafio_bluehealth/app/pages/login/login_page.dart';
import 'package:desafio_bluehealth/app/src/utils/responsive_utils.dart';
import 'package:desafio_bluehealth/app/src/utils/transition_page_utils.dart';
import 'package:desafio_bluehealth/app/widgets/card_back_widget.dart';
import 'package:desafio_bluehealth/app/widgets/card_front_widget.dart';
import 'package:desafio_bluehealth/app/widgets/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({
    super.key,
    required this.user,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ResponsiveUltils responsiveUltils = ResponsiveUltils();
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Seção superior com informações do usuário
          Container(
            height: 350,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                // Cabeçalho com título e botão de sair
                Positioned(
                  left: responsiveUltils.getHeightSpacing(context, 26),
                  top: responsiveUltils.getHeightSpacing(context, 65),
                  child: Row(
                    children: [
                      Text(
                        'Dados do Usuário',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        width: responsiveUltils.getWidthSpacing(context, 245),
                      ),
                      IconButton(
                        onPressed: () {
                          LoginController.cleanData();
                          TransitionPageUtils.navigateToPage(
                            context,
                            LoginPage(),
                          );
                        },
                        icon: Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                          size: 30 * responsiveUltils.getTextScale(context),
                        ),
                      ),
                    ],
                  ),
                ),

                // Card giratório exibindo informações do usuário
                Positioned(
                  left: responsiveUltils.getHeightSpacing(context, 30),
                  top: responsiveUltils.getHeightSpacing(context, 50),
                  child: Column(
                    children: [
                      SizedBox(
                        height: responsiveUltils.getHeightSpacing(context, 80),
                      ),
                      FlipCard(
                        fill: Fill.fillBack,
                        direction: FlipDirection.HORIZONTAL,
                        side: CardSide.FRONT,
                        front: CardFrontWidget(
                          imgUrl: widget.user.imgUrl!,
                          name: widget.user.name!,
                          cpf: widget.user.cpf!,
                          bloodGroup: widget.user.bloodGroup!,
                          healthInsurance: widget.user.healthInsurance!,
                        ),
                        back: CardBackWidget(
                          rg: widget.user.rg!,
                          emergencyContact: widget.user.emergencyContact!,
                          planCoverge: widget.user.planCoverage!,
                          planValidity: widget.user.planValidity!,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Gráfico de rosca exibindo índices
          AspectRatio(
            aspectRatio: 1.7,
            child: Row(
              children: [
                SizedBox(
                  height: responsiveUltils.getHeightSpacing(context, 18),
                ),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            setState(
                              () {
                                if (!event.isInterestedForInteractions ||
                                    pieTouchResponse == null ||
                                    pieTouchResponse.touchedSection == null) {
                                  touchedIndex = -1;
                                  return;
                                }
                                touchedIndex = pieTouchResponse
                                    .touchedSection!.touchedSectionIndex;
                              },
                            );
                          },
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 2,
                        centerSpaceRadius: 43,
                        sections: showingSections(),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Indicadores de cores ao lado do gráfico
                    Indicator(
                      color: Theme.of(context).colorScheme.primary,
                      text: 'EUROPOL',
                    ),
                    SizedBox(
                      height: responsiveUltils.getHeightSpacing(context, 4),
                    ),
                    Indicator(
                      color: Theme.of(context).colorScheme.secondary,
                      text: 'ATIVIDADE FISICA',
                    ),
                    SizedBox(
                      height: responsiveUltils.getHeightSpacing(context, 4),
                    ),
                    Indicator(
                      color: Theme.of(context).colorScheme.onSecondary,
                      text: 'MENTAL',
                    ),
                  ],
                ),
                SizedBox(
                  width: responsiveUltils.getWidthSpacing(context, 50),
                ),
              ],
            ),
          ),
          const Spacer(),

          // Seção inferior com logotipo
          Container(
            height: responsiveUltils.getHeightSpacing(context, 180),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_inverted.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                // Logotipo animado
                Positioned(
                  left: responsiveUltils.getHeightSpacing(context, 30),
                  top: responsiveUltils.getHeightSpacing(context, 40),
                  child: FadeInUp(
                    duration: const Duration(seconds: 1),
                    child: Column(
                      children: [
                        SizedBox(
                          height:
                              responsiveUltils.getHeightSpacing(context, 70),
                        ),
                        SvgPicture.asset(
                          'assets/images/logo_bluehealth_white.svg',
                          height:
                              responsiveUltils.getHeightSpacing(context, 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Método auxiliar para gerar dados para o gráfico de rosca
  List<PieChartSectionData> showingSections() {
    return List.generate(
      3,
      (i) {
        final isTouched = i == touchedIndex;
        final fontSize = isTouched ? 25.0 : 16.0;
        final radius = isTouched ? 60.0 : 50.0;
        const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: Theme.of(context).colorScheme.primary,
              value: 40,
              title: '40%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.background,
                shadows: shadows,
              ),
            );
          case 1:
            return PieChartSectionData(
              color: Theme.of(context).colorScheme.secondary,
              value: 25,
              title: '25%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.background,
                shadows: shadows,
              ),
            );
          case 2:
            return PieChartSectionData(
              color: Theme.of(context).colorScheme.onSecondary,
              value: 35,
              title: '35%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.background,
                shadows: shadows,
              ),
            );
          default:
            throw Error();
        }
      },
    );
  }
}
