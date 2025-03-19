// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_infomation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileInformation _$UserProfileInformationFromJson(
        Map<String, dynamic> json) =>
    UserProfileInformation(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['fullName'] as String? ?? '',
      fullNameEn: json['fullNameEn'] as String? ?? '',
      nickName: json['nickName'] as String? ?? '',
      idCardNumber: json['IDCardNumber'] as String? ?? '',
      taxId: json['taxId'] as String? ?? '',
      education: json['education'] as String? ?? '',
      educationInst: json['educationInst'] as String? ?? '',
      accountNo: json['accountNo'] as String? ?? '',
      bank: json['bank'] as String? ?? '',
      branch: json['branch'] as String? ?? '',
      accountType: json['accountType'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      email: json['email'] as String? ?? '',
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      gender: json['gender'] as String? ?? '',
      religion: json['religion'] as String? ?? '',
      maritalStatus: json['maritalStatus'] as String? ?? '',
      weight: (json['weight'] as num?)?.toDouble() ?? 0,
      height: (json['height'] as num?)?.toDouble() ?? 0,
      bloodGroup: json['bloodGroup'] as String? ?? '',
      congenitalDisease: json['congenitalDisease'] as String? ?? '',
      allergicFood: json['allergicFood'] as String? ?? '',
      hobby: json['hobby'] as String? ?? '',
      address: json['address'] as String? ?? '',
      addressSubDistrict: json['addressSubDistrict'] as String? ?? '',
      addressDistrict: json['addressDistrict'] as String? ?? '',
      addressProvince: json['addressProvince'] as String? ?? '',
      addressZipCode: json['addressZipCode'] as String? ?? '',
      nationalIDAddress: json['nationalIDAddress'] as String? ?? '',
      nationalIDAddressSubDistrict:
          json['nationalIDAddressSubDistrict'] as String? ?? '',
      nationalIDAddressDistrict:
          json['nationalIDAddressDistrict'] as String? ?? '',
      nationalIDAddressProvince:
          json['nationalIDAddressProvince'] as String? ?? '',
      nationalIDAddressZipCode:
          json['nationalIDAddressZipCode'] as String? ?? '',
      fullNamePersonEmegency1: json['fullNamePersonEmegency1'] as String? ?? '',
      phonePersonEmegency1: json['phonePersonEmegency1'] as String? ?? '',
      relationshipPersonEmegency1:
          json['relationshipPersonEmegency1'] as String? ?? '',
      fullNamePersonEmegency2: json['fullNamePersonEmegency2'] as String? ?? '',
      phonePersonEmegency2: json['phonePersonEmegency2'] as String? ?? '',
      relationshipPersonEmegency2:
          json['relationshipPersonEmegency2'] as String? ?? '',
      idCardImage: json['idCardImage'] as String? ?? '',
      houseRegImage: json['houseRegImage'] as String? ?? '',
      motorcycleLicenseImage: json['motorcycleLicenseImage'] as String? ?? '',
      carLicenseImage: json['carLicenseImage'] as String? ?? '',
      hospital: json['hospital'] as String? ?? '',
      hospital1: json['hospital1'] as String? ?? '',
      hospital2: json['hospital2'] as String? ?? '',
      hospital3: json['hospital3'] as String? ?? '',
      beneficiary: json['beneficiary'] as String? ?? '',
      relationship: json['relationship'] as String? ?? '',
      personalCarRegistration: json['personalCarRegistration'] as String? ?? '',
      personalMotorcycleRegistration:
          json['personalMotorcycleRegistration'] as String? ?? '',
    )..prefixNameTH = json['prefixNameTH'] == null
        ? null
        : PrefixNameTH.fromJson(json['prefixNameTH'] as Map<String, dynamic>);

Map<String, dynamic> _$UserProfileInformationToJson(
        UserProfileInformation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prefixNameTH': instance.prefixNameTH,
      'fullName': instance.fullName,
      'fullNameEn': instance.fullNameEn,
      'nickName': instance.nickName,
      'IDCardNumber': instance.idCardNumber,
      'taxId': instance.taxId,
      'education': instance.education,
      'educationInst': instance.educationInst,
      'accountNo': instance.accountNo,
      'bank': instance.bank,
      'branch': instance.branch,
      'accountType': instance.accountType,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'birthDate': instance.birthDate?.toIso8601String(),
      'gender': instance.gender,
      'religion': instance.religion,
      'maritalStatus': instance.maritalStatus,
      'weight': instance.weight,
      'height': instance.height,
      'bloodGroup': instance.bloodGroup,
      'congenitalDisease': instance.congenitalDisease,
      'allergicFood': instance.allergicFood,
      'hobby': instance.hobby,
      'nationalIDAddress': instance.nationalIDAddress,
      'nationalIDAddressDistrict': instance.nationalIDAddressDistrict,
      'nationalIDAddressProvince': instance.nationalIDAddressProvince,
      'nationalIDAddressSubDistrict': instance.nationalIDAddressSubDistrict,
      'nationalIDAddressZipCode': instance.nationalIDAddressZipCode,
      'address': instance.address,
      'addressProvince': instance.addressProvince,
      'addressDistrict': instance.addressDistrict,
      'addressSubDistrict': instance.addressSubDistrict,
      'addressZipCode': instance.addressZipCode,
      'fullNamePersonEmegency1': instance.fullNamePersonEmegency1,
      'phonePersonEmegency1': instance.phonePersonEmegency1,
      'relationshipPersonEmegency1': instance.relationshipPersonEmegency1,
      'fullNamePersonEmegency2': instance.fullNamePersonEmegency2,
      'phonePersonEmegency2': instance.phonePersonEmegency2,
      'relationshipPersonEmegency2': instance.relationshipPersonEmegency2,
      'idCardImage': instance.idCardImage,
      'houseRegImage': instance.houseRegImage,
      'motorcycleLicenseImage': instance.motorcycleLicenseImage,
      'carLicenseImage': instance.carLicenseImage,
      'hospital': instance.hospital,
      'hospital1': instance.hospital1,
      'hospital2': instance.hospital2,
      'hospital3': instance.hospital3,
      'beneficiary': instance.beneficiary,
      'relationship': instance.relationship,
      'personalCarRegistration': instance.personalCarRegistration,
      'personalMotorcycleRegistration': instance.personalMotorcycleRegistration,
    };
