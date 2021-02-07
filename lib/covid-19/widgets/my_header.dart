import 'package:flutter/material.dart';
import 'package:flutter_app/covid-19/constant.dart';
import 'package:flutter_app/covid-19/info_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHeader extends StatefulWidget {
  final String textTop;
  final String textBottom;
  final double offset;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const MyHeader(
      {Key key, this.textTop, this.textBottom, this.offset, this.scaffoldKey})
      : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 40, right: 20),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.indigo[400],
              Colors.indigo[900],
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                widget.scaffoldKey.currentState.openDrawer();
              },
              child: SvgPicture.asset("assets/icons/menu.svg"),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Column(
                      children: [
                        Text(
                          "${widget.textTop}",
                          style: kHeadingTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${widget.textBottom}",
                          style: kHeadingTextStyle.copyWith(
                            color: Colors.indigo[200],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(), // I dont know why it can't work without container
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}