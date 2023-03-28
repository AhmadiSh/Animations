
import 'package:animations/model/plant.dart';
import 'package:animations/model/plant_data.dart';
import 'package:flutter/cupertino.dart';

class PlantViewModel with ChangeNotifier{
  bool liked=false;

  List <Plant> plants=PlantData.listPlants;

  changeStatus(){
    liked=!liked;
    notifyListeners();
  }


}