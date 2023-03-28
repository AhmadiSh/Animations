import 'package:animations/model/plant_data.dart';
import 'package:flutter/material.dart';


class PlantImg extends StatelessWidget {
  const PlantImg(
    this.index, {
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    return Hero(
      tag: '__recipe_${PlantData.listPlants[index].id}_image_bg__',
      child: Stack(
        children: [
          Image.asset(
            PlantData.listPlants[index].image,
            fit: BoxFit.cover,
            //width: width/1.2,
            height: height /2,
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
                color: Color(0x22B6B3B3),
              ),
              //width: width / 2.5,
              height: height / 2,
            ),
          ),
        ],
      ),
    );
  }
}
