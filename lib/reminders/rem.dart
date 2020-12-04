import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mephi_guide/circle_button.dart';

import 'circle_status_widget.dart';
import '../group_manager.dart';
import '../rounded_button.dart';

class MobileWidget2 extends StatelessWidget {
  final GroupManager reminderButtonsGroup = new GroupManager();

  @override
  Widget build(BuildContext context) {
    //print(reminderButtonsGroup?.onInteractFunctions?.toString());
    // Figma Flutter Generator MobileWidget - FRAME
    return Container(
        width: 360,
        height: 640,
        decoration: BoxDecoration(
          color : Color.fromRGBO(250, 250, 250, 1),
        ),
        child: Stack(
            children: <Widget>[

              Positioned(
                  top: 0,
                  left: 0,
                  child:  //Mask holder Template
                  Container(
                      width: 360,
                      height: 640,
                      child: Container()
                  )

              ),Positioned(
                  top: 240,
                  left: 123,
                  child: Container(
                      width: 43,
                      height: 4,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0.666656494140625,
                                left: 0,
                                child: Container(
                                    width: 25,
                                    height: 2.666656494140625,
                                    decoration: BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(3),
                                        topRight: Radius.circular(3),
                                        bottomLeft: Radius.circular(3),
                                        bottomRight: Radius.circular(3),
                                      ),
                                      color : Color.fromRGBO(76, 207, 211, 1),
                                    )
                                )
                            ),Positioned(
                                top: 0,
                                left: 39,
                                child: Container(
                                    width: 4,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(3),
                                        topRight: Radius.circular(3),
                                        bottomLeft: Radius.circular(3),
                                        bottomRight: Radius.circular(3),
                                      ),
                                      color : Color.fromRGBO(185, 191, 202, 1),
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 0,
                  left: -0.5,
                  child: Container(
                      width: 361,
                      height: 640,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 277,
                                left: 16.5,
                                child: Container(
                                    width: 328,
                                    height: 38,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            child: RoundedToggleButton(
                                              width: 101,
                                              height: 38,
                                              text: "Все",
                                              defaultPressed: true,
                                              onTap: (){},
                                              buttonGroup: reminderButtonsGroup,
                                            ),
                                          ),
                                          Positioned(
                                            top: 0,
                                            left: 115,
                                            child: RoundedToggleButton(
                                                width: 213,
                                                height: 38,
                                                text: "Невыполненные",
                                                defaultPressed: false,
                                                onTap: (){},
                                                buttonGroup: reminderButtonsGroup,
                                            ),
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 361,
                                    height: 640,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                  width: 360,
                                                  height: 640,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child: SvgPicture.asset(
                                                                'assets/images/rectanglepath.svg',
                                                                semanticsLabel: 'rectanglepath'
                                                            )
                                                        ),Positioned(
                                                            top: 0,
                                                            left: 344,
                                                            child: SvgPicture.asset(
                                                                'assets/images/rectanglepath.svg',
                                                                semanticsLabel: 'rectanglepath'
                                                            )
                                                        ),Positioned(
                                                            top: 0,
                                                            left: 56,
                                                            child: SvgPicture.asset(
                                                                'assets/images/rectanglepath.svg',
                                                                semanticsLabel: 'rectanglepath'
                                                            )
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 0.52117919921875,
                                              left: 0,
                                              child: Container(
                                                  width: 361,
                                                  height: 591.4788208007812,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 556.4788208007812,
                                                            left: 324.5,
                                                            child: Text('1X', textAlign: TextAlign.left, style: TextStyle(
                                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                                fontFamily: 'Roboto',
                                                                fontSize: 14,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),
                                        ]
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 52,
                  left: 111,
                  child: Container(
                      width: 170,
                      height: 98,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Stack(
                          children: <Widget>[

                          ]
                      )
                  )
              ),Positioned(
                  top: 240,
                  left: 183,
                  child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(3),
                          topRight: Radius.circular(3),
                          bottomLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3),
                        ),
                        color : Color.fromRGBO(185, 191, 202, 1),
                      )
                  )
              ),Positioned(
                  top: 228,
                  left: 16,
                  child: Text('Памятка', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(46, 31, 112, 1),
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),Positioned(
                  top: 495,
                  left: 270,
                  child: SvgPicture.asset(
                      'assets/images/oval.svg',
                      semanticsLabel: 'oval'
                  )
              ),Positioned(
                  top: 331,
                  left: 0,
                  child: Container(
                      width: 360,
                      height: 159,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 360,
                                    height: 159,
                                    decoration: BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      color : Color.fromRGBO(250, 250, 250, 1),
                                    )
                                )
                            ),Positioned(
                                top: 136,
                                left: 64,
                                child: Container(
                                    width: 150,
                                    height: 4,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 1,
                                              left: 0,
                                              child: Container(
                                                  width: 111,
                                                  height: 2,
                                                  decoration: BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(3),
                                                      topRight: Radius.circular(3),
                                                      bottomLeft: Radius.circular(3),
                                                      bottomRight: Radius.circular(3),
                                                    ),
                                                    color : Color.fromRGBO(185, 192, 202, 1),
                                                  )
                                              )
                                          ),Positioned(
                                              top: 0,
                                              left: 125,
                                              child: Container(
                                                  width: 4,
                                                  height: 4,
                                                  decoration: BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(3),
                                                      topRight: Radius.circular(3),
                                                      bottomLeft: Radius.circular(3),
                                                      bottomRight: Radius.circular(3),
                                                    ),
                                                    color : Color.fromRGBO(185, 191, 202, 1),
                                                  )
                                              )
                                          ),Positioned(
                                              top: 0,
                                              left: 146,
                                              child: Container(
                                                  width: 4,
                                                  height: 4,
                                                  decoration: BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(3),
                                                      topRight: Radius.circular(3),
                                                      bottomLeft: Radius.circular(3),
                                                      bottomRight: Radius.circular(3),
                                                    ),
                                                    color : Color.fromRGBO(185, 191, 202, 1),
                                                  )
                                              )
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 133.21630859375,
                                left: 17.189208984375,
                                child: Container(
                                    width: 47.27027130126953,
                                    height: 8.594594955444336,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                  width: 47.27027130126953,
                                                  height: 8.594594955444336,
                                                  decoration: BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(20),
                                                      topRight: Radius.circular(20),
                                                      bottomLeft: Radius.circular(20),
                                                      bottomRight: Radius.circular(20),
                                                    ),
                                                    color : Color.fromRGBO(245, 135, 60, 1),
                                                  )
                                              )
                                          ),Positioned(
                                              top: -0.00009237753693014383,
                                              left: 7.52025032043457,
                                              child: Container()
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 64.45945739746094,
                                left: 17.189189910888672,
                                child: Transform.rotate(
                                  angle: -1.0031667522032328e-13 * (math.pi / 180),
                                  child: Text('Learning Design', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(62, 39, 148, 1),
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1.7142857142857142
                                  ),),
                                )
                            ),Positioned(
                                top: 98.83783721923828,
                                left: 17.189189910888672,
                                child: Text('Finishing reading How to Make Great Icon', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(185, 192, 202, 1),
                                    fontFamily: 'Roboto',
                                    fontSize: 12,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),Positioned(
                                top: 17.189189910888672,
                                left: 17.189189910888672,
                                child: Container(
                                    width: 162.2229766845703,
                                    height: 38.67567443847656,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 6.039613253960852e-14,
                                              child: Transform.rotate(
                                                angle: -1.0031667522032328e-13 * (math.pi / 180),
                                                child: Text('15:00', textAlign: TextAlign.left, style: TextStyle(
                                                    color: Color.fromRGBO(79, 79, 79, 1),
                                                    fontFamily: 'Roboto',
                                                    fontSize: 24,
                                                    letterSpacing: 1,
                                                    fontWeight: FontWeight.normal,
                                                    height: 1.5 /*PERCENT not supported*/
                                                ),),
                                              )
                                          ),Positioned(
                                              top: 17.96630859375,
                                              left: 77.351318359375,
                                              child: Text('24 Sept 2020', textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(185, 192, 202, 1),
                                                  fontFamily: 'Roboto',
                                                  fontSize: 12,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 23.63501739501953,
                                left: 282.54730224609375,
                                child: Container(
                                    width: 60.16216278076172,
                                    height: 25.784021377563477,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0.0002375422336626798,
                                              left: 0,
                                              child: Container(
                                                  width: 60.16216278076172,
                                                  height: 25.783782958984375,
                                                  decoration: BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(70),
                                                      topRight: Radius.circular(70),
                                                      bottomLeft: Radius.circular(70),
                                                      bottomRight: Radius.circular(70),
                                                    ),
                                                    color : Color.fromRGBO(185, 192, 202, 0.20000000298023224),
                                                  )
                                              )
                                          ),Positioned(
                                              top: 0,
                                              left: 0.3782958984375,
                                              child: Container(
                                                  width: 25.783782958984375,
                                                  height: 25.783782958984375,
                                                  decoration: BoxDecoration(
                                                    color : Color.fromRGBO(245, 135, 60, 1),
                                                    borderRadius : BorderRadius.all(Radius.elliptical(25.783782958984375, 25.783782958984375)),
                                                  )
                                              )
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 50,
                                left: 260,
                                child: Text(' >/ выполнить', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(185, 192, 202, 1),
                                    fontFamily: 'Roboto',
                                    fontSize: 12,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 495,
                  left: 0,
                  child: Container(
                      width: 360,
                      height: 537,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(255, 255, 255, 1),
                      )
                  )
                  //The List
              ),Positioned(
                  top: 497,
                  left: 0,
                  child: Container(
                      width: 360,
                      height: 486,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 360,
                                    height: 159,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                  width: 360,
                                                  height: 159,
                                                  decoration: BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(10),
                                                      topRight: Radius.circular(10),
                                                      bottomLeft: Radius.circular(10),
                                                      bottomRight: Radius.circular(10),
                                                    ),
                                                    color : Color.fromRGBO(250, 250, 250, 1),
                                                  )
                                              )
                                          ),Positioned(
                                              top: 136,
                                              left: 64,
                                              child: Container(
                                                  width: 150,
                                                  height: 4,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 1,
                                                            left: 0,
                                                            child: Container(
                                                                width: 111,
                                                                height: 2,
                                                                decoration: BoxDecoration(
                                                                  borderRadius : BorderRadius.only(
                                                                    topLeft: Radius.circular(3),
                                                                    topRight: Radius.circular(3),
                                                                    bottomLeft: Radius.circular(3),
                                                                    bottomRight: Radius.circular(3),
                                                                  ),
                                                                  color : Color.fromRGBO(185, 192, 202, 1),
                                                                )
                                                            )
                                                        ),Positioned(
                                                            top: 0,
                                                            left: 125,
                                                            child: Container(
                                                                width: 4,
                                                                height: 4,
                                                                decoration: BoxDecoration(
                                                                  borderRadius : BorderRadius.only(
                                                                    topLeft: Radius.circular(3),
                                                                    topRight: Radius.circular(3),
                                                                    bottomLeft: Radius.circular(3),
                                                                    bottomRight: Radius.circular(3),
                                                                  ),
                                                                  color : Color.fromRGBO(185, 191, 202, 1),
                                                                )
                                                            )
                                                        ),Positioned(
                                                            top: 0,
                                                            left: 146,
                                                            child: Container(
                                                                width: 4,
                                                                height: 4,
                                                                decoration: BoxDecoration(
                                                                  borderRadius : BorderRadius.only(
                                                                    topLeft: Radius.circular(3),
                                                                    topRight: Radius.circular(3),
                                                                    bottomLeft: Radius.circular(3),
                                                                    bottomRight: Radius.circular(3),
                                                                  ),
                                                                  color : Color.fromRGBO(185, 191, 202, 1),
                                                                )
                                                            )
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 133.21630859375,
                                              left: 17.189208984375,
                                              child: Container(
                                                  width: 47.27027130126953,
                                                  height: 8.594594955444336,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child: Container(
                                                                width: 47.27027130126953,
                                                                height: 8.594594955444336,
                                                                decoration: BoxDecoration(
                                                                  borderRadius : BorderRadius.only(
                                                                    topLeft: Radius.circular(20),
                                                                    topRight: Radius.circular(20),
                                                                    bottomLeft: Radius.circular(20),
                                                                    bottomRight: Radius.circular(20),
                                                                  ),
                                                                  color : Color.fromRGBO(76, 207, 211, 1),
                                                                )
                                                            )
                                                        ),Positioned(
                                                            top: -0.00009237753693014383,
                                                            left: 7.52025032043457,
                                                            child: Container()
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 64.45945739746094,
                                              left: 17.189189910888672,
                                              child: Transform.rotate(
                                                angle: -1.0031667522032328e-13 * (math.pi / 180),
                                                child: Text('Learning Design', textAlign: TextAlign.left, style: TextStyle(
                                                    color: Color.fromRGBO(62, 39, 148, 1),
                                                    fontFamily: 'Roboto',
                                                    fontSize: 14,
                                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight: FontWeight.normal,
                                                    height: 1.7142857142857142
                                                ),),
                                              )
                                          ),Positioned(
                                              top: 98.83783721923828,
                                              left: 17.189189910888672,
                                              child: Text('Finishing reading How to Make Great Icon', textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(185, 192, 202, 1),
                                                  fontFamily: 'Roboto',
                                                  fontSize: 12,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),Positioned(
                                              top: 17.189189910888672,
                                              left: 17.189189910888672,
                                              child: Container(
                                                  width: 162.2229766845703,
                                                  height: 38.67567443847656,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 6.039613253960852e-14,
                                                            child: Transform.rotate(
                                                              angle: -1.0031667522032328e-13 * (math.pi / 180),
                                                              child: Text('15:00', textAlign: TextAlign.left, style: TextStyle(
                                                                  color: Color.fromRGBO(79, 79, 79, 1),
                                                                  fontFamily: 'Roboto',
                                                                  fontSize: 24,
                                                                  letterSpacing: 1,
                                                                  fontWeight: FontWeight.normal,
                                                                  height: 1.5 /*PERCENT not supported*/
                                                              ),),
                                                            )
                                                        ),Positioned(
                                                            top: 17.96630859375,
                                                            left: 77.351318359375,
                                                            child: Text('24 Sept 2020', textAlign: TextAlign.left, style: TextStyle(
                                                                color: Color.fromRGBO(185, 192, 202, 1),
                                                                fontFamily: 'Roboto',
                                                                fontSize: 12,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 23.63501739501953,
                                              left: 282.54730224609375,
                                              child: Container(
                                                  width: 60.16216278076172,
                                                  height: 25.784021377563477,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0.0002375422336626798,
                                                            left: 0,
                                                            child: Container(
                                                                width: 60.16216278076172,
                                                                height: 25.783782958984375,
                                                                decoration: BoxDecoration(
                                                                  borderRadius : BorderRadius.only(
                                                                    topLeft: Radius.circular(70),
                                                                    topRight: Radius.circular(70),
                                                                    bottomLeft: Radius.circular(70),
                                                                    bottomRight: Radius.circular(70),
                                                                  ),
                                                                  color : Color.fromRGBO(185, 192, 202, 0.20000000298023224),
                                                                )
                                                            )
                                                        ),Positioned(
                                                            top: 0,
                                                            left: 34.3782958984375,
                                                            child: Container(
                                                                width: 25.783782958984375,
                                                                height: 25.783782958984375,
                                                                decoration: BoxDecoration(
                                                                  color : Color.fromRGBO(76, 207, 211, 1),
                                                                  borderRadius : BorderRadius.all(Radius.elliptical(25.783782958984375, 25.783782958984375)),
                                                                )
                                                            )
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 50,
                                              left: 260,
                                              child: Text(' >/ выполнено', textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(185, 192, 202, 1),
                                                  fontFamily: 'Roboto',
                                                  fontSize: 12,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 327,
                                left: 0,
                                child: Container(
                                    width: 360,
                                    height: 159,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                  width: 360,
                                                  height: 159,
                                                  decoration: BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(10),
                                                      topRight: Radius.circular(10),
                                                      bottomLeft: Radius.circular(10),
                                                      bottomRight: Radius.circular(10),
                                                    ),
                                                    color : Color.fromRGBO(250, 250, 250, 1),
                                                  )
                                              )
                                          ),Positioned(
                                              top: 136,
                                              left: 64,
                                              child: Container(
                                                  width: 150,
                                                  height: 4,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 1,
                                                            left: 0,
                                                            child: Container(
                                                                width: 111,
                                                                height: 2,
                                                                decoration: BoxDecoration(
                                                                  borderRadius : BorderRadius.only(
                                                                    topLeft: Radius.circular(3),
                                                                    topRight: Radius.circular(3),
                                                                    bottomLeft: Radius.circular(3),
                                                                    bottomRight: Radius.circular(3),
                                                                  ),
                                                                  color : Color.fromRGBO(185, 192, 202, 1),
                                                                )
                                                            )
                                                        ),Positioned(
                                                            top: 0,
                                                            left: 125,
                                                            child: Container(
                                                                width: 4,
                                                                height: 4,
                                                                decoration: BoxDecoration(
                                                                  borderRadius : BorderRadius.only(
                                                                    topLeft: Radius.circular(3),
                                                                    topRight: Radius.circular(3),
                                                                    bottomLeft: Radius.circular(3),
                                                                    bottomRight: Radius.circular(3),
                                                                  ),
                                                                  color : Color.fromRGBO(185, 191, 202, 1),
                                                                )
                                                            )
                                                        ),Positioned(
                                                            top: 0,
                                                            left: 146,
                                                            child: Container(
                                                                width: 4,
                                                                height: 4,
                                                                decoration: BoxDecoration(
                                                                  borderRadius : BorderRadius.only(
                                                                    topLeft: Radius.circular(3),
                                                                    topRight: Radius.circular(3),
                                                                    bottomLeft: Radius.circular(3),
                                                                    bottomRight: Radius.circular(3),
                                                                  ),
                                                                  color : Color.fromRGBO(185, 191, 202, 1),
                                                                )
                                                            )
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 133.21630859375,
                                              left: 17.189208984375,
                                              child: Container(
                                                  width: 47.27027130126953,
                                                  height: 8.594594955444336,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            child: Container(
                                                                width: 47.27027130126953,
                                                                height: 8.594594955444336,
                                                                decoration: BoxDecoration(
                                                                  borderRadius : BorderRadius.only(
                                                                    topLeft: Radius.circular(20),
                                                                    topRight: Radius.circular(20),
                                                                    bottomLeft: Radius.circular(20),
                                                                    bottomRight: Radius.circular(20),
                                                                  ),
                                                                  color : Color.fromRGBO(76, 207, 211, 1),
                                                                )
                                                            )
                                                        ),Positioned(
                                                            top: -0.00009237753693014383,
                                                            left: 7.52025032043457,
                                                            child: Container()
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 64.45945739746094,
                                              left: 17.189189910888672,
                                              child: Transform.rotate(
                                                angle: -1.0031667522032328e-13 * (math.pi / 180),
                                                child: Text('Learning Design', textAlign: TextAlign.left, style: TextStyle(
                                                    color: Color.fromRGBO(62, 39, 148, 1),
                                                    fontFamily: 'Roboto',
                                                    fontSize: 14,
                                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight: FontWeight.normal,
                                                    height: 1.7142857142857142
                                                ),),
                                              )
                                          ),Positioned(
                                              top: 98.83783721923828,
                                              left: 17.189189910888672,
                                              child: Text('Finishing reading How to Make Great Icon', textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(185, 192, 202, 1),
                                                  fontFamily: 'Roboto',
                                                  fontSize: 12,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),Positioned(
                                              top: 17.189189910888672,
                                              left: 17.189189910888672,
                                              child: Container(
                                                  width: 162.2229766845703,
                                                  height: 38.67567443847656,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 6.039613253960852e-14,
                                                            child: Transform.rotate(
                                                              angle: -1.0031667522032328e-13 * (math.pi / 180),
                                                              child: Text('15:00', textAlign: TextAlign.left, style: TextStyle(
                                                                  color: Color.fromRGBO(79, 79, 79, 1),
                                                                  fontFamily: 'Roboto',
                                                                  fontSize: 24,
                                                                  letterSpacing: 1,
                                                                  fontWeight: FontWeight.normal,
                                                                  height: 1.5 /*PERCENT not supported*/
                                                              ),),
                                                            )
                                                        ),Positioned(
                                                            top: 17.96630859375,
                                                            left: 77.351318359375,
                                                            child: Text('24 Sept 2020', textAlign: TextAlign.left, style: TextStyle(
                                                                color: Color.fromRGBO(185, 192, 202, 1),
                                                                fontFamily: 'Roboto',
                                                                fontSize: 12,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight: FontWeight.normal,
                                                                height: 1
                                                            ),)
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 23.63501739501953,
                                              left: 282.54730224609375,
                                              child: Container(
                                                  width: 60.16216278076172,
                                                  height: 25.784021377563477,

                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0.0002375422336626798,
                                                            left: 0,
                                                            child: Container(
                                                                width: 60.16216278076172,
                                                                height: 25.783782958984375,
                                                                decoration: BoxDecoration(
                                                                  borderRadius : BorderRadius.only(
                                                                    topLeft: Radius.circular(70),
                                                                    topRight: Radius.circular(70),
                                                                    bottomLeft: Radius.circular(70),
                                                                    bottomRight: Radius.circular(70),
                                                                  ),
                                                                  color : Color.fromRGBO(185, 192, 202, 0.20000000298023224),
                                                                )
                                                            )
                                                        ),Positioned(
                                                            top: 0,
                                                            left: 34.3782958984375,
                                                            child: Container(
                                                                width: 25.783782958984375,
                                                                height: 25.783782958984375,
                                                                decoration: BoxDecoration(
                                                                  color : Color.fromRGBO(76, 207, 211, 1),
                                                                  borderRadius : BorderRadius.all(Radius.elliptical(25.783782958984375, 25.783782958984375)),
                                                                )
                                                            )
                                                        ),
                                                      ]
                                                  )
                                              )
                                          ),Positioned(
                                              top: 50,
                                              left: 260,
                                              child: Text(' >/ выполнено', textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(185, 192, 202, 1),
                                                  fontFamily: 'Roboto',
                                                  fontSize: 12,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),
                                        ]
                                    )
                                )
                            ),ListItem(),
                          ]
                      )
                  )
              ),
              // Here was something with the oval asset
              //White filling on top
              Positioned(
                  top: -7,
                  left: -8,
                  child: Container(
                      width: 373,
                      height: 228,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(255, 255, 255, 1),
                      )
                  )
              ),
              //Wiggly rectangle on top
              Positioned(
                  top: 0,
                  left: 0,
                  child: SvgPicture.asset(
                      'assets/images/Placeholder.svg',
                      semanticsLabel: 'Placeholder'
                  )
              ),
              // Gear icon
              Positioned(
                  top: 34,
                  left: 310,

                  child: CircleButton(
                    diameter: 40,
                    color: Color.fromRGBO(255, 255, 255, 0.3),

                    icon: SvgPicture.asset(
                        'assets/images/vector.svg',
                        semanticsLabel: 'vector'
                    ),
                    iconTop: 12,
                    iconLeft: 12,
                  )
              ),
              //Pen icon
              Positioned(
                  top: 34,
                  left: 254,

                  child: CircleButton(
                    diameter: 40,
                    color: Color.fromRGBO(76, 207, 211, 1),

                    icon: SvgPicture.asset(
                        'assets/images/vector_pen.svg',
                        semanticsLabel: 'vector_pen'
                    ),
                    iconTop: 12,
                    iconLeft: 12,
                    onTap: ()=>print("Tapped!"),
                  ),

              ),Positioned(
                  top: 149,
                  left: 254,
                  child: Text(' >/ выполнено', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(185, 192, 202, 1),
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                    ),
                  )
              ),Positioned(
                  top: 142,
                  left: 161,
                  child: Text('75%', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(76, 207, 211, 1),
                      fontFamily: 'Roboto',
                      fontSize: 50,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),
              //Fancy wiggly lines on top
              Positioned(
                  top: -7,
                  left: 44,
                  child: SvgPicture.asset(
                      'assets/images/vector1.svg',
                      semanticsLabel: 'vector1'
                  )
                  //Circles
              ),
              CircleStatusWidget(),
              //Bell
              Positioned(
                  top: 130,
                  left: 49,
                  child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: SvgPicture.asset(
                                    'assets/images/Notification.svg',
                                    semanticsLabel: 'Notification'
                                )
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 32,
                  left: 16,
                  child: Text('MEPhI >/', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Roboto',
                      fontSize: 35,
                      letterSpacing: -1,
                      fontWeight: FontWeight.normal,
                      height: 1.3714285714285714
                  ),)
              ),

            ]
        )
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 164,
        left: 0,
        child: Container(
            width: 360,
            height: 159,

            child: Stack(
                children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                          width: 360,
                          height: 159,
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color : Color.fromRGBO(250, 250, 250, 1),
                          )
                      )
                  ),Positioned(
                      top: 136,
                      left: 64,
                      child: Container(
                          width: 150,
                          height: 4,

                          child: Stack(
                              children: <Widget>[
                                Positioned(
                                    top: 1,
                                    left: 0,
                                    child: Container(
                                        width: 111,
                                        height: 2,
                                        decoration: BoxDecoration(
                                          borderRadius : BorderRadius.only(
                                            topLeft: Radius.circular(3),
                                            topRight: Radius.circular(3),
                                            bottomLeft: Radius.circular(3),
                                            bottomRight: Radius.circular(3),
                                          ),
                                          color : Color.fromRGBO(185, 192, 202, 1),
                                        )
                                    )
                                ),Positioned(
                                    top: 0,
                                    left: 125,
                                    child: Container(
                                        width: 4,
                                        height: 4,
                                        decoration: BoxDecoration(
                                          borderRadius : BorderRadius.only(
                                            topLeft: Radius.circular(3),
                                            topRight: Radius.circular(3),
                                            bottomLeft: Radius.circular(3),
                                            bottomRight: Radius.circular(3),
                                          ),
                                          color : Color.fromRGBO(185, 191, 202, 1),
                                        )
                                    )
                                ),Positioned(
                                    top: 0,
                                    left: 146,
                                    child: Container(
                                        width: 4,
                                        height: 4,
                                        decoration: BoxDecoration(
                                          borderRadius : BorderRadius.only(
                                            topLeft: Radius.circular(3),
                                            topRight: Radius.circular(3),
                                            bottomLeft: Radius.circular(3),
                                            bottomRight: Radius.circular(3),
                                          ),
                                          color : Color.fromRGBO(185, 191, 202, 1),
                                        )
                                    )
                                ),
                              ]
                          )
                      )
                  ),Positioned(
                      top: 133.21630859375,
                      left: 17.189208984375,
                      child: Container(
                          width: 47.27027130126953,
                          height: 8.594594955444336,

                          child: Stack(
                              children: <Widget>[
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                        width: 47.27027130126953,
                                        height: 8.594594955444336,
                                        decoration: BoxDecoration(
                                          borderRadius : BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                          color : Color.fromRGBO(242, 66, 106, 1),
                                        )
                                    )
                                ),Positioned(
                                    top: -0.00009237753693014383,
                                    left: 7.52025032043457,
                                    child: Container()
                                ),
                              ]
                          )
                      )
                  ),Positioned(
                      top: 64.45945739746094,
                      left: 17.189189910888672,
                      child: Transform.rotate(
                        angle: -1.0031667522032328e-13 * (math.pi / 180),
                        child: Text('Learning Design', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(62, 39, 148, 1),
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1.7142857142857142
                        ),),
                      )
                  ),Positioned(
                      top: 98.83783721923828,
                      left: 17.189189910888672,
                      child: Text('Finishing reading How to Make Great Icon', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(185, 192, 202, 1),
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),)
                  ),Positioned(
                      top: 17.189189910888672,
                      left: 17.189189910888672,
                      child: Container(
                          width: 162.2229766845703,
                          height: 38.67567443847656,

                          child: Stack(
                              children: <Widget>[
                                Positioned(
                                    top: 0,
                                    left: 6.039613253960852e-14,
                                    child: Transform.rotate(
                                      angle: -1.0031667522032328e-13 * (math.pi / 180),
                                      child: Text('15:00', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(79, 79, 79, 1),
                                          fontFamily: 'Roboto',
                                          fontSize: 24,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.normal,
                                          height: 1.5 /*PERCENT not supported*/
                                      ),),
                                    )
                                ),Positioned(
                                    top: 17.96630859375,
                                    left: 77.351318359375,
                                    child: Text('24 Sept 2020', textAlign: TextAlign.left, style: TextStyle(
                                        color: Color.fromRGBO(185, 192, 202, 1),
                                        fontFamily: 'Roboto',
                                        fontSize: 12,
                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1
                                    ),)
                                ),
                              ]
                          )
                      )
                  ),Positioned(
                      top: 23.63501739501953,
                      left: 282.54730224609375,
                      child: Container(
                          width: 60.16216278076172,
                          height: 25.784021377563477,

                          child: Stack(
                              children: <Widget>[
                                Positioned(
                                    top: 0.0002375422336626798,
                                    left: 0,
                                    child: Container(
                                        width: 60.16216278076172,
                                        height: 25.783782958984375,
                                        decoration: BoxDecoration(
                                          borderRadius : BorderRadius.only(
                                            topLeft: Radius.circular(70),
                                            topRight: Radius.circular(70),
                                            bottomLeft: Radius.circular(70),
                                            bottomRight: Radius.circular(70),
                                          ),
                                          color : Color.fromRGBO(185, 192, 202, 0.20000000298023224),
                                        )
                                    )
                                ),Positioned(
                                    top: 0,
                                    left: 0.3782958984375,
                                    child: Container(
                                        width: 25.783782958984375,
                                        height: 25.783782958984375,
                                        decoration: BoxDecoration(
                                          color : Color.fromRGBO(242, 66, 106, 1),
                                          borderRadius : BorderRadius.all(Radius.elliptical(25.783782958984375, 25.783782958984375)),
                                        )
                                    )
                                ),
                              ]
                          )
                      )
                  ),Positioned(
                      top: 50,
                      left: 260,
                      child: Text(' >/ выполнить', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(185, 192, 202, 1),
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),)
                  ),
                ]
            )
        )
    );
  }
}

