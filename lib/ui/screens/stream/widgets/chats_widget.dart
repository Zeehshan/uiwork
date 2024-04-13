import 'package:flutter/material.dart';
import 'dart:math' as math; // import this

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => index == 0
              ? const RecivedMessageWidget()
              : const SentMessageWidget(),
          childCount: 2),
    );
  }
}

class SentMessageWidget extends StatelessWidget {
  const SentMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 18, top: 1, bottom: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 30),
          Flexible(
            child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints:
                          const BoxConstraints(maxWidth: 300, minWidth: 100),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          bottomLeft: Radius.circular(6),
                          bottomRight: Radius.circular(6),
                        ),
                      ),
                      child: Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 20, left: 6, right: 6),
                            child: Text(
                              'Did you recived my meesage?',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Monstserrat',
                                  fontSize: 14),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Row(
                              children: [
                                Text('12:30 PM',
                                    textAlign: TextAlign.end,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: Colors.white,
                                          fontSize: 10,
                                        )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: CustomPaint(
                        painter: TrianglePainter(Colors.grey[300]!),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class RecivedMessageWidget extends StatelessWidget {
  const RecivedMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 18, top: 1, bottom: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 30),
          Flexible(
            child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: CustomPaint(
                        painter: TrianglePainter(Colors.grey[300]!),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 0),
                      constraints:
                          const BoxConstraints(maxWidth: 300, minWidth: 100),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(6),
                          bottomLeft: Radius.circular(6),
                          bottomRight: Radius.circular(6),
                        ),
                      ),
                      child: Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 20, left: 6, right: 6),
                            child: Text(
                              'Did you recived my meesage?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Monstserrat',
                                  fontSize: 14),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Row(
                              children: [
                                Text('12:30 PM',
                                    textAlign: TextAlign.end,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: Colors.black,
                                          fontSize: 10,
                                        )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color bgColor;

  TrianglePainter(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    var path = Path();
    path.lineTo(-5, 0);
    path.lineTo(0, 10);
    path.lineTo(5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
