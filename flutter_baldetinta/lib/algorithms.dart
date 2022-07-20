import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

class BucketFill {
  final List<Offset> _points = <Offset>[];
  List<MapEntry<Path, Paint>> paths = <MapEntry<Path, Paint>>[];
  late Uint32List words;
  late Color oldColor, pixel;
  late int imageWidth = 0;
  late int imageHeight = 0;

  Future<List<Offset>> capturePng(GlobalKey key, Offset offset) async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      final rgbaImageData =
          await image.toByteData(format: ui.ImageByteFormat.rawRgba);
      imageHeight = image.height;
      imageWidth = image.width;

      words = Uint32List.view(
          rgbaImageData!.buffer,
          rgbaImageData.offsetInBytes,
          rgbaImageData.lengthInBytes ~/ Uint32List.bytesPerElement);
      oldColor = await _getColor(words, offset.dx, offset.dy);
    } catch (r) {}
    return await _floodfill(oldColor, offset.dx, offset.dy);
  }

  limpar() {
    paths.clear();
  }

  Color _getColor(Uint32List words, double x1, double y1) {
    int x = x1.toInt();
    int y = y1.toInt();
    var offset = x + y * imageWidth;
    return Color(words[offset]);
  }

  // flood fill 4 or 8 connected method uisng recursion
  List<Offset> _floodfill(Color oldColor, double x, double y) {
    try {
      if ((x >= 0 &&
              x < imageWidth &&
              y >= 0 &&
              y < imageHeight &&
              !_points.contains(Offset(x, y)))
          ? _getColor(words, x, y) == oldColor
          : false) {
        _points.add(Offset(x, y));
        _floodfill(oldColor, x + 4, y);
        _floodfill(oldColor, x - 4, y);
        _floodfill(oldColor, x, y + 4);
        _floodfill(oldColor, x, y - 4);
      }
    } catch (e) {
      print("erros: " + e.toString());
    }

    return _points;
  }

  //Boundary Fill algorithm
  // List<Offset> _floodfill(Color oldColor, double x, double y) {
  //   if ( _getColor(words, x, y) == oldColor && !_points.contains(Offset(x, y))) {
  //     _points.add(Offset(x, y));
  //     _floodfill(oldColor, x + 4, y);
  //     _floodfill(oldColor, x - 4, y);
  //     _floodfill(oldColor, x, y + 4);
  //     _floodfill(oldColor, x, y - 4);
  //   }
  //   return _points;
  // }

  // List<Offset> _floodfill(Color oldColor, double x, double y) {
  //   Queue<Offset> queue = new Queue();
  //   Offset temp;
  //   queue.add(Offset(x, y));
  //   _points = List.from(_points)..add(queue.first);
  //   while (queue.isNotEmpty) {
  //     temp = queue.first;
  //     queue.removeFirst();
  //     if (_shouldFillColor(temp.dx + 2, temp.dy)) {
  //       queue.add(Offset(temp.dx + 2, temp.dy));
  //       _points.add(Offset(temp.dx + 2, temp.dy));
  //     }
  //     if (_shouldFillColor(temp.dx - 2, temp.dy)) {
  //       queue.add(Offset(temp.dx - 2, temp.dy));
  //       _points.add(Offset(temp.dx - 2, temp.dy));
  //     }
  //     if (_shouldFillColor(temp.dx, temp.dy + 2)) {
  //       queue.add(Offset(temp.dx, temp.dy + 2));
  //       _points.add(Offset(temp.dx, temp.dy + 2));
  //     }
  //     if (_shouldFillColor(temp.dx, temp.dy - 2)) {
  //       queue.add(Offset(temp.dx, temp.dy - 2));
  //       _points.add(Offset(temp.dx, temp.dy - 2));
  //     }
  //   }
  //   _points.add(null);
  //   return _points;
  // }

  // bool _shouldFillColor(double x, double y) {
  //   return (x >= 0 &&
  //           x < imageWidth &&
  //           y >= 0 &&
  //           y < imageHeight &&
  //           !_points.contains(Offset(x, y)))
  //       ? _getColor(words, x, y) == oldColor
  //       : false;
  // }

//  List<Offset> _floodfill(Color oldColor, double x, double y) {
//     Queue<Offset> queue = new Queue();
//     Color targetColor = Colors.blue;
//      queue.add(Offset(x, y));

//     if (targetColor != _getColor(words, x, y)) {

//       while (queue.isNotEmpty) {

//         double x1 = x;
//         double y1 = y;

//         while (x1 > 0  && _getColor(words, x1 - 1, y1) == targetColor) {
//           x1--;
//         }

//         bool spanUp = false;
//         bool spanDown = false;
//         while (x1 < imageWidth && _getColor(words, x1, y1) == targetColor) {
//           _points = List.from(_points)..add(queue.first);
//           if (!spanUp && y1 > 0 && _getColor(words, x1, y1 - 1) != targetColor) {
//             queue.add(Offset(x1, y1 - 1));
//             spanUp = true;
//           } else if (spanUp && y1 > 0 && _getColor(words, x1, y1 - 1) != targetColor) {
//             spanUp = false;
//           }

//           if (!spanDown && y1 < imageHeight - 1 && _getColor(words, x1, y1 + 1) == targetColor) {
//             queue.add(Offset(x1, y1 + 1));
//             spanDown = true;
//           } else if (spanDown && y1 < imageHeight - 1 && _getColor(words, x1, y1 + 1) != targetColor) {
//             spanDown = false;
//           }
//           x1++;
//         }
//       }
//     }
//     _points.add(null);
//     return _points;
//   }

}

// aqui é como se fosse o antigo painter

class CurrentPathState extends ChangeNotifier {
  PathHistory pathHistory = PathHistory();
  Color _drawColor = const Color.fromARGB(255, 0, 0, 0);
  Color _backgroundColor = const Color.fromARGB(255, 255, 255, 255);
  bool _modoBorracha = false;
  double _thickness = 4.0;
  StrokeCap strokeCapVar = StrokeCap.round;
  StrokeJoin strokeJoinVar = StrokeJoin.round;

  CurrentPathState() {
    pathHistory = PathHistory();

    _backgroundColor = const Color.fromARGB(255, 255, 255, 255);

    thickness = 4.0;
  }

  bool get eraseMode => _modoBorracha;

  set eraseMode(bool enabled) {
    _modoBorracha = enabled;
    updatePaint();
  }

  Color get drawColor => _drawColor;
  set drawColor(Color color) {
    _drawColor = color;
    updatePaint();
  }

  StrokeCap get strokeCapMode => strokeCapVar;
  set strokeCapMode(StrokeCap enabled) {
    strokeCapVar = enabled;
    updatePaint();
  }

  StrokeJoin get strokeJoinMode => strokeJoinVar;
  set strokeJoinMode(StrokeJoin enabled) {
    strokeJoinVar = enabled;
    updatePaint();
  }

  Color get backgroundColor => _backgroundColor;
  set backgroundColor(Color color) {
    _backgroundColor = color;
    updatePaint();
  }

  double get thickness => _thickness;
  set thickness(double t) {
    _thickness = t;
    updatePaint();
  }

  boldtinta(GlobalKey key, Offset offset) {
    pathHistory.capturePng(key, offset);

    notifyListeners();
  }

  void updatePaint() {
    Paint paint = Paint();

    paint.color = Colors.blue;

    paint.strokeJoin = StrokeJoin.round;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 4;
    paint.strokeCap = StrokeCap.round;
    paint.filterQuality = FilterQuality.high;
    paint.isAntiAlias = true;
    pathHistory.setBackgroundColor(backgroundColor);
    pathHistory.currentPaint = paint;
    notifyListeners();
  }

  void undo() {
    pathHistory.voltar();
    notifyList();
  }

  void redo() {
    pathHistory.redo();
    notifyList();
  }

  void notifyList() {
    notifyListeners();
  }
}

class PathHistory {
  List<MapEntry<Path, Paint>> paths = <MapEntry<Path, Paint>>[];
  List<MapEntry<Path, Paint>> _undone = <MapEntry<Path, Paint>>[];
  bool inDrag = false;
  Paint backgroundPaint1 = Paint();
  Paint currentPaint = Paint();
  Path pathmove = Path();
  Offset previousOffset = const Offset(0, 0);
  late Uint32List words;
  late int width;
  late Color oldColor, pixel;
  late int imageWidth;
  late int imageHeight;

  PathHistory() {
    paths = <MapEntry<Path, Paint>>[];
    _undone = <MapEntry<Path, Paint>>[];
    inDrag = false;

    backgroundPaint1 = Paint()..blendMode = BlendMode.dstOver;
  }
  bool canUndo() => paths.isNotEmpty;
  voltar() {
    if (canUndo()) {
      _undone.add(paths.removeLast());
    }
  }

  bool canRedo() => _undone.isNotEmpty;
  redo() {
    if (canRedo()) {
      paths.add(_undone.removeLast());
    }
  }

  capturePng(GlobalKey key, Offset offset) async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      final rgbaImageData =
          await image.toByteData(format: ui.ImageByteFormat.rawRgba);
      imageHeight = image.height;
      imageWidth = image.width;
      words = Uint32List.view(
          rgbaImageData!.buffer,
          rgbaImageData.offsetInBytes,
          rgbaImageData.lengthInBytes ~/ Uint32List.bytesPerElement);
      oldColor = _getColor(words, offset.dx, offset.dy);

      _floodfill(oldColor, offset.dx, offset.dy);
    } catch (e) {
      print("erros:" + e.toString());
    }
  }

  List<MapEntry<Path, Paint>> get points => paths;

  setBackgroundColor(Color backgroundColor) {
    backgroundPaint1.color = backgroundColor;
  }

  Color _getColor(Uint32List words, double x1, double y1) {
    int x = x1.toInt();
    int y = y1.toInt();
    var offset = x + y * imageWidth;
    return Color(words[offset]);
  }

  adicionar(Offset startPoint) {
    if (!inDrag) {
      inDrag = true;
      pathmove = Path()..moveTo(startPoint.dx, startPoint.dy);
      paths.add(MapEntry<Path, Paint>(pathmove, currentPaint));
    }
  }

  updateCurrent(Offset nextPoint) {
    var dx = nextPoint.dx;
    var dy = nextPoint.dy;

    if (previousOffset == const Offset(0, 0)) {
      pathmove.lineTo(dx, dy);
    } else {
      var previousDx = previousOffset.dx;
      var previousDy = previousOffset.dy;

      pathmove.quadraticBezierTo(
        previousDx,
        previousDy,
        (previousDx + dx) / 2,
        (previousDy + dy) / 2,
      );
    }
    previousOffset = nextPoint;
  }

  resetPoints() {
    inDrag = false;
    pathmove = Path();
    previousOffset = const Offset(0, 0);
  }

  List<MapEntry<Path, Paint>> _floodfill(Color oldColor, double x, double y) {
    if ((x >= 0 &&
            x < imageWidth &&
            y >= 0 &&
            y < imageHeight &&
            !pathmove.contains(Offset(x, y)))
        ? _getColor(words, x, y) == oldColor
        : false) {
      adicionar(Offset(x, y));
      updateCurrent(Offset(x, y));
      _floodfill(oldColor, x + 4, y);
      _floodfill(oldColor, x - 4, y);
      _floodfill(oldColor, x, y + 4);
      _floodfill(oldColor, x, y - 4);
    }
    return paths;
  }

  draw(Canvas canvas, Size size) {
    for (MapEntry<Path, Paint> path in paths) {
      Paint p = path.value;
      canvas.drawPath(path.key, p);
    }
  }
}
