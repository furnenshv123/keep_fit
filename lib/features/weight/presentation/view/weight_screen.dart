import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_fit/features/weight/domain/entities/weight_entity.dart';
import 'package:keep_fit/features/weight/presentation/bloc/bloc/weight_bloc.dart';
import 'package:keep_fit/features/weight/presentation/widgets/target_widget.dart';
import 'package:keep_fit/features/weight/presentation/widgets/weight_data_widget.dart';
import 'package:keep_fit/themes/colors.dart';

@RoutePage()
class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  double currentWeight = 0;
  double startWeight = 0;
  double endWeight = 0;
  List<WeightEntity> listOfWeights = [];
  List<FlSpot> spots = [];
  final _weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = WeightBloc();
        bloc.add(WeightInitEvent());
        return bloc;
      },
      child: BlocBuilder<WeightBloc, WeightState>(
        builder: (context, state) {
          if (state is WeightLoadFailure) {
            return const Center(
                child: Text(
              'Error',
              style: TextStyle(fontSize: 40),
            ));
          }
          if (state is WeightInitTargetsWeights) {
            startWeight = state.entity.startWeight;
            currentWeight = state.entity.startWeight;
            endWeight = state.entity.endWeight;
            listOfWeights = state.weights;
            listOfWeights.sort(
              (a, b) => a.date.compareTo(b.date),
            );
            

            for (var element in listOfWeights) {
              spots.add(FlSpot(element.date.day.toDouble(), element.weight));
            }
          }
          if (state is WeightLoaded) {
            return Container(
              decoration: const BoxDecoration(gradient: AppColors.gradientApp),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is WeightAddDay) {
            currentWeight = state.entity.weight;
            listOfWeights.add(state.entity);
            spots.add(
                FlSpot(state.entity.date.day.toDouble(), state.entity.weight));
          }

          return Container(
            decoration: const BoxDecoration(gradient: AppColors.gradientApp),
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Column(
              children: [
                TargetWidget(
                  startWeight: startWeight,
                  endWeight: endWeight,
                  currentWeight: currentWeight,
                ),
                Center(
                  child: AspectRatio(
                    aspectRatio: 1.7,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: LineChart(LineChartData(
                          titlesData: const FlTitlesData(
                              rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false))),
                          borderData: FlBorderData(
                              border: const Border(
                                  right: BorderSide.none,
                                  top: BorderSide.none,
                                  left: BorderSide(),
                                  bottom: BorderSide())),
                          gridData: FlGridData(
                            drawVerticalLine: false,
                            getDrawingHorizontalLine: (value) {
                              return const FlLine(
                                  strokeWidth: 1,
                                  color: Color.fromRGBO(44, 51, 52, 0.2));
                            },
                          ),
                          lineBarsData: [
                            LineChartBarData(
                                belowBarData: BarAreaData(
                                  show: true,
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color.fromRGBO(64, 90, 79, 0.8),
                                        Color.fromRGBO(110, 129, 121, 0.6),
                                        Color.fromRGBO(213, 214, 214, 0.6),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter),
                                ),
                                color: AppColors.firstForGradient,
                                isCurved: true,
                                spots: spots)
                          ])),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                IconButton(
                  onPressed: () {
                    final bloc = context.read<WeightBloc>();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return BlocProvider.value(
                          value: bloc,
                          child: AlertDialog(
                            backgroundColor: Colors.white,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40)),
                            title: const Text('Enter the weight',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Hanken",
                                    fontSize: 22)),
                            content: TextField(
                              autofocus: true,
                              cursorColor: AppColors.blackAppColor,
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      borderSide: BorderSide(width: 3))),
                              controller: _weightController,
                              obscureText: false,
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Hanken",
                                          fontSize: 15))),
                              TextButton(
                                  onPressed: () {
                                    bloc.add(WeightAddEvent(
                                        date: DateTime.now(),
                                        weight: double.parse(
                                            _weightController.text)));
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    child: const Text(
                                      'Accept',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Hanken",
                                          fontSize: 15),
                                    ),
                                    decoration: BoxDecoration(
                                        color: AppColors.firstForGradient,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  )),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.add),
                  style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(AppColors.dedicatedText)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  flex: 1,
                  child: ListView.separated(
                    itemCount: listOfWeights.length,
                    itemBuilder: (context, index) {
                      return WeightDataWidget(
                        weight: listOfWeights[index].weight,
                        date: listOfWeights[index].date,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
