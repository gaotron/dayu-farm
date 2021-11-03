const String PRODUCT_NAME = 'dayu_farm_app';

const String PRODUCT_VERSION = '1.0.0';

/*
 * 构建模式
 * DEV(main_dev)：开发模式--开发新功能，app界面无调试入口，环境仅DEV
 * DEBUG(main_debug)：送测模式--构建安装包，app界面有调试入口，可切换TEST/PRE/ONLINE环境
 * PUB(main_pub)：发布模式--构建安装包，app界面无调试入口，环境仅ONLINE，安装包可发布至应用商店
 */
enum MODES { DEV, DEBUG, PUB }

enum ENVS { DEV, TEST, PRE, ONLINE }

const Map<ENVS, Map> ENV_CONFIG = {
  ENVS.DEV: {
    'ENV': 'DEV',
    'BASE_URL': 'http://api.dev.com/',
  },
  ENVS.TEST: {
    'ENV': 'TEST',
    'BASE_URL': 'https://api.test.com/',
  },
  ENVS.PRE: {
    'ENV': 'PRE',
    'BASE_URL': 'https://api.pre.com/',
  },
  ENVS.ONLINE: {
    'ENV': 'ONLINE',
    'BASE_URL': 'https://api.online.com/',
  },
};
