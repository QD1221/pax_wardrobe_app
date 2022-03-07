import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pax_wardrobe_app/src/model/basic.dart';

final basicProvider = StateNotifierProvider<BasicController, Basic>(
  (ref) => BasicController(
    Basic(
      width: 200,
      height: 1,
      depth: 0,
      frameColor: 0,
    ),
  ),
);

class BasicController extends StateNotifier<Basic> {
  BasicController(Basic state) : super(state);

  updateWidth(double d) {
    state = state.copyWith(width: d);
  }

  updateHeight(int index) {
    state = state.copyWith(height: index);
  }

  updateDepth(int index) {
    state = state.copyWith(depth: index);
  }

  updateFrame(int index){
    state = state.copyWith(frameColor: index);
  }
}
