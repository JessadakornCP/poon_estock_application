import 'package:json_annotation/json_annotation.dart';
import '../../prefix_name_th/prefix_name_th_model.dart';
part 'user_profile_infomation_model.g.dart';

@JsonSerializable()
class UserProfileInformation {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'prefixNameTH')
  PrefixNameTH? prefixNameTH;

  @JsonKey(name: 'fullName', defaultValue: '')
  String? fullName;

  @JsonKey(name: 'fullNameEn', defaultValue: '')
  String? fullNameEn;

  @JsonKey(name: 'nickName', defaultValue: '')
  String? nickName;

  @JsonKey(name: 'IDCardNumber', defaultValue: '')
  String? idCardNumber;

  @JsonKey(name: 'taxId', defaultValue: '')
  String? taxId;

  @JsonKey(name: 'education', defaultValue: '')
  String? education;

  @JsonKey(name: 'educationInst', defaultValue: '')
  String? educationInst;

  @JsonKey(name: 'accountNo', defaultValue: '')
  String? accountNo;

  @JsonKey(name: 'bank', defaultValue: '')
  String? bank;

  @JsonKey(name: 'branch', defaultValue: '')
  String? branch;

  @JsonKey(name: 'accountType', defaultValue: '')
  String? accountType;

  @JsonKey(name: 'phoneNumber', defaultValue: '')
  String? phoneNumber;

  @JsonKey(name: 'email', defaultValue: '')
  String? email;

  @JsonKey(name: 'birthDate')
  DateTime? birthDate;

  @JsonKey(name: 'gender', defaultValue: '')
  String? gender;

  @JsonKey(name: 'religion', defaultValue: '')
  String? religion;

  @JsonKey(name: 'maritalStatus', defaultValue: '')
  String? maritalStatus;

  @JsonKey(name: 'weight', defaultValue: 0)
  double? weight;

  @JsonKey(name: 'height', defaultValue: 0)
  double? height;

  @JsonKey(name: 'bloodGroup', defaultValue: '')
  String? bloodGroup;

  @JsonKey(name: 'congenitalDisease', defaultValue: '')
  String? congenitalDisease;

  @JsonKey(name: 'allergicFood', defaultValue: '')
  String? allergicFood;

  @JsonKey(name: 'hobby', defaultValue: '')
  String? hobby;

  @JsonKey(name: 'nationalIDAddress', defaultValue: '')
  String? nationalIDAddress;

  @JsonKey(name: 'nationalIDAddressDistrict', defaultValue: '')
  String? nationalIDAddressDistrict;

  @JsonKey(name: 'nationalIDAddressProvince', defaultValue: '')
  String? nationalIDAddressProvince;

  @JsonKey(name: 'nationalIDAddressSubDistrict', defaultValue: '')
  String? nationalIDAddressSubDistrict;

  @JsonKey(name: 'nationalIDAddressZipCode', defaultValue: '')
  String? nationalIDAddressZipCode;

  @JsonKey(name: 'address', defaultValue: '')
  String? address;

  @JsonKey(name: 'addressProvince', defaultValue: '')
  String? addressProvince;

  @JsonKey(name: 'addressDistrict', defaultValue: '')
  String? addressDistrict;

  @JsonKey(name: 'addressSubDistrict', defaultValue: '')
  String? addressSubDistrict;

  @JsonKey(name: 'addressZipCode', defaultValue: '')
  String? addressZipCode;

  @JsonKey(name: 'fullNamePersonEmegency1', defaultValue: '')
  String? fullNamePersonEmegency1;

  @JsonKey(name: 'phonePersonEmegency1', defaultValue: '')
  String? phonePersonEmegency1;

  @JsonKey(name: 'relationshipPersonEmegency1', defaultValue: '')
  String? relationshipPersonEmegency1;

  @JsonKey(name: 'fullNamePersonEmegency2', defaultValue: '')
  String? fullNamePersonEmegency2;

  @JsonKey(name: 'phonePersonEmegency2', defaultValue: '')
  String? phonePersonEmegency2;

  @JsonKey(name: 'relationshipPersonEmegency2', defaultValue: '')
  String? relationshipPersonEmegency2;

  @JsonKey(name: 'idCardImage', defaultValue: '')
  String? idCardImage;

  @JsonKey(name: 'houseRegImage', defaultValue: '')
  String? houseRegImage;

  @JsonKey(name: 'motorcycleLicenseImage', defaultValue: '')
  String? motorcycleLicenseImage;

  @JsonKey(name: 'carLicenseImage', defaultValue: '')
  String? carLicenseImage;

  @JsonKey(name: 'hospital', defaultValue: '')
  String? hospital;

  @JsonKey(name: 'hospital1', defaultValue: '')
  String? hospital1;

  @JsonKey(name: 'hospital2', defaultValue: '')
  String? hospital2;

  @JsonKey(name: 'hospital3', defaultValue: '')
  String? hospital3;

  @JsonKey(name: 'beneficiary', defaultValue: '')
  String? beneficiary;

  @JsonKey(name: 'relationship', defaultValue: '')
  String? relationship;

  @JsonKey(name: 'personalCarRegistration', defaultValue: '')
  String? personalCarRegistration;

  @JsonKey(name: 'personalMotorcycleRegistration', defaultValue: '')
  String? personalMotorcycleRegistration;

  UserProfileInformation({
    this.id,
    this.fullName,
    this.fullNameEn,
    this.nickName,
    this.idCardNumber,
    this.taxId,
    this.education,
    this.educationInst,
    this.accountNo,
    this.bank,
    this.branch,
    this.accountType,
    this.phoneNumber,
    this.email,
    this.birthDate,
    this.gender,
    this.religion,
    this.maritalStatus,
    this.weight,
    this.height,
    this.bloodGroup,
    this.congenitalDisease,
    this.allergicFood,
    this.hobby,
    this.address,
    this.addressSubDistrict,
    this.addressDistrict,
    this.addressProvince,
    this.addressZipCode,
    this.nationalIDAddress,
    this.nationalIDAddressSubDistrict,
    this.nationalIDAddressDistrict,
    this.nationalIDAddressProvince,
    this.nationalIDAddressZipCode,
    this.fullNamePersonEmegency1,
    this.phonePersonEmegency1,
    this.relationshipPersonEmegency1,
    this.fullNamePersonEmegency2,
    this.phonePersonEmegency2,
    this.relationshipPersonEmegency2,
    this.idCardImage,
    this.houseRegImage,
    this.motorcycleLicenseImage,
    this.carLicenseImage,
    this.hospital,
    this.hospital1,
    this.hospital2,
    this.hospital3,
    this.beneficiary,
    this.relationship,
    this.personalCarRegistration,
    this.personalMotorcycleRegistration,
  });

  factory UserProfileInformation.fromJson(Map<String, dynamic> json) =>
      _$UserProfileInformationFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileInformationToJson(this);
}
