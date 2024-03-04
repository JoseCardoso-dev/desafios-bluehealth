import 'package:desafio_bluehealth/app/src/utils/responsive_utils.dart';
import 'package:desafio_bluehealth/app/widgets/homeViewWidgets/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphicWidget extends StatefulWidget {
  const GraphicWidget({super.key});

  @override
  State<GraphicWidget> createState() => _GraphicWidgetState();
}

class _GraphicWidgetState extends State<GraphicWidget> {
  ResponsiveUltils responsiveUltils = ResponsiveUltils();
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                      // touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      //   setState(
                      //     () {
                      //       if (!event.isInterestedForInteractions ||
                      //           pieTouchResponse == null ||
                      //           pieTouchResponse.touchedSection == null) {
                      //         touchedIndex = -1;
                      //         return;
                      //       }
                      //       touchedIndex = pieTouchResponse
                      //           .touchedSection!.touchedSectionIndex;
                      //     },
                      //   );
                      // },
                      ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 2,
                  centerSpaceRadius: 35,
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
                color: Theme.of(context).colorScheme.tertiary,
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
    );
  }

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
              color: Theme.of(context).colorScheme.tertiary,
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
