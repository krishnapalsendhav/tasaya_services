// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_login_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceLoginAdapter extends TypeAdapter<ServiceLogin> {
  @override
  final int typeId = 1;

  @override
  ServiceLogin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServiceLogin(
      responseCode: fields[1] as int?,
      responseMessage: fields[2] as String?,
      status: fields[3] as bool?,
      user: fields[4] as User?,
    );
  }

  @override
  void write(BinaryWriter writer, ServiceLogin obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.responseCode)
      ..writeByte(2)
      ..write(obj.responseMessage)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceLoginAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 2;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      aadhar: fields[1] as Aadhar?,
      pan: fields[2] as Aadhar?,
      bankDetails: fields[3] as BankDetails?,
      address: fields[4] as Address?,
      experience: fields[5] as Experience?,
      id: fields[6] as String?,
      name: fields[7] as String?,
      email: fields[8] as String?,
      password: fields[9] as String?,
      phone: fields[10] as int?,
      avatar: fields[11] as String?,
      date: fields[12] as DateTime?,
      v: fields[13] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(13)
      ..writeByte(1)
      ..write(obj.aadhar)
      ..writeByte(2)
      ..write(obj.pan)
      ..writeByte(3)
      ..write(obj.bankDetails)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.experience)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.email)
      ..writeByte(9)
      ..write(obj.password)
      ..writeByte(10)
      ..write(obj.phone)
      ..writeByte(11)
      ..write(obj.avatar)
      ..writeByte(12)
      ..write(obj.date)
      ..writeByte(13)
      ..write(obj.v);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AadharAdapter extends TypeAdapter<Aadhar> {
  @override
  final int typeId = 3;

  @override
  Aadhar read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Aadhar(
      img: fields[1] as String?,
      number: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Aadhar obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.img)
      ..writeByte(2)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AadharAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 4;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      latlang: fields[1] as Latlang?,
      addressLine: fields[2] as String?,
      city: fields[3] as String?,
      state: fields[4] as String?,
      pincode: fields[5] as int?,
      locality: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.latlang)
      ..writeByte(2)
      ..write(obj.addressLine)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.state)
      ..writeByte(5)
      ..write(obj.pincode)
      ..writeByte(6)
      ..write(obj.locality);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LatlangAdapter extends TypeAdapter<Latlang> {
  @override
  final int typeId = 5;

  @override
  Latlang read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Latlang(
      latitude: fields[1] as double?,
      longitude: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Latlang obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.latitude)
      ..writeByte(2)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LatlangAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BankDetailsAdapter extends TypeAdapter<BankDetails> {
  @override
  final int typeId = 6;

  @override
  BankDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BankDetails(
      accountHolderName: fields[1] as String?,
      accountNumber: fields[2] as String?,
      ifscCode: fields[3] as String?,
      registerMobileNumber: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BankDetails obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.accountHolderName)
      ..writeByte(2)
      ..write(obj.accountNumber)
      ..writeByte(3)
      ..write(obj.ifscCode)
      ..writeByte(4)
      ..write(obj.registerMobileNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExperienceAdapter extends TypeAdapter<Experience> {
  @override
  final int typeId = 7;

  @override
  Experience read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Experience(
      category: fields[1] as Category?,
      time: fields[2] as double?,
      location: fields[3] as String?,
      description: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Experience obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.location)
      ..writeByte(4)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExperienceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 8;

  @override
  Category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category(
      name: fields[1] as String?,
      id: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
