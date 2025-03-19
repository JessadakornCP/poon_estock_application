class ImageConstants {
  ImageConstants._init();
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  //Icon
  String get add1 => toIconPng('add-1');
  String get add2 => toIconPng('add-2');
  String get arrowBack => toIconPng('arrow-back-1');
  String get arrowLeft => toIconPng('arrow-left-1');
  String get arrowRight => toIconPng('arrow-right-1');
  String get calendar1 => toIconPng('calendar-1');
  String get calendar2 => toIconPng('calendar-2');
  String get chatMessage1 => toIconPng('chat-message-1');
  String get close1 => toIconPng('close-1');
  String get checkWarning1 => toIconPng('check-warning-1');
  String get checkCircle => toIconPng('check-circle');
  String get closeButton => toIconPng('close-button');
  String get removeCircle => toIconPng('remove-circle');
  String get remove => toIconPng('remove');
  String get user1 => toIconPng('user-1');
  String get user2 => toIconPng('user-2');
  String get password => toIconPng('password');
  String get visibilityOffOutlined => toIconPng('visibility-off-outlined');
  String get visibilityOutlined => toIconPng('visibility-outlined');
  String get doubleDownArrow => toIconPng('double-down-arrow');
  String get doubleUpArrow => toIconPng('double-up-arrow');
  String get search => toIconPng('search');
  String get closeCircle => toIconPng('close-circle');
  String get serialNumber => toIconPng('serial-number');
  String get upload => toIconPng('upload');
  String get correct => toIconPng('correct');
  String get refresh => toIconPng('refresh');
  String get inkColor => toIconPng('ink-color');
  String get tel1 => toIconPng('tel-1');
  String get waterDropBlue => toIconPng('water-drop-blue');
  String get waterDropPink => toIconPng('water-drop-pink');
  String get waterDropYellow => toIconPng('water-drop-yellow');
  String get waterDropBlack => toIconPng('water-drop-black');
  String get delete => toIconPng('delete');
  String get logout => toIconPng('log-out');
  String get password2 => toIconPng('password-2');
  String get policy => toIconPng('policy');
  String get user3 => toIconPng('user-3');
  String get more => toIconPng('more');
  String get notification => toIconPng('notification');
  String get mail => toIconPng('mail');
  String get picture1 => toIconPng('picture-1');
  String get inkBottleRed => toIconPng('ink-red');
  String get inkBottleBlue => toIconPng('ink-blue');
  String get inkBottleYellow => toIconPng('ink-yellow');
  String get inkBottleBlack => toIconPng('ink-black');
  String get inkCartridgeRed => toIconPng('ink-cartridge-red');
  String get inkCartridgeBlue => toIconPng('ink-cartridge-blue');
  String get inkCartridgeYellow => toIconPng('ink-cartridge-yellow');
  String get inkCartridgeBlack => toIconPng('ink-cartridge-black');
  String get supportPerson => toIconPng('support-person');
  String get sendMessage => toIconPng('send-message');
  String get gallery1 => toIconPng('gallery-1');
  String get camera1 => toIconPng('camera-1');
  String get infoCircle => toIconPng('info-circle');
  String get success => toIconPng('success');
  String get location1 => toIconPng('location-1');

  //Image
  String get addProduct => toImagePng('add-product');
  String get inkBottle1 => toImagePng('ink-bottle-1');
  String get inkBottle2 => toImagePng('ink-bottle-2');
  String get inkCartridge2 => toImagePng('ink-cartridge-2');
  String get inkTube => toImagePng('ink-tube');
  String get problemSolving => toImagePng('problem-solving');
  String get claim => toImagePng('claim');
  String get questionMark => toImagePng('question-mark');
  String get mainBG1 => toImagePng('main-bg-1');
  String get mainBG2 => toImagePng('main-bg-2');
  String get noImageAvailable => toImagePng('no-image-available');
  String get printer1 => toImagePng('printer-1');
  String get printer2 => toImagePng('printer-2');
  String get printer3 => toImagePng('printer-3');
  String get productTest => toImagePng('product-test');
  String get userProfile1 => toImagePng('user-profile-1');
  String get userProfile2 => toImagePng('user-profile-2');
  String get map1 => toImagePng('map-1');
  String get phone1 => toImagePng('phone-1');
  String get facebook => toImagePng('facebook');
  String get email => toImagePng('email');
  String get line => toImagePng('line');
  String get printInkGroup => toImagePng('print-ink-group');
  String get quotationMenu => toImagePng('quotation-menu');
  String get followWorkMenu => toImagePng('follow-work-menu');
  String get contactUsMenu => toImagePng('contact-us-menu');
  String get generalCustomers => toImagePng('general-customers');
  String get corporateClients => toImagePng('corporate-clients');
  String get productPhone => toImagePng('product-phone');
  String get imageEmpty => toImagePng('image-empty');

  //Logo
  String get eservice => toLogoPng('eservice');

  String toIconPng(String name) => 'asset/icons/$name.png';
  String toImagePng(String name) => 'asset/images/$name.png';
  String toLogoPng(String name) => 'asset/logo/$name.png';
}
