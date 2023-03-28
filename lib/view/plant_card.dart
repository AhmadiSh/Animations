import 'package:animations/model/plant_data.dart';

import 'package:flutter/material.dart';

import 'plant_item_gesture_decrator.dart';


class PlantCard2 extends StatefulWidget {
  const PlantCard2({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<PlantCard2> createState() => _PlantCard2State();
}

class _PlantCard2State extends State<PlantCard2> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return ItemGestureDetector(
      onTap: () {
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Stack(children: [
                Stack(
                  children: [
                    Image.asset(
                      PlantData.listPlants[widget.index].image,
                      fit: BoxFit.cover,
                      width: width / 2.5,
                      height: width / 2.5,
                    ),
                    Container(
                      width: width / 2.5,
                      height: width / 2.5,
                      color: Color(0x37B6B3B3),
                    ),
                  ],
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        PlantData.listPlants[widget.index].liked
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        color: PlantData.listPlants[widget.index].liked
                            ? Colors.red
                            : Colors.white,
                        size: 20,
                      )),
                ),
              ]),
            ),
            Container(
              width: width / 2.5,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      PlantData.listPlants[widget.index].title,
                      style: theme.textTheme.caption!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Text("\$${PlantData.listPlants[widget.index].price}",
                      style: theme.textTheme.caption!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
