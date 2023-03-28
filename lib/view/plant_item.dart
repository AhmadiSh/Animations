import 'package:animations/model/plant_data.dart';
import 'package:animations/view_model/plant_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'info_page.dart';
import 'plant_item_gesture_decrator.dart';
import 'shapes/custom_leaf.dart';

class PlantItem extends StatefulWidget {
  const PlantItem({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<PlantItem> createState() => _PlantItemState();
}

class _PlantItemState extends State<PlantItem>
    with SingleTickerProviderStateMixin {
  //double recipeImageRotationAngle = 0;


  late AnimationController animationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 1000));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double recipeImageRotationAngle = 0;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: ItemGestureDetector(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder:
                  (BuildContext context, Animation<double> animation, _) {
                return InfoPage(
                  index: widget.index,
                  initialImageRotationAngle: recipeImageRotationAngle,
                );
              },
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation, _, Widget child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Stack(children: [
            Stack(
              children: [
                Hero(
                  tag:
                      '__recipe_${PlantData.listPlants[widget.index].id}_image_bg__',
                  child: Image.asset(
                    PlantData.listPlants[widget.index].image,
                    fit: BoxFit.cover,
                    width: width / 2,
                    height: width / 1.7,
                  ),
                ),
                Container(
                  width: width / 2,
                  height: width / 1.7,
                  color: const Color(0x47736565),
                ),
                if (PlantData.listPlants[widget.index].offer != null)
                  Positioned(
                    left: -6,
                    child: CustomPaint(
                      size: Size(width / 5, ((width / 5) * 0.5).toDouble()),
                      //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: RPSCustomLeaf(),
                    ),
                  ),
                if (PlantData.listPlants[widget.index].offer != null)
                  Positioned(
                      left: 18,
                      top: 4,
                      child: Text(
                        "${PlantData.listPlants[widget.index].offer}%",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            textBaseline: TextBaseline.alphabetic,
                            decoration: TextDecoration.none),
                      )),
              ],
            ),
            Consumer<PlantViewModel>(builder: (context, model, child) {
              return Positioned(
                right: 8,
                top: 8,
                child: GestureDetector(
                    onTap: () {
                      model.changeStatus();
                    },
                    child: Icon(
                      model.liked
                          ? Icons.favorite
                          : Icons.favorite_border_rounded,
                      color:   model.liked
                          ? Colors.red
                          : Colors.white,
                      size: 26,
                    )),
              );
            }),
            Positioned(
                bottom: 0,
                child: Container(
                  width: width / 2,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  color: Color(0x2DB4957E),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        PlantData.listPlants[widget.index].title,
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis),
                      )),
                      Text("\$${PlantData.listPlants[widget.index].price}",
                          style: theme.textTheme.bodyText2!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
