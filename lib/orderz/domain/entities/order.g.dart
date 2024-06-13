// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderEntityAdapter extends TypeAdapter<OrderEntity> {
  @override
  final int typeId = 3;

  @override
  OrderEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderEntity(
      name: fields[1] as String,
      contact: fields[2] as String,
      isFulfilled: fields[4] as bool,
      total: fields[3] as double,
      id: fields[0] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, OrderEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.contact)
      ..writeByte(3)
      ..write(obj.total)
      ..writeByte(4)
      ..write(obj.isFulfilled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
