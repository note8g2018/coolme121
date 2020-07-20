// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Person_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonAdapter extends TypeAdapter<Person> {
  @override
  Person read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person(
      userName: fields[1] as String,
      email: fields[2] as String,
      id: fields[0] as String,
      passWord: fields[3] as String,
      isLogin: fields[4] as bool,
      result: fields[5] as bool,
      method: fields[6] as String,
      desc: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.passWord)
      ..writeByte(4)
      ..write(obj.isLogin)
      ..writeByte(5)
      ..write(obj.result)
      ..writeByte(6)
      ..write(obj.method)
      ..writeByte(7)
      ..write(obj.desc);
  }
}
