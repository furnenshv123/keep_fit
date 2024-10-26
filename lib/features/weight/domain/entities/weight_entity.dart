import 'package:intl/intl.dart';
import 'package:keep_fit/features/weight/data/models/weight_model.dart';

class WeightEntity {
  final double weight;
  final DateTime date;

  WeightEntity({required this.weight, required this.date});
}

extension WeightEntityEx on WeightEntity{
  WeightModel toModel(){
    return WeightModel(weight: weight, date: DateFormat.yMMMd().format(date));
  }
}