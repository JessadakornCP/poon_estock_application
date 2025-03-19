// ignore_for_file: constant_identifier_names

class ApiEndpoint {
  ApiEndpoint._init();
  static final ApiEndpoint _instance = ApiEndpoint._init();
  static ApiEndpoint get instance => _instance;

  // String get endPoint => 'https://ptn-all-service.spoon.in.th';
  String get endPoint => 'http://192.168.1.43:8081';

  ///Auth
  static const login = "/auth/login";
  static const register = "/auth/register";

  ///UserProfile
  static const userProfile = '/users';
  static const updatePassword = '/users/updatePassword';

  ///CheckPhoneNumber
  static const checkPhoneNumber = '/auth/check-phonenumber-validate';

  //userProfileInformations
  static const userProfileInformations = '/userProfileInformations';
  static const findValidator = '/findValidator';

  ///Address
  static const province = '/province';
  static const districts = "/district";
  static const subDistricts = "/subdistrict";

  //CustomerDevices
  static const customerDevices = '/customerDevices';
  static const customerDevicesCheckDeviceSerialNumber =
      '/customerDevices?isBack=0&deviceSerialNumber=';

  //eServiceCustomerProduct
  static const eServiceCustomerProduct = '/e-service-customer-products';
  static const checkDeviceSerialNumber = '/check-device-serial-number';

  //ConfigsMaster
  static const configsMaster = '/configsMaster';

  //Problems
  static const problemsFindAllProblem = '/problems/findAllProblem';

  //OTP
  static const requestOTP = "/otp/request";
  static const verifyOTP = "/otp/verify";

  //MeterTrxs
  static const meterTrxs = "/meterTrxs";

  //UploadAWS
  static const uploadAws = "/files/uploadAWS";
  static const uploadAwsMultiple = "/files/uploadAWSMultiple";

  //PrivacyPolicy
  static const privacyPolicy = 'https://poonthana-service.spoon.in.th/blogs/6';

  static const itemsPerPage = 'itemsPerPage=';
  static const page = 'page=';
  static const pageSize = 'pageSize=';
  static const search = 'search=';
  static const pageIndex = 'pageIndex=';
  static const getDataTable = '/getDatatable';

  //response_status
  static const SUCCESS = "SUCCESS";
  static const ERROR = "ERROR";
  // Errors
  static const NO_INTERNET = 101;
  static const TIME_OUT = 408;
  static const APP_CATCH = 999;
  // NameErrors
  static const MSG_NO_INTERNET = 'ขาดการเชื่อมต่อกับอินเทอร์เน็ต';
  static const MSG_UNKNOWN_ERROR = 'พบข้อมูลบางชนิดไม่ตรงกัน';
  static const MSG_TIME_OUT = 'การเชื่อมต่อหมดเวลาแล้ว กรุณาลองใหม่อีกครั้ง';
}
