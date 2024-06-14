import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class IconDataAdapter extends TypeAdapter<IconData> {
  @override
  final int typeId = 2;

  @override
  IconData read(BinaryReader reader) {
    int codePoint = reader.readInt32();
    String fontFamily = reader.readString();
    String fontPackage = reader.readString();
    bool matchTextDirection = reader.readBool();
    return IconData(
      codePoint,
      fontFamily: fontFamily,
      fontPackage: fontPackage.isEmpty ? null : fontPackage,
      matchTextDirection: matchTextDirection,
    );
  }

  @override
  void write(BinaryWriter writer, IconData obj) {
    writer.writeInt32(obj.codePoint);
    writer.writeString(obj.fontFamily ?? '');
    writer.writeString(obj.fontPackage ?? '');
    writer.writeBool(obj.matchTextDirection);
  }
}
