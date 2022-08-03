import 'dart:ffi';

import 'package:electropeyk/app/presantation/controllers/home_controller.dart';
import 'package:electropeyk/app/presantation/controllers/sign_up_controller.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:electropeyk/app/presantation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget(
      {Key? key,
      this.list,
      this.selectedItem,
      this.initValue,
      required this.listLength})
      : super(key: key);
  List<String>? list;
  ValueChanged<String>? selectedItem;
  String? initValue;
  int? listLength;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget>
    with TickerProviderStateMixin {
  final homeCtrl = Get.find<HomeController>();
  Animation<double>? animation;
  OverlayEntry? overlayEntry;
  double angle = 0;
  bool openDropDown = false;
  double dropDownHeight = 0;
  String? selectedItem;
  AnimationController? _controller;
  GlobalKey key = GlobalKey();
  showOverlay(double top) {
    final overlay = Overlay.of(context);
    overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
              top: top + 78,
              left: 16,
              child: Material(
                type: MaterialType.transparency,
                borderRadius: BorderRadius.circular(8),
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  duration: const Duration(milliseconds: 200),
                  width: Get.width - 33,
                  height: dropDownHeight,
                  child: RawScrollbar(
                    radius: const Radius.circular(8),
                    thickness: 12,
                    thumbColor: IColor().LIGHT_PRIMARY_COLOR,
                    child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: widget.list!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              widget.list![index],
                              style: index == "افزودن آدرس"
                                  ? MyTextStyle().style1
                                  : selectedItem == widget.list![index]
                                      ? MyTextStyle().style1
                                      : Themes.light.textTheme.subtitle2,
                              textAlign: TextAlign.center,
                            ),
                            onTap: () {
                              if (widget.list![index] == "افزودن آدرس") {
                                homeCtrl.newAddress.value =
                                    !homeCtrl.newAddress.value;
                              }
                              selectedItem = widget.list![index];
                              widget.selectedItem!(selectedItem!);
                              dropDownHeight = 0;
                              _controller!.reverse();
                              overlayEntry!.remove();
                              openDropDown = false;
                              setState(() {});
                            },
                          );
                        }),
                  ),
                ),
              ),
            ));
    overlay!.insert(overlayEntry!);
  }

  @override
  void initState() {
    super.initState();
    selectedItem = widget.initValue;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      upperBound: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                if (!openDropDown) {
                  if (widget.listLength! > 5) {
                    dropDownHeight = Get.height * 0.33;
                  } else {
                    dropDownHeight = widget.listLength! * 50;
                  }
                  _controller!.forward();
                  RenderBox box =
                      key.currentContext!.findRenderObject() as RenderBox;
                  Offset position = box.localToGlobal(Offset.zero);
                  showOverlay(position.dy);
                } else {
                  dropDownHeight = 0;
                  _controller!.reverse();
                  overlayEntry!.remove();
                }
                openDropDown = !openDropDown;
              });
            },
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: openDropDown
                      ? IColor().LIGHT_Button_COLOR
                      : Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0).animate(_controller!),
                      child: Icon(Icons.arrow_drop_down),
                    ),
                    Text(
                      selectedItem!,
                      style: MyTextStyle().style2,
                    ),
                    Container()
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
