import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hieroglyphic_app/Screens/home_screen/home_screen.dart';
import 'package:hieroglyphic_app/compenets/constants.dart';

import '../compenets/constant/colors.dart';
import '../widgets/app_color.dart';
import '../widgets/indicator.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text(AppLocalizations.of(context)!.reslutPage),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            children: <Widget>[
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections(),
                    ),
                  ),
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Indicator(
                    color: AppColors.contentColorBlue,
                    text: 'Happy',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: AppColors.contentColorYellow,
                    text: 'Sad',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: AppColors.contentColorPurple,
                    text: 'Fear',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: Colors.red,
                    text: 'Angry',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color:Colors.blueAccent,
                    text: 'Disgust',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: Colors.greenAccent,
                    text: 'Natural',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color:Colors.cyan,
                    text: 'Surprise',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
              const SizedBox(
                width: 28,
              ),
              

            ],
          ),

          Text('$neutral'),
          Text('$happy'),
          Text('$surprise'),
          Text('$angry'),
          Text('$fear'),
          Text('$disgust'),
          Text('$sad'),
          // Row(
          //   children: <Widget>[
          //     const SizedBox(
          //       height: 18,
          //     ),
          //     Expanded(
          //       child: AspectRatio(
          //         aspectRatio: 1,
          //         child: PieChart(
          //           PieChartData(
          //             pieTouchData: PieTouchData(
          //               touchCallback: (FlTouchEvent event, pieTouchResponse) {
          //                 setState(() {
          //                   if (!event.isInterestedForInteractions ||
          //                       pieTouchResponse == null ||
          //                       pieTouchResponse.touchedSection == null) {
          //                     touchedIndex = -1;
          //                     return;
          //                   }
          //                   touchedIndex = pieTouchResponse
          //                       .touchedSection!.touchedSectionIndex;
          //                 });
          //               },
          //             ),
          //             borderData: FlBorderData(
          //               show: false,
          //             ),
          //             sectionsSpace: 0,
          //             centerSpaceRadius: 40,
          //             sections: showingSections(),
          //           ),
          //         ),
          //       ),
          //     ),
          //
          //     const SizedBox(
          //       width: 28,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(7, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.contentColorBlue,
            value: ((happy / sumOfResults) * 100).truncate().toDouble(),
            title: '${((happy / sumOfResults) * 100).truncate()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.contentColorYellow,
            value:((sad / sumOfResults) * 100).truncate().toDouble(),
            title: '${((sad / sumOfResults) * 100).truncate()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.contentColorPurple,
            value: ((fear / sumOfResults) * 100).truncate().toDouble(),
            title: '${((fear / sumOfResults) * 100).truncate()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.red,
            value: ((angry / sumOfResults) * 100).truncate().toDouble(),
            title: '${((angry / sumOfResults) * 100).truncate()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 4:
          return PieChartSectionData(
            color: Colors.blueAccent,
            value: ((disgust / sumOfResults) * 100).truncate().toDouble(),
            title: '${((disgust / sumOfResults) * 100).truncate()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 5:
          return PieChartSectionData(
            color: Colors.greenAccent,
            value: ((neutral / sumOfResults) * 100).truncate().toDouble(),
            title: '${((neutral / sumOfResults) * 100).truncate()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 6:
          return PieChartSectionData(
            color: Colors.cyan,
            value: ((surprise / sumOfResults) * 100).truncate().toDouble(),
            title: '${((surprise / sumOfResults) * 100).truncate()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
