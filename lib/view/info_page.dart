import 'package:animations/model/plant_data.dart';
import 'package:flutter/material.dart';
import 'plant_img.dart';
import 'shapes/custom_leaf_back.dart';

class InfoPage extends StatefulWidget {
  const InfoPage(
      {Key? key, required this.index, this.initialImageRotationAngle = 0})
      : super(key: key);
  final int index;
  final double initialImageRotationAngle;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage>
    with SingleTickerProviderStateMixin {
  late List<GlobalKey<_ItemFaderState>> keys;
  var maxSlide = 195.0;
  late AnimationController animationController;

  @override
  void initState() {
    keys = List.generate(8, (_) => GlobalKey<_ItemFaderState>());
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600))
      ..forward();
    onInit();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void onInit() async {
    for (int i = 0; i < keys.length; i++) {
      if (i == 7) {
        await Future.delayed(const Duration(milliseconds: 500));
        keys[i].currentState?.show();
      } else {
        await Future.delayed(const Duration(milliseconds: 50));
        keys[i].currentState?.show();
      }
    }
  }

  String finalPrice(double first, int offer) {
    double offerPrice = (offer * first) / 100;
    double finalPrice = first - offerPrice;
    return finalPrice.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Container(
      color: Colors.white,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 80,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomRight: Radius.circular(24)),
                  child: Stack(children: [
                    PlantImg(widget.index),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            splashColor: Colors.black26,
                            borderRadius: BorderRadius.circular(18),
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18)),
                                padding: const EdgeInsets.all(6),
                                child: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.black,
                                )),
                          )),
                    ),
                    if (PlantData.listPlants[widget.index].offer != null)
                      AnimatedBuilder(
                          key: keys[0],
                          animation: animationController,
                          builder: (context, _) {
                            var slide = animationController.value * maxSlide;
                            return Positioned(
                              top: 10,
                              child: Transform(
                                transform: Matrix4.identity()
                                  ..translate(
                                      72 * (4 - animationController.value)),
                                child: Stack(children: [
                                  CustomPaint(
                                    size: Size(width / 4,
                                        ((width / 4) * 0.5).toDouble()),
                                    //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                    painter: RPSCustomLeafBack(),
                                  ),
                                  Positioned(
                                      right: 28,
                                      top: 12,
                                      child: Text(
                                        "${PlantData.listPlants[widget.index].offer}%",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            decoration: TextDecoration.none),
                                      )),
                                ]),
                              ),
                            );
                          })
                  ]),
                ),
              ),
              Flexible(
                  flex: 25,
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ItemFader(
                        key: keys[1],
                        child: Column(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xff2e9d75),
                              size: 26,
                            ),
                            Text(
                              "4.9",
                              style: theme.textTheme.caption!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ItemFader(
                        key: keys[2],
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xe2f4f5f5)),
                            child: IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.info_outline_rounded,
                                color: Color(0xff2e9d75),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ItemFader(
                        key: keys[3],
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xe2f4f5f5)),
                            child: IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () {},
                              icon: Icon(
                                PlantData.listPlants[widget.index].liked
                                    ? Icons.favorite
                                    : Icons.favorite_border_rounded,
                                color: PlantData.listPlants[widget.index].liked
                                    ? Colors.red
                                    : const Color(0xff2e9d75),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ItemFader(
                        key: keys[4],
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xe2f4f5f5)),
                            child: IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.forward_rounded,
                                color: Color(0xff2e9d75),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          ItemFader(
            key: keys[5],
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      PlantData.listPlants[widget.index].title,
                      style: theme.textTheme.headline6!
                          .copyWith(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (PlantData.listPlants[widget.index].offer != null)
                        Text("\$${PlantData.listPlants[widget.index].price}",
                            style: theme.textTheme.caption!.copyWith(
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough)),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        PlantData.listPlants[widget.index].offer != null
                            ? "\$${finalPrice(double.parse(PlantData.listPlants[widget.index].price), PlantData.listPlants[widget.index].offer!)}"
                            : "\$${PlantData.listPlants[widget.index].price}",
                        style: theme.textTheme.headline6,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          ItemFader(
            key: keys[6],
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                  "The primary color of the button when the button is\nin the down (pressed) state. The splash is represented as a\ncircular overlay that appears above the"
                  "The primary color of the button when the button is in the down (pressed) state.The splash is represented as a circular overlay that appears above it.",
                  style: theme.textTheme.caption!.copyWith(
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffa8a7a7))),
            ),
          ),
          ItemFader(
            key: keys[7],
            index: 7,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "By now",
                        style: theme.textTheme.button!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xff2e9d75)),
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_cart_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemFader extends StatefulWidget {
  final Widget child;
  final int index;

  const ItemFader({Key? key, required this.child, this.index = 0})
      : super(key: key);

  @override
  State<ItemFader> createState() => _ItemFaderState();
}

class _ItemFaderState extends State<ItemFader>
    with SingleTickerProviderStateMixin {
  int position = 1;
  late AnimationController animationController;

  late Animation _animation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _animation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutBack);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void show() {
    setState(() {
      //position = 1;
    });
    animationController.forward();
  }

  /* void hide() {
    setState(() {
     // position = -1;
    });
    animationController.reverse();
  }*/

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          if (widget.index == 7) {
            return AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Opacity(
                    opacity: animationController.value,
                    child: Transform.scale(
                        scaleX: 0.1 + (animationController.value * 0.9),
                        child: widget.child),
                  );
                });
          } else {
            return Transform.translate(
              offset:
                  Offset(0, 64 * position * (1 - animationController.value)),
              child: Opacity(
                opacity: animationController.value,
                child: widget.child,
              ),
            );
          }
        });
  }
}
