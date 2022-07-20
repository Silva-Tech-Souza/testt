import 'package:flutter/material.dart';

import 'algorithms.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

CurrentPathState? controller;

class _HomePageState extends State<HomePage> {
  List<Offset> _points = <Offset>[];
  GlobalKey floodFillKey = GlobalKey();
  CurrentPathState _newController() {
    CurrentPathState controller = CurrentPathState();
    controller.thickness = 4.0;
    controller.backgroundColor = Colors.white;
    return controller;
  }

  _ondtap(Offset offset, GlobalKey key) async {
    try {
      await BucketFill()
          .capturePng(key, Offset(offset.dx, offset.dy))
          .then((value) {
        value.forEach((element) {
          controller!.pathHistory.updateCurrent(element);
          controller!.notifyListeners();
        });
      });
      BucketFill().limpar();
      controller!.notifyListeners();
      setState(() {});
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    controller = _newController();
  }

  bool balde = false;
  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width;
    var sizeH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: sizeW,
        height: sizeH,
        child: RepaintBoundary(
          key: floodFillKey,
          child: Container(
            child: GestureDetector(
              onPanStart: (DragStartDetails start) {
                Offset pos = (context.findRenderObject() as RenderBox)
                    .globalToLocal(start.localPosition);
                if (balde) {
                  _ondtap(pos, floodFillKey);
                  controller!.pathHistory.adicionar(pos);
                  controller!.notifyListeners();
                } else {
                  controller!.pathHistory.adicionar(pos);
                  controller!.notifyListeners();
                  controller!.pathHistory.updateCurrent(pos);
                  controller!.notifyListeners();
                }
              },
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  Offset pos =
                      (context.findRenderObject() as RenderBox).localToGlobal(
                    details.localPosition,
                  );

                  controller!.pathHistory.updateCurrent(pos);
                  controller!.notifyListeners();
                });
              },
              onPanEnd: (DragEndDetails details) {
                controller!.pathHistory.resetPoints();
                controller!.notifyListeners();
              },
              child: CustomPaint(
                painter: CurrentPathPainter(
                    controller!.pathHistory), // Signature(points: _points),
                size: Size.infinite,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.clear),
          onPressed: () {
            setState(() {
              if (balde) {
                balde = false;
              } else {
                balde = true;
              }
            });
          }),
    );
  }
}

class Signature extends CustomPainter {
  List<Offset> points;

  Signature({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) => oldDelegate.points != points;
}

class CurrentPathPainter extends CustomPainter {
  final PathHistory _path;

  CurrentPathPainter(this._path);

  @override
  void paint(Canvas canvas, Size size) {
    _path.draw(canvas, size);
  }

  @override
  bool shouldRepaint(CurrentPathPainter oldDelegate) => true;
}
