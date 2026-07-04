import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LoginInputCursor {
  LoginInputCursor._();

  static void placeAtTap({
    required TextEditingController controller,
    required GlobalKey fieldKey,
    required Offset? tapPosition,
  }) {
    final text = controller.text;
    if (text.isEmpty) return;

    final selection = controller.selection;
    if (selection.isCollapsed) return;

    final offset =
        textOffsetForTap(fieldKey: fieldKey, tapPosition: tapPosition) ??
        selection.extentOffset;
    controller.selection = TextSelection.collapsed(
      offset: offset.clamp(0, text.length),
    );
  }

  static int? textOffsetForTap({
    required GlobalKey fieldKey,
    required Offset? tapPosition,
  }) {
    if (tapPosition == null) return null;

    final fieldContext = fieldKey.currentContext;
    if (fieldContext == null) return null;

    final fieldBox = fieldContext.findRenderObject() as RenderBox?;
    if (fieldBox == null) return null;

    final renderEditable = _findRenderEditable(fieldBox);
    if (renderEditable == null) return null;

    final globalPosition = fieldBox.localToGlobal(tapPosition);
    final editablePosition = renderEditable.globalToLocal(globalPosition);
    return renderEditable.getPositionForPoint(editablePosition).offset;
  }

  static RenderEditable? _findRenderEditable(RenderObject root) {
    RenderEditable? result;
    void visitor(RenderObject child) {
      if (result != null) return;
      if (child is RenderEditable) {
        result = child;
        return;
      }
      child.visitChildren(visitor);
    }

    visitor(root);
    return result;
  }
}
