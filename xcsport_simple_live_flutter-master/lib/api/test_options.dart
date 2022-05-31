/// 网络选择，测试专用
class TestOptions {
  static int netHostType;
  static int merchantIdType;

  static final Map<String, String> dev = {
    'name'    : 'DEV',
    'im_url'  : 'ws://dev.m.xc.com',
    'img_url' : 'http://dev.img.xc.com',
    'main_url': 'http://dev.m.xc.com',
  };

  static final Map<String, String> cn2 = {
    'name'    : 'CN2',
    'im_url'  : 'ws://cn2.m.aisports.io',
    'img_url' : 'http://cn2.img.aisports.io',
    'main_url': 'http://cn2.m.aisports.io',
  };

  static final Map<String, String> jxbj = {
    'name'    : 'JXBJ',
    'im_url'  : 'ws://m.juxiangbaojie.com',
    'img_url' : 'https://img.juxiangbaojie.com',
    'main_url': 'https://m.juxiangbaojie.com',
  };

  static final Map<String, String> fat = {
    'name'    : 'FAT',
    'im_url'  : 'ws://fat.m.xc.com',
    'img_url' : 'http://fat.img.xc.com',
    'main_url': 'http://fat.m.xc.com',
  };

  static final Map<String, String> beta = {
    'name'    : 'BETA',
    'im_url'  : 'ws://beta.m.xc.com',
    'img_url' : 'http://beta.img.xc.com',
    'main_url': 'http://beta.m.xc.com',
  };

  static final Map<String, String> betaFat = {
    'name'    : 'BETA-FAT',
    'im_url'  : 'ws://beta-fat.m.xc.com',
    'img_url' : 'http://beta-fat.img.xc.com',
    'main_url': 'http://beta-fat.m.xc.com',
  };
  static final Map<String, String> cn3 = {
    'name'    : 'CN3',
    'im_url'  : 'ws://nc.m.aisport.io',
    'img_url' : 'http://nc.img.aisport.io',
    'main_url': 'http://nc.m.aisport.io',
  };

  static final Map<String, String> xz = {
    'name': 'XZ',
    'im_url': 'ws://dev.m.xz.com',
    'img_url': 'http://dev.img.xz.com',
    'main_url': 'http://dev.m.xz.com',
  };

  // static final Map<String, String> bet = {
  //   'name'    : 'BET',
  //   'im_url'  : 'ws://bet.m.xc.com',
  //   'img_url' : 'http://bet.img.xc.com',
  //   'main_url': 'http://bet.m.xc.com',
  // };

  // static final Map<String, String> cn3 = {
  //   'name'    : 'CN3',
  //   'im_url'  : 'ws://cn3.m.aisport.io',
  //   'img_url' : 'http://cn3.img.aisport.io',
  //   'main_url': 'http://cn3.m.aisport.io',
  // };
  
  static final hostOptions = [cn2, cn3, dev, fat, beta, betaFat, xz];

  static final merchantIds = ['038f3e1d118e41c9a248f045701a37b4', '680501a8c9e2fed398fd405a7eb53712', '5942238866c3fbbb036b9647ff43bb6d'];
}
