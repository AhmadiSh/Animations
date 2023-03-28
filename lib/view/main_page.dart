
import 'package:animations/model/plant_data.dart';
import 'package:animations/view/plant_item.dart';
import 'package:animations/view_model/plant_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'plant_card.dart';

class PlantMainPage extends StatefulWidget {
  const PlantMainPage({Key? key}) : super(key: key);

  @override
  State<PlantMainPage> createState() => _PlantMainPageState();
}

class _PlantMainPageState extends State<PlantMainPage> {
  late ValueNotifier<ScrollDirection> scrollDirectionNotifier;
  late ValueNotifier<ScrollDirection> scrollDirectionNotifier1;
  late List<GlobalKey<_PlantListItemWrapperState>> keys;

  @override
  void initState() {
    keys = List.generate(PlantData.listPlants.length,
        (_) => GlobalKey<_PlantListItemWrapperState>());

    scrollDirectionNotifier =
        ValueNotifier<ScrollDirection>(ScrollDirection.forward);
    scrollDirectionNotifier1 =
        ValueNotifier<ScrollDirection>(ScrollDirection.forward);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 24,
                height: 24,
                child: Image.asset("assets/plant-pot.png")),
            const SizedBox(
              width: 6,
            ),
            Text(
              "Floweret",
              style: theme.textTheme.headline6!.copyWith(letterSpacing: 1),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        cacheExtent: 0,
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(26),
                  bottomRight: Radius.circular(26)),
              child: Stack(
                children: [
                  Container(
                    width: width,
                    height: height / 5,
                    child: Image.asset(
                      "assets/img_10.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: width,
                    height: height / 5,
                    color: const Color(0xd52c2b2b),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "This week's workshop",
                          style: theme.textTheme.headline6!
                              .copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Combining different plants\nin one room",
                          style: theme.textTheme.caption!.copyWith(
                              color: const Color(0xffa6a6a6),
                              fontWeight: FontWeight.w500,
                              height: 1.3),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "22.06.2022 at 10:00 PM",
                          style: theme.textTheme.caption!.copyWith(
                              color: const Color(0xbeb0b0b0),
                              fontWeight: FontWeight.w500,
                              height: 1.3),
                        ),
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Monday discount",
                  style: theme.textTheme.subtitle1!.copyWith(
                      color: const Color(0xff171616),
                      fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  child: Text(
                    "See all",
                    style: theme.textTheme.caption!.copyWith(
                        color: Color(0xff2e9d75), fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          ChangeNotifierProvider<PlantViewModel>(
            create: (context)=>PlantViewModel(),
              child: SizedBox(
                      width: width,
                      height: width / 1.8,
                      child: NotificationListener<UserScrollNotification>(
                        onNotification: (UserScrollNotification notification) {
                          if (notification.direction == ScrollDirection.forward ||
                              notification.direction == ScrollDirection.reverse) {
                            scrollDirectionNotifier.value = notification.direction;
                          }
                          return true;
                        },
                        child: ListView.builder(
                            cacheExtent: 0,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: PlantData.listPlants.length,
                            shrinkWrap: true,
                            primary: true,
                            padding: EdgeInsets.only(left: 16),
                            itemBuilder: (context, index) => ValueListenableBuilder(
                              builder: (context, scrollDirection,child) {
                                return PlantListItemWrapper(
                                    key: keys[index],
                                    scrollDirection: scrollDirection,
                                    child:PlantItem(index: index,) );
                              }, valueListenable: scrollDirectionNotifier,
                            )),
                      ))

          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recently bought",
                  style: theme.textTheme.subtitle1!.copyWith(
                      color: const Color(0xff171616),
                      fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  child: Text(
                    "See all",
                    style: theme.textTheme.caption!.copyWith(
                        color: Color(0xff2e9d75), fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: width,
            height: width / 2,
            child: NotificationListener<UserScrollNotification>(
              onNotification: (UserScrollNotification notification) {
                if (notification.direction == ScrollDirection.forward ||
                    notification.direction == ScrollDirection.reverse) {
                  scrollDirectionNotifier1.value = notification.direction;
                }
                return true;
              },
              child: ListView.builder(
                  cacheExtent: 0,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: PlantData.listPlants.length,
                  shrinkWrap: true,
                  primary: true,
                  padding: const EdgeInsets.only(left: 16),
                  itemBuilder: (context, index) =>ValueListenableBuilder(
                    builder: (context, scrollDirection,child) {
                      return PlantListItemWrapper(
                          scrollDirection: scrollDirection,
                          child:PlantCard2(index: index,) );
                    }, valueListenable: scrollDirectionNotifier1,
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class PlantListItemWrapper extends StatefulWidget {
  const PlantListItemWrapper(
      {Key? key,
      required this.child,
      this.keepAlive = true,
      this.scrollDirection = ScrollDirection.forward})
      : super(key: key);
  final Widget child;
  final bool keepAlive;
  final ScrollDirection scrollDirection;

  @override
  State<PlantListItemWrapper> createState() => _PlantListItemWrapperState();
}

class _PlantListItemWrapperState extends State<PlantListItemWrapper>
    with SingleTickerProviderStateMixin {
  int position = 1;
  late final AnimationController animationController;
  late final Animation<double> scaleAnimation;
  late final Animation<double> perspectiveAnimation;
  late final Animation<AlignmentGeometry> alignmentAnimation;
  static const double perspectiveValue = 0.0013;

  @override
  void initState() {
    super.initState();
    final int perspectiveDirectionMultiplier =
        widget.scrollDirection == ScrollDirection.forward ? -1 : 1;

    final AlignmentGeometry directionAlignment =
        widget.scrollDirection == ScrollDirection.forward
            ? Alignment.centerLeft
            : Alignment.center;

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..forward();

    scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 0.5, curve: Curves.easeOut),
      ),
    );

    perspectiveAnimation = Tween<double>(
      begin: (perspectiveValue * perspectiveDirectionMultiplier),
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.6, 1, curve: Curves.easeOut),
      ),
    );

    alignmentAnimation = Tween<AlignmentGeometry>(
      begin: directionAlignment,
      end: Alignment.center,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 1, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void show() {
    setState(() {
      position = 1;
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Transform(
        alignment: alignmentAnimation.value,
        transform: Matrix4.identity()
          ..setEntry(3, 0, perspectiveAnimation.value),
        child: Transform.scale(
          scale: scaleAnimation.value,
          child: widget.child,
        ),
      ),
    );
  }
}
