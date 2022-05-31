import 'package:fast_ai/locales/zh-cn/match_config/radioTypes/OP/OP_RU.dart';
import 'package:fast_ai/locales/zh-cn/match_config/radioTypes/OP/OP_SN.dart';
import 'package:fast_ai/locales/zh-cn/match_config/radioTypes/OP/OP_TN.dart';
import 'package:fast_ai/locales/zh-cn/match_config/radioTypes/OP/OP_VB.dart';

import 'BK_AFT.dart';
import 'BS.dart';
import 'OP/OP_BD.dart';
import 'OP/OP_BM.dart';
import 'OP/OP_BO.dart';
import 'OP/OP_BS.dart';
import 'OP/OP_BV.dart';
import 'OP/OP_CK.dart';
import 'OP/OP_DR.dart';
import 'OP/OP_FB.dart';
import 'OP/OP_FH.dart';
import 'OP/OP_HB.dart';
import 'OP/OP_IH.dart';
import 'OP/OP_JR.dart';
import 'OP/OP_LO.dart';
import 'OP/OP_MMA.dart';
//import 'OP/OP_RU.dart';
//import 'OP/OP_SN.dart';
//import 'OP/OP_TN.dart';
//import 'OP/OP_VB.dart';
import 'OP_DJ/CSGO.dart';
import 'OP_DJ/DOTA.dart';
import 'OP_DJ/HS.dart';
import 'OP_DJ/KOG.dart';
import 'OP_DJ/LOL.dart';
import 'OP_DJ/OW.dart';
import 'OP_DJ/PUB.dart';
import 'OP_DJ/RL.dart';
import 'OP_DJ/RS.dart';
import 'OP_DJ/SC.dart';
import 'FT1.dart';
import 'BK1.dart';
import 'TN1.dart';

dynamic radioTypeLang = {
  'FT': ftRadioTypes,
  'BK': bkRadioTypes,
  'TN': tnRadioTypes,
  'BK_AFT': bk_aftRadioTypes,
  'BS': bsRadioTypes,
  "OP_BD": op_bdRadioTypes,
  'OP_BM': op_bmRadioTypes,
  'OP_BO': op_boRadioTypes,
  "OP_BS": op_bsRadioTypes,
  'OP_BV': op_bvRadioTypes,
  'OP_CK': op_ckRadioTypes,
  'OP_DR': op_drRadioTypes,
  'OP_FB': op_fbRadioTypes,
  'OP_FH': op_fhRadioTypes,
  'OP_HB': op_hbRadioTypes,
  'OP_IH': op_ihRadioTypes,
  'OP_MMA': op_mmaRadioTypes,
  'OP_RU': op_ruRadioTypes,
  'OP_SN': op_snRadioTypes,
  'OP_TN': op_tnRadioTypes,
  'OP_VB': op_vbRadioTypes,
  'OP_JR': op_jrRadioTypes,
  'OP_LO': op_loRadioTypes,
  'OP_DJ_CSGO': csgoRadioTypes,
  'OP_DJ_DOTA': dotaRadioTypes,
  'OP_DJ_HS': hsRadioTypes,
  'OP_DJ_LOL': lolRadioTypes,
  'OP_DJ_OW': owRadioTypes,
  'OP_DJ_RL': rlRadioTypes,
  'OP_DJ_RS': rsRadioTypes,
  'OP_DJ_SC': scRadioTypes,
  'OP_DJ_KOG': kogRadioTypes,
  'OP_DJ_PUB': pubRadioTypes,
  'R': {
    'col': 2,
    'iorType': true,
    'text': {'RH': '{homeTeam} {ratio}', 'RC': '{awayTeam} {ratio}'},
    'text2': {'RH': '{homeTeam}（{ratio}）', 'RC': '{awayTeam}（{ratio}）'},
    'textAsia': {'RH': '{ratio}', 'RC': '{ratio}'},
    'sort': ['RH', 'RC']
  },
  'RE': {
    'col': 2,
    'iorType': true,
    'text': {'REH': '{homeTeam} {ratio}', 'REC': '{awayTeam} {ratio}'},
    'text2': {'REH': '{homeTeam}（{ratio}）', 'REC': '{awayTeam}（{ratio}）'},
    'textAsia': {'REH': '{ratio}', 'REC': '{ratio}'},
    'sort': ['REH', 'REC']
  },
  'HR': {
    'half': true,
    'iorType': true,
    'col': 2,
    'text': {'HRH': '{homeTeam} {ratio}', 'HRC': '{awayTeam} {ratio}'},
    'text2': {'HRH': '{homeTeam}（{ratio}）', 'HRC': '{awayTeam}（{ratio}）'},
    'textAsia': {'HRH': '{ratio}', 'HRC': '{ratio}'},
    'sort': ['HRH', 'HRC']
  },
  'HRE': {
    'half': true,
    'iorType': true,
    'col': 2,
    'text': {'HREH': '{homeTeam} {ratio}', 'HREC': '{awayTeam} {ratio}'},
    'text2': {'HREH': '{homeTeam}（{ratio}）', 'HREC': '{awayTeam}（{ratio}）'},
    'textAsia': {'HREH': '{ratio}', 'HREC': '{ratio}'},
    'sort': ['HREH', 'HREC']
  },
  'OU': {
    'col': 2,
    'iorType': true,
    'text': {'OUC': 'สูง {ratio}', 'OUH': 'ต่ำ {ratio}'},
    'text2': {'OUC': 'สูง {ratio} ลูก', 'OUH': 'ต่ำ {ratio} ลูก'},
    'textAsia': {'OUC': 'สูง {ratio}', 'OUH': 'ต่ำ {ratio}'},
    'sort': ['OUC', 'OUH']
  },
  'ROU': {
    'col': 2,
    'iorType': true,
    'text': {'ROUC': 'สูง {ratio}', 'ROUH': 'ต่ำ {ratio}'},
    'text2': {'ROUC': 'สูง {ratio} ลูก', 'ROUH': 'ต่ำ {ratio} ลูก'},
    'textAsia': {'ROUC': 'สูง {ratio}', 'ROUH': 'ต่ำ {ratio}'},
    'sort': ['ROUC', 'ROUH']
  },
  'HOU': {
    'half': true,
    'iorType': true,
    'col': 2,
    'text': {'HOUC': 'สูง {ratio}', 'HOUH': 'ต่ำ {ratio}'},
    'text2': {'HOUC': 'สูง {ratio} ลูก', 'HOUH': 'ต่ำ {ratio} ลูก'},
    'textAsia': {'HOUC': 'สูง {ratio}', 'HOUH': 'ต่ำ {ratio}'},
    'sort': ['HOUC', 'HOUH']
  },
  'HROU': {
    'half': true,
    'iorType': true,
    'col': 2,
    'text': {'HROUC': 'สูง {ratio}', 'HROUH': 'ต่ำ {ratio}'},
    'text2': {'HROUC': 'สูง {ratio} ลูก', 'HROUH': 'ต่ำ {ratio} ลูก'},
    'textAsia': {'HROUC': 'สูง {ratio}', 'HROUH': 'ต่ำ {ratio}'},
    'sort': ['HROUC', 'HROUH']
  },
  'M': {
    'col': 3,
    'text': {'MH': '{homeTeam}', 'MN': 'เสมอ', 'MC': '{awayTeam}'},
    'text2': {'MH': '{homeTeam}ชนะ', 'MN': 'เกมส์เสมอ', 'MC': '{awayTeam}ชนะ'},
    'textAsia': {'MH': 'เจ้าบ้านชนะ', 'MN': 'เสมอ', 'MC': 'ทีมเยือนชนะ'},
    'newTextAsia': {'MH': '1', 'MN': 'x', 'MC': '2'},
    'textAsiaXiaobai': {'MH': 'เจ้าบ้านชนะ', 'MN': 'เสมอ', 'MC': 'ทีมเยือนชนะ'},
    'newTextAsiaXiaobai': {
      'MH': 'เจ้าบ้านชนะ',
      'MN': 'เสมอ',
      'MC': 'ทีมเยือนชนะ'
    },
    'sort': ['MH', 'MN', 'MC'],
    'sort_asia': ['MH', 'MC', 'MN']
  },
  'RM': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'เสมอ', 'RMC': '{awayTeam}'},
    'text2': {'RMH': '{homeTeam}ชนะ', 'RMN': 'เสมอ', 'RMC': '{awayTeam}ชนะ'},
    'textAsia': {'RMH': 'เจ้าบ้านชนะ', 'RMN': 'เสมอ', 'RMC': 'ทีมเยือนชนะ'},
    'newTextAsia': {'RMH': '1', 'RMN': 'x', 'RMC': '2'},
    'textAsiaXiaobai': {
      'RMH': 'เจ้าบ้านชนะ',
      'RMN': 'เสมอ',
      'RMC': 'ทีมเยือนชนะ'
    },
    'newTextAsiaXiaobai': {
      'RMH': 'เจ้าบ้านชนะ',
      'RMN': 'เสมอ',
      'RMC': 'ทีมเยือนชนะ'
    },
    'sort': ['RMH', 'RMN', 'RMC'],
    'sort_asia': ['RMH', 'RMC', 'RMN']
  },
  'HM': {
    'half': true,
    'col': 3,
    'text': {'HMH': '{homeTeam}', 'HMN': 'เสมอ', 'HMC': '{awayTeam}'},
    'text2': {'HMH': '{homeTeam}ชนะ', 'HMN': 'เสมอ', 'HMC': '{awayTeam}ชนะ'},
    'textAsia': {'HMH': 'เจ้าบ้านชนะ', 'HMN': 'เสมอ', 'HMC': 'ทีมเยือนชนะ'},
    'newTextAsia': {'HMH': '1', 'HMN': 'x', 'HMC': '2'},
    'sort': ['HMH', 'HMN', 'HMC'],
    'sort_asia': ['HMH', 'HMC', 'HMN']
  },
  'HRM': {
    'half': true,
    'col': 3,
    'text': {'HRMH': '{homeTeam}', 'HRMN': 'เสมอ', 'HRMC': '{awayTeam}'},
    'text2': {'HRMH': '{homeTeam}ชนะ', 'HRMN': 'เสมอ', 'HRMC': '{awayTeam}ชนะ'},
    'textAsia': {'HRMH': 'เจ้าบ้านชนะ', 'HRMN': 'เสมอ', 'HRMC': 'ทีมเยือนชนะ'},
    'newTextAsia': {'HRMH': '1', 'HRMN': 'x', 'HRMC': '2'},
    'sort': ['HRMH', 'HRMN', 'HRMC'],
    'sort_asia': ['HRMH', 'HRMC', 'HRMN']
  },
  'EO': {
    'col': 2,
    'text': {'EOO': 'คี่', 'EOE': 'คู่'},
    'text2': {'EOO': 'ไม่เป็น', 'EOE': 'เป็น（รวม0ลูก）'},
    'textAsia': {'EOO': 'คี่', 'EOE': 'คู่'},
    'sort': ['EOO', 'EOE']
  },
  'REO': {
    'col': 2,
    'text': {'REOO': 'คี่', 'REOE': 'คู่'},
    'text2': {'REOO': 'ไม่เป็น', 'REOE': 'เป็น（รวม0ลูก）'},
    'textAsia': {'REOO': 'คี่', 'REOE': 'คู่'},
    'sort': ['REOO', 'REOE']
  },
  'HEO': {
    'half': true,
    'col': 2,
    'text': {'HEOO': 'คี่', 'HEOE': 'คู่'},
    'text2': {'HEOO': 'ไม่เป็น', 'HEOE': 'เป็น（ประกอบด้วย 0 ลูก）'},
    'textAsia': {'HEOO': 'คี่', 'HEOE': 'คู่'},
    'sort': ['HEOO', 'HEOE']
  },
  'HREO': {
    'half': true,
    'col': 2,
    'text': {'HREOO': 'คี่', 'HREOE': 'คู่'},
    'text2': {'HREOO': 'ไม่เป็น', 'HREOE': 'เป็น（รวม0ลูก）'},
    'textAsia': {'HREOO': 'คี่', 'HREOE': 'คู่'},
    'sort': ['HREOO', 'HREOE']
  },
  'F': {
    'col': 3,
    'text': {
      'FHH': 'เจ้าบ้าน/เจ้าบ้าน',
      'FHN': 'เจ้าบ้าน/เสมอ',
      'FHC': 'เจ้าบ้าน/ทีมเยือน',
      'FNH': 'เสมอ/เจ้าบ้าน',
      'FNN': 'เสมอ/เสมอ',
      'FNC': 'เสมอ/ทีมเยือน',
      'FCH': 'ทีมเยือน/เจ้าบ้าน',
      'FCN': 'ทีมเยือน/เสมอ',
      'FCC': 'ทีมเยือน/ทีมเยือน'
    },
    'sort': ['FHH', 'FNN', 'FCC', 'FHN', 'FNH', 'FCN', 'FHC', 'FNC', 'FCH']
  },
  'AM': {
    'col': 3,
    'text': {'AMH': '{homeTeam}', 'AMN': 'เสมอ', 'AMC': '{awayTeam}'},
    'text2': {'AMH': '{homeTeam}ชนะ', 'AMN': 'เสมอ', 'AMC': '{awayTeam}ชนะ'},
    'sort': ['AMH', 'AMN', 'AMC']
  },
  'BM': {
    'col': 3,
    'text': {'BMH': '{homeTeam}', 'BMN': 'เสมอ', 'BMC': '{awayTeam}'},
    'text2': {'BMH': '{homeTeam}ชนะ', 'BMN': 'เสมอ', 'BMC': '{awayTeam}ชนะ'},
    'sort': ['BMH', 'BMN', 'BMC']
  },
  'CM': {
    'col': 3,
    'text': {'CMH': '{homeTeam}', 'CMN': 'เสมอ', 'CMC': '{awayTeam}'},
    'text2': {'CMH': '{homeTeam}ชนะ', 'CMN': 'เสมอ', 'CMC': '{awayTeam}ชนะ'},
    'sort': ['CMH', 'CMN', 'CMC']
  },
  'DM': {
    'col': 3,
    'text': {'DMH': '{homeTeam}', 'DMN': 'เสมอ', 'DMC': '{awayTeam}'},
    'text2': {
      'DMH': '{homeTeam}ชนะ',
      'DMN': 'เกมส์เสมอ',
      'DMC': '{awayTeam}ชนะ'
    },
    'sort': ['DMH', 'DMN', 'DMC']
  },
  'EM': {
    'col': 3,
    'text': {'EMH': '{homeTeam}', 'EMN': 'เกมส์เสมอ', 'EMC': '{awayTeam}'},
    'text2': {'EMH': '{homeTeam}ชนะ', 'EMN': 'เสมอ', 'EMC': '{awayTeam}ชนะ'},
    'sort': ['EMH', 'EMN', 'EMC']
  },
  'FM': {
    'col': 3,
    'text': {'FMH': '{homeTeam}', 'FMN': 'เกมส์เสมอ', 'FMC': '{awayTeam}'},
    'text2': {
      'FMH': '{homeTeam}ชนะ',
      'FMN': 'เกมส์เสมอ',
      'FMC': '{awayTeam}ชนะ'
    },
    'sort': ['FMH', 'FMN', 'FMC']
  },
  'ARM': {
    'col': 3,
    'text': {'AMH': '{homeTeam}', 'AMN': 'เกมส์เสมอ', 'AMC': '{awayTeam}'},
    'text2': {
      'AMH': '{homeTeam}ชนะ',
      'AMN': 'เกมส์เสมอ',
      'AMC': '{awayTeam}ชนะ'
    },
    'sort': ['ARMH', 'ARMN', 'ARMC']
  },
  'BRM': {
    'col': 3,
    'text': {'BMH': '{homeTeam}', 'BMN': 'เกมส์เสมอ', 'BMC': '{awayTeam}'},
    'text2': {'BMH': '{homeTeam}ชนะ', 'BMN': 'เสมอ', 'BMC': '{awayTeam}ชนะ'},
    'sort': ['BRMH', 'BRMN', 'BRMC']
  },
  'CRM': {
    'col': 3,
    'text': {'CMH': '{homeTeam}', 'CMN': 'เกมส์เสมอ', 'CMC': '{awayTeam}'},
    'text2': {'CMH': '{homeTeam}ชนะ', 'CMN': 'เสมอ', 'CMC': '{awayTeam}ชนะ'},
    'sort': ['CRMH', 'CRMN', 'CRMC']
  },
  'DRM': {
    'col': 3,
    'text': {'DMH': '{homeTeam}', 'DMN': 'เกมส์เสมอ', 'DMC': '{awayTeam}'},
    'text2': {
      'DMH': '{homeTeam}ชนะ',
      'DMN': 'เกมส์เสมอ',
      'DMC': '{awayTeam}ชนะ'
    },
    'sort': ['DRMH', 'DRMN', 'DRMC']
  },
  'ERM': {
    'col': 3,
    'text': {'EMH': '{homeTeam}', 'EMN': 'เกมส์เสมอ', 'EMC': '{awayTeam}'},
    'text2': {
      'EMH': '{homeTeam}ชนะ',
      'EMN': 'เกมส์เสมอ',
      'EMC': '{awayTeam}ชนะ'
    },
    'sort': ['ERMH', 'ERMN', 'ERMC']
  },
  'FRM': {
    'col': 3,
    'text': {'FMH': '{homeTeam}', 'FMN': 'เกมส์เสมอ', 'FMC': '{awayTeam}'},
    'text2': {
      'FMH': '{homeTeam}ชนะ',
      'FMN': 'เกมส์เสมอ',
      'FMC': '{awayTeam}ชนะ'
    },
    'sort': ['FRMH', 'FRMN', 'FRMC']
  },
  'AR': {
    'col': 2,
    'iorType': true,
    'text': {'ARH': '{homeTeam} {ratio}', 'ARC': '{awayTeam} {ratio}'},
    'sort': ['ARH', 'ARC']
  },
  'BR': {
    'col': 2,
    'text': {'BRH': '{homeTeam} {ratio}', 'BRC': '{awayTeam} {ratio}'},
    'sort': ['BRH', 'BRC']
  },
  'CR': {
    'col': 2,
    'text': {'CRH': '{homeTeam} {ratio}', 'CRC': '{awayTeam} {ratio}'},
    'sort': ['CRH', 'CRC']
  },
  'DR': {
    'col': 2,
    'text': {'DRH': '{homeTeam} {ratio}', 'DRC': '{awayTeam} {ratio}'},
    'sort': ['DRH', 'DRC']
  },
  'ER': {
    'col': 2,
    'text': {'ERH': '{homeTeam} {ratio}', 'ERC': '{awayTeam} {ratio}'},
    'sort': ['ERH', 'ERC']
  },
  'FR': {
    'col': 2,
    'text': {'FRH': '{homeTeam} {ratio}', 'FRC': '{awayTeam} {ratio}'},
    'sort': ['FRH', 'FRC']
  },
  'ARE': {
    'col': 2,
    'iorType': true,
    'text': {'ARH': '{homeTeam} {ratio}', 'ARC': '{awayTeam} {ratio}'},
    'sort': ['AREH', 'AREC']
  },
  'BRE': {
    'col': 2,
    'text': {'BRH': '{homeTeam} {ratio}', 'BRC': '{awayTeam} {ratio}'},
    'sort': ['BREH', 'BREC']
  },
  'CRE': {
    'col': 2,
    'text': {'CRH': '{homeTeam} {ratio}', 'CRC': '{awayTeam} {ratio}'},
    'sort': ['CREH', 'CREC']
  },
  'DRE': {
    'col': 2,
    'text': {'DRH': '{homeTeam} {ratio}', 'DRC': '{awayTeam} {ratio}'},
    'sort': ['DREH', 'DREC']
  },
  'ERE': {
    'col': 2,
    'text': {'ERH': '{homeTeam} {ratio}', 'ERC': '{awayTeam} {ratio}'},
    'sort': ['EREH', 'EREC']
  },
  'FRE': {
    'col': 2,
    'text': {'FRH': '{homeTeam} {ratio}', 'FRC': '{awayTeam} {ratio}'},
    'sort': ['FREH', 'FREC']
  },
  'AOU': {
    'col': 2,
    'iorType': true,
    'text': {'AOUO': 'สูง {ratio}', 'AOUU': 'ต่า {ratio}'},
    'text2': {'AOUO': 'สูง {ratio} ลูก', 'AOUU': 'ต่ำ {ratio} ลูก'},
    'sort': ['AOUO', 'AOUU']
  },
  'BOU': {
    'col': 2,
    'text': {'BOUO': 'สูง {ratio}', 'BOUU': 'ต่ำ {ratio}'},
    'text2': {'BOUO': 'สูง {ratio} ลูก', 'BOUU': 'ต่ำ {ratio} ลูก'},
    'sort': ['BOUO', 'BOUU']
  },
  'COU': {
    'col': 2,
    'text': {'COUO': 'สูง {ratio}', 'COUU': 'ต่ำ {ratio}'},
    'text2': {'COUO': 'สูง {ratio} ลูก', 'COUU': 'ต่ำ {ratio} ลูก'},
    'sort': ['COUO', 'COUU']
  },
  'DOU': {
    'col': 2,
    'text': {'DOUO': 'สูง {ratio}', 'DOUU': 'ต่ำ {ratio}'},
    'text2': {'DOUO': 'สูง {ratio} ลูก', 'DOUU': 'ต่ำ {ratio} ลูก'},
    'sort': ['DOUO', 'DOUU']
  },
  'EOU': {
    'col': 2,
    'text': {'EOUO': 'สูง {ratio}', 'EOUU': 'ต่ำ {ratio}'},
    'text2': {'EOUO': 'สูง {ratio} ลูก', 'EOUU': 'ต่ำ {ratio} ลูก'},
    'sort': ['EOUO', 'EOUU']
  },
  'FOU': {
    'col': 2,
    'text': {'FOUO': 'สูง {ratio}', 'FOUU': 'ต่ำ {ratio}'},
    'text2': {'FOUO': 'สูง {ratio} ลูก', 'FOUU': 'ต่ำ {ratio} ลูก'},
    'sort': ['FOUO', 'FOUU']
  },
  'AROU': {
    'col': 2,
    'iorType': true,
    'text': {'AROUO': 'สูง {ratio}', 'AROUU': 'ต่ำ {ratio}'},
    'text2': {'AROUO': 'สูง {ratio} ลูก', 'AROUU': 'ต่ำ {ratio} ลูก'},
    'sort': ['AROUO', 'AROUU']
  },
  'BROU': {
    'col': 2,
    'text': {'BROUO': 'สูง {ratio}', 'BROUU': 'ต่ำ {ratio}'},
    'text2': {'BROUO': 'สูง {ratio} ลูก', 'BROUU': 'ต่ำ {ratio} ลูก'},
    'sort': ['BROUO', 'BROUU']
  },
  'CROU': {
    'col': 2,
    'text': {'CROUO': 'สูง {ratio}', 'CROUU': 'ต่ำ {ratio}'},
    'text2': {'CROUO': 'สูง {ratio} ลูก', 'CROUU': 'ต่ำ {ratio} ลูก'},
    'sort': ['CROUO', 'CROUU']
  },
  'DROU': {
    'col': 2,
    'text': {'DROUO': 'สูง {ratio}', 'DROUU': 'ต่ำ {ratio}'},
    'text2': {'DROUO': 'สูง {ratio} ลูก', 'DROUU': 'ต่ำ {ratio} ลูก'},
    'sort': ['DROUO', 'DROUU']
  },
  'EROU': {
    'col': 2,
    'text': {'EROUO': 'สูง {ratio}', 'EROUU': 'ต่ำ {ratio}'},
    'text2': {'EROUO': 'สูง {ratio} ลูก', 'EROUU': 'ต่ำ {ratio} ลูก'},
    'sort': ['EROUO', 'EROUU']
  },
  'FROU': {
    'col': 2,
    'text': {'FROUO': 'สูง {ratio}', 'FROUU': 'ต่ำ {ratio}'},
    'text2': {'FROUO': 'สูง {ratio}ลูก', 'FROUU': 'ต่ำ {ratio} ลูก'},
    'sort': ['FROUO', 'FROUU']
  },
  'BH': {
    'col': 2,
    'text': {'BHH': '{homeTeam}', 'BHC': '{awayTeam}'},
    'sort': ['BHH', 'BHC']
  },
  'CS': {
    'col': 2,
    'text': {'CSH': '{homeTeam}', 'CSC': '{awayTeam}'},
    'sort': ['CSH', 'CSC']
  },
  'DC': {
    'col': 3,
    'text': {
      'DCHN': 'เจ้าบ้าน/เกมส์เสมอ',
      'DCCN': 'ทีมเยือน/เกมส์เสมอ',
      'DCHC': 'เจ้าบ้าน/ทีมเยือน'
    },
    'sort': ['DCHN', 'DCCN', 'DCHC']
  },
  'F2G': {
    'col': 3,
    'text': {
      'F2GH': '{homeTeam}',
      'F2GC': '{awayTeam}',
      'F2GN': 'ไม่ได้ทั้งสองทีม'
    },
    'text2': {
      'F2GH': '{homeTeam}',
      'F2GC': '{awayTeam}',
      'F2GN': 'ไม่ได้เข้า2ลูก'
    },
    'sort': ['F2GH', 'F2GC', 'F2GN']
  },
  'F3G': {
    'col': 3,
    'text': {
      'F3GH': '{homeTeam}',
      'F3GC': '{awayTeam}',
      'F3GN': 'ไม่ได้ทั้งสองทีม'
    },
    'text2': {
      'F3GH': '{homeTeam}',
      'F3GC': '{awayTeam}',
      'F3GN': 'ไม่ได้เข้า3ลูก'
    },
    'sort': ['F3GH', 'F3GC', 'F3GN']
  },
  'FG': {
    'col': 3,
    'text': {
      'FGS': 'เตะเข้าโกลแบบธรรมดา',
      'FGH': 'โหม่งบอล',
      'FGP': 'ลูกโทษ',
      'FGF': 'ฟรีคิก',
      'FGO': 'ออนโกล',
      'FGN': 'ไม่มีลูกที่เข้า'
    },
    'text2': {
      'FGS': 'เตะเข้าโกลแบบธรรมดา',
      'FGH': 'โหม่งบอล',
      'FGP': 'ลูกโทษ',
      'FGF': 'ฟรีคิก',
      'FGO': 'ออนโกล',
      'FGN': 'ไม่มีลูกที่เข้า'
    },
    'sort': ['FGS', 'FGH', 'FGN', 'FGP', 'FGF', 'FGO']
  },
  'HG': {
    'col': 2,
    'text': {'HGH': 'ครึ่งแรก', 'HGC': 'ครึ่งหลัง'},
    'sort': ['HGH', 'HGC']
  },
  'HOUC': {
    'half': true,
    'col': 2,
    'text': {'HOUCO': 'สูง {ratio}', 'HOUCU': 'ต่ำ {ratio}'},
    'text2': {'HOUCO': 'สูง {ratio} ลูก', 'HOUCU': 'ต่ำ {ratio} ลูก'},
    'sort': ['HOUCO', 'HOUCU']
  },
  'HOUH': {
    'half': true,
    'col': 2,
    'text': {'HOUHO': 'สูง {ratio}', 'HOUHU': 'ต่ำ {ratio}'},
    'text2': {'HOUHO': 'สูง {ratio} ลูก', 'HOUHU': 'ต่ำ {ratio}ลูก'},
    'sort': ['HOUHO', 'HOUHU']
  },
  'HT': {
    'half': true,
    'col': 2,
    'text': {'HT0': '0', 'HT1': '1', 'HT2': '2', 'HTOV': '3+'},
    'text2': {
      'HT0': 'บอลไม่เข้า',
      'HT1': 'บอลเข้า1ลูก',
      'HT2': 'บอลเข้า2ลูก',
      'HTOV': 'บอลเข้า3ลูกขึ้นไป'
    },
    'sort': ['HT0', 'HT1', 'HT2', 'HTOV']
  },
  'MG': {
    'col': 3,
    'text': {'MGH': 'ครึ่งแรก', 'MGN': 'ไม่มีลูกที่เข้า', 'MGC': 'ครึ่งหลัง'},
    'sort': ['MGH', 'MGC', 'MGN']
  },
  'OUC': {
    'col': 2,
    'text': {'OUCO': 'สูง {ratio}', 'OUCU': 'ต่ำ {ratio}'},
    'text2': {'OUCO': 'สูง {ratio} ลูก', 'OUCU': 'ต่ำ {ratio} ลูก'},
    'sort': ['OUCO', 'OUCU']
  },
  'OUH': {
    'col': 2,
    'text': {'OUHO': 'สูง {ratio}', 'OUHU': 'ต่ำ {ratio}'},
    'text2': {'OUHO': 'สูง {ratio} ลูก', 'OUHU': 'ต่ำ {ratio} ลูก'},
    'sort': ['OUHO', 'OUHU']
  },
  'PA': {
    'col': 2,
    'text': {'PAH': 'ใช่', 'PAC': 'ไม่'},
    'sort': ['PAH', 'PAC']
  },
  'RCD': {
    'col': 2,
    'text': {'RCDH': 'ใช่', 'RCDC': 'ไม่่'},
    'sort': ['RCDH', 'RCDC']
  },
  'SB': {
    'col': 2,
    'text': {'SBH': '{homeTeam}', 'SBC': '{awayTeam}'},
    'sort': ['SBH', 'SBC']
  },
  'T': {
    'col': 2,
    'text': {
      'T01': '0~1',
      'T23': '2~3',
      'T46': '4~6',
      'OVER': '7+',
      'T01P': '0~1',
      'T23P': '2~3',
      'T46P': '4~5',
      'OVERP': '6+'
    },
    'text2': {
      'T01': '0~1ประตู',
      'T23': '2~3ประตู',
      'T46': '4~6ประตู',
      'OVER': '7ประตูขึ้นไป',
      'T01P': '0~1ประตู',
      'T23P': '2~3ประตู',
      'T46P': '4~5ประตู',
      'OVERP': '6ประตูขึ้นไป'
    },
    'sort': ['T01', 'T23', 'T46', 'OVER', 'T01P', 'T23P', 'T46P', 'OVERP']
  },
  'T3G': {
    'col': 3,
    'text': {
      'T3G1': 'ครึ่งแรก26นาทีหรือก่อน',
      'T3G2': 'ครึ่งแรก27นทีหรือหลัง',
      'T3GN': 'บอลไม่เข้า'
    },
    'sort': ['T3G1', 'T3G2', 'T3GN']
  },
  'TK': {
    'col': 2,
    'text': {'TKH': '{homeTeam}', 'TKC': '{awayTeam}'},
    'sort': ['TKH', 'TKC']
  },
  'TS': {
    'col': 2,
    'text': {'TSY': 'ใช่', 'TSN': 'ไม่'},
    'sort': ['TSY', 'TSN']
  },
  'W3': {
    'col': 3,
    'text': {
      'W3H': '{homeTeam} {ratio}',
      'W3N': 'เกมส์เสมอ {ratio}',
      'W3C': '{awayTeam} {ratio}'
    },
    'sort': ['W3H', 'W3N', 'W3C']
  },
  'WB': {
    'col': 2,
    'text': {'WBH': '{homeTeam}', 'WBC': '{awayTeam}'},
    'sort': ['WBH', 'WBC']
  },
  'WE': {
    'col': 2,
    'text': {'WEH': '{homeTeam}', 'WEC': '{awayTeam}'},
    'sort': ['WEH', 'WEC']
  },
  'WM': {
    'col': 2,
    'text': {
      'WMH1': 'เจ้าบ้าน-ผลชะ1ประตู',
      'WMH2': 'เจ้าบ้าน-ผลชนะ2ประตู',
      'WMH3': 'เจ้าบ้าน-ผลชนะ3ประตู',
      'WMHOV': 'เจ้าบ้าน-ผลชนะ4ประตูขึ้นไป',
      'WMC1': 'ทีมเยือน-ผลชนะ1ประตู',
      'WMC2': 'ทีมเยือน-ผลชนะ2ประตู',
      'WMC3': 'ทีมเยือน-ผลชนะ3ประตู',
      'WMCOV': 'ทีมเยือน-ผลชนะ4ประตูขึ้นไป',
      'WMN': 'บอลเข้าเสมอกัน',
      'WM0': 'ไม่มีลูกที่เข้า',
    },
    'sort': [
      'WMH1',
      'WMH2',
      'WMH3',
      'WMHOV',
      'WMC1',
      'WMC2',
      'WMC3',
      'WMCOV',
      'WMN',
      'WM0',
    ]
  },
  'WN': {
    'col': 2,
    'text': {'WNH': '{homeTeam}', 'WNC': '{awayTeam}'},
    'sort': ['WNH', 'WNC']
  },
  'ARG': {
    'col': 3,
    'text': {'ARGC': '{awayTeam}', 'ARGN': 'บอลไม่เข้า', 'ARGH': '{homeTeam}'},
    'sort': ['ARGH', 'ARGC', 'ARGN']
  },
  'BRG': {
    'col': 3,
    'text': {'BRGN': 'บอลไม่เข้า', 'BRGH': '{homeTeam}', 'BRGC': '{awayTeam}'},
    'sort': ['BRGN', 'BRGH', 'BRGC']
  },
  'CD': {
    'col': 2,
    'text': {
      'CDFH': 'ใบที่1 - {homeTeam}',
      'CDFC': 'ใบที่1 - {awayTeam}',
      'CDLH': 'ใบที่1 - {homeTeam}',
      'CDLC': 'ใบสุดท้าย - {awayTeam}',
      'CDLN': 'ไม่มีใบเตือน',
      'CDFN': 'ไม่มีใบเตือน'
    },
    'sort': ['CDFH', 'CDFC', 'CDLH', 'CDLC', 'CDLN', 'CDFN']
  },
  'CN': {
    'col': 3,
    'text': {
      'CNLC': 'ลูกสุดท้าย - {awayTeam}',
      'CNLH': 'ลูกสุดท้าย - {homeTeam}',
      'CNFN': 'ไม่มีเตะมุม',
      'CNLN': 'ไม่มีเตะมุม',
      'CNFH': 'ลูกที่1 - {homeTeam}',
      'CNFC': 'ลูกที่1 - {awayTeam}'
    },
    'sort': ['CNFH', 'CNFC', 'CNFN', 'CNLH', 'CNLC', 'CNLN']
  },
  'CRG': {
    'col': 3,
    'text': {'CRGC': '{awayTeam}', 'CRGN': 'บอลไม่เข้า', 'CRGH': '{homeTeam}'},
    'sort': ['CRGH', 'CRGC', 'CRGN']
  },
  'DRG': {
    'col': 3,
    'text': {'DRGN': 'บอลไม่เข้า', 'DRGC': '{awayTeam}', 'DRGH': '{homeTeam}'},
    'sort': ['DRGH', 'DRGC', 'DRGN']
  },
  'ERG': {
    'col': 3,
    'text': {'ERGH': '{homeTeam}', 'ERGC': '{awayTeam}', 'ERGN': 'บอลไม่เข้า'},
    'sort': ['ERGH', 'ERGC', 'ERGN']
  },
  'FRG': {
    'col': 3,
    'text': {'FRGN': 'บอลไม่เข้า', 'FRGC': '{awayTeam}', 'FRGH': '{homeTeam}'},
    'sort': ['FRGH', 'FRGC', 'FRGN']
  },
  'GA': {
    'col': 2,
    'text': {
      'GAFC': 'เตะประตูแรก - {awayTeam}',
      'GAFH': 'เตะประตูแรก - {homeTeam}',
      'GALC': 'เตะประตูสุดท้่ย - {awayTeam}',
      'GALH': 'เตะประตูสุดท้าย - {homeTeam}'
    },
    'sort': ['GAFH', 'GAFC', 'GALH', 'GALC']
  },
  'GRG': {
    'col': 3,
    'text': {'GRGH': '{homeTeam}', 'GRGN': 'บอลไม่เข้า', 'GRGC': '{awayTeam}'},
    'sort': ['GRGH', 'GRGC', 'GRGN']
  },
  'HPD': {'half': true, 'col': 2, 'text': {}, 'sort': []},
  'HRG': {
    'col': 3,
    'text': {'HRGN': 'บอลไม่เข้า', 'HRGC': '{awayTeam}', 'HRGH': '{homeTeam}'},
    'sort': ['HRGH', 'HRGC', 'HRGN']
  },
  'HRPD': {'half': true, 'col': 2, 'text': {}, 'sort': []},
  'HRT': {
    'half': true,
    'col': 2,
    'text': {'HRT1': '1', 'HRT0': '0', 'HRTOV': '3+', 'HRT2': '2'},
    'text2': {
      'HRT1': 'เข้า1ลูก',
      'HRT0': 'บอลไม่เข้า',
      'HRT2': 'บอลเข้า2ลูก',
      'HRTOV': 'บอลเข้า3รูปขึ้นไป'
    },
    'sort': ['HRT0', 'HRT1', 'HRT2', 'HRTOV']
  },
  'HRUC': {
    'half': true,
    'col': 2,
    'text': {'HRUCU': 'น้อยกว่า {ratio}', 'HRUCO': 'มากกว่า {ratio}'},
    'text2': {'HRUCO': 'มากกว่า {ratio} ลูก', 'HRUCU': 'น้อยกว่า {ratio} ลูก'},
    'sort': ['HRUCO', 'HRUCU']
  },
  'HRUH': {
    'half': true,
    'col': 2,
    'text': {'HRUHO': 'มากกว่า {ratio}', 'HRUHU': 'น้อยกว่า {ratio}'},
    'text2': {'HRUHO': 'มากกว่า {ratio} ลูก', 'HRUHU': 'น้อยกว่า {ratio} ลูก'},
    'sort': ['HRUHO', 'HRUHU']
  },
  'IRG': {
    'col': 3,
    'text': {'IRGH': '{homeTeam}', 'IRGN': 'บอลไม่เข้า', 'IRGC': '{awayTeam}'},
    'sort': ['IRGH', 'IRGC', 'IRGN']
  },
  'JRG': {
    'col': 3,
    'text': {'JRGH': '{homeTeam}', 'JRGN': 'บอลไม่เข้า', 'JRGC': '{awayTeam}'},
    'sort': ['JRGH', 'JRGC', 'JRGN']
  },
  'OS': {
    'col': 2,
    'text': {
      'OSLH': 'หลังล้ำหน้า - {homeTeam}',
      'OSFN': 'ก่อนล้ำหน้า - ไม่มี',
      'OSFC': 'ก่อนล้ำหน้า - {awayTeam}',
      'OSLC': 'หลังล้ำหน้า - {awayTeam}',
      'OSFH': 'ก่อนล้ำหน้า - {homeTeam} '
    },
    'sort': ['OSLH', 'OSFN', 'OSFC', 'OSLC', 'OSFH']
  },
  'PD': {'col': 2, 'text': {}, 'sort': []},
  'PG': {
    'col': 2,
    'text': {
      'PGLC': 'ลูกบอลเข้าหลัง - {awayTeam}',
      'PGFH': 'ลูกบอลเข้าก่อน - {homeTeam}',
      'PGFN': 'ลูกบอลเข้าก่อน - ไม่มี',
      'PGFC': 'ลูกบอลเข้าก่อน - {awayTeam}',
      'PGLH': 'ลูกบอลเข้าหลัง - {homeTeam}'
    },
    'sort': ['PGLC', 'PGFH', 'PGFN', 'PGFC', 'PGLH']
  },
  'RC': {
    'col': 2,
    'text': {
      'RCFH': 'ฟรีคิกลูกแรก - {homeTeam} ',
      'RCLH': 'ฟรีคิกสุดท้าย - {homeTeam} ',
      'RCFC': 'ฟรีคิกลูกแรก - {awayTeam} ',
      'RCLC': 'ฟรีคิกสุดท้าย - {awayTeam} '
    },
    'sort': ['RCFH', 'RCFC', 'RCLH', 'RCLC']
  },
  'RCS': {
    'col': 2,
    'text': {'RCSC': '{awayTeam}', 'RCSH': '{homeTeam}'},
    'sort': ['RCSC', 'RCSH']
  },
  'RDC': {
    'col': 3,
    'text': {
      'RDCHN': 'เจ้าบ้าน/เกมส์เสมอ',
      'RDCHC': 'เจ้าบ้าน/ทีมเยือน',
      'RDCCN': 'ทีมเยือน/เกมส์เสมอ'
    },
    'sort': ['RDCHN', 'RDCHC', 'RDCCN']
  },
  'RHG': {
    'col': 2,
    'text': {'RHGH': 'ครึ่งแรก', 'RHGC': 'ครึ่งหลัง'},
    'sort': ['RHGH', 'RHGC']
  },
  'RMG': {
    'col': 3,
    'text': {
      'RMGN': 'ไม่มีลูกที่เข้า',
      'RMGC': 'ครึ่งหลัง',
      'RMGH': 'ครึ่งแรก'
    },
    'sort': ['RMGH', 'RMGC', 'RMGN']
  },
  'ROUC': {
    'col': 2,
    'text': {'ROUCU': 'สูง {ratio}', 'ROUCO': 'สูง {ratio}'},
    'text2': {'ROUCO': 'สูง {ratio} ลูก', 'ROUCU': 'ต่ำ {ratio} ลูก'},
    'sort': ['ROUCO', 'ROUCU']
  },
  'ROUH': {
    'col': 2,
    'text': {'ROUHU': 'ต่ำ {ratio}', 'ROUHO': 'สูง {ratio}'},
    'text2': {'ROUHO': 'สูง {ratio} ลูก', 'ROUHU': 'ต่ำ {ratio} ลูก'},
    'sort': ['ROUHO', 'ROUHU']
  },
  'RPD': {'col': 2, 'text': {}, 'sort': []},
  'RSB': {
    'col': 2,
    'text': {'RSBC': '{awayTeam}', 'RSBH': '{homeTeam}'},
    'sort': ['RSBC', 'RSBH']
  },
  'RT': {
    'col': 2,
    'text': {
      'RT01P': '0-1ประตู',
      'RT23P': '2-3ประตู',
      'RT46P': '4-5ประตู',
      'ROVERP': '6+ประตู',
      'RT46': '4~6ประตู',
      'RT01': '0~1ประตู',
      'RT23': '2~3ประตู',
      'ROVER': '7+ประตู',
      'RT0': '0',
      'RT1': '1',
      'RT2': '2',
      'RTOV': '3+',
    },
    'sort': [
      'RT01P',
      'RT23P',
      'RT46P',
      'ROVERP',
      'RT01',
      'RT23',
      'RT46',
      'ROVER',
      'RT0',
      'RT1',
      'RT2',
      'RTOV'
    ]
  },
  'RT1G': {
    'col': 2,
    'text': {
      'RT1G3': 'ครึ่งแรก30：00 - ครึ่งเกมส์เสร็จสิ้น',
      'RT1G2': 'ครึ่งแรก15：00 - 29：59',
      'RT1G1': 'เริ่มการแข่งขัน - 14:59',
      'RT1G6': 'ครึ่งหลัง75：00 - เสร็จสิ้น',
      'RT1G5': 'ครึ่งหลัง60：00 - 74：59',
      'RT1G4': 'เริ่มการแข่งขันครึ่งหลัง - 59：59',
      'RT1GN': 'บอลไม่เข้า'
    },
    'sort': ['RT1G1', 'RT1G2', 'RT1G3', 'RT1G4', 'RT1G5', 'RT1G6', 'RT1GN']
  },
  'RT3G': {
    'col': 3,
    'text': {
      'RT3G1': 'ครึ่งแรก26นาทีหรือก่อน',
      'RT3G2': 'ครึ่งหลัง27นาทีหรือหลัง',
      'RT3GN': 'บอลไม่เข้า'
    },
    'sort': ['RT3G1', 'RT3G2', 'RT3GN']
  },
  'RTS': {
    'col': 2,
    'text': {'RTSY': 'ใช่', 'RTSN': 'ไม่'},
    'sort': ['RTSY', 'RTSN']
  },
  'RWB': {
    'col': 2,
    'text': {'RWBC': '{awayTeam}', 'RWBH': '{homeTeam}'},
    'sort': ['RWBC', 'RWBH']
  },
  'RWE': {
    'col': 2,
    'text': {'RWEH': '{homeTeam}', 'RWEC': '{awayTeam}'},
    'sort': ['RWEH', 'RWEC']
  },
  'RWM': {
    'col': 2,
    'text': {
      'RWMH1': 'เจ้าบ้าน-ผลชนะ1ประตู',
      'RWMH2': 'เจ้าบ้าน-ผลชนะ2ประตู',
      'RWMH3': 'เจ้าบ้าน-ผลชนะ3ประตู',
      'RWMHOV': 'เจ้าบ้าน-ผลชนะ4ประตูขึ้นไป',
      'RWMC1': 'ทีมเยือน-ผลชนะ1ประตู',
      'RWMC2': 'ทีมเยือน-ผลชนะ2ประตู',
      'RWMC3': 'ทีมเยือน-ผลชนะ3ประตู',
      'RWMCOV': 'ทีมเยือน-ผลชนะ4ประตูขึ้นไป',
      'RWMN': 'บอลเข้าเสมอกัน',
      'RWM0': 'ไม่มีลูกที่เข้า',
    },
    'sort': [
      'RWMH1',
      'RWMH2',
      'RWMH3',
      'RWMHOV',
      'RWMC1',
      'RWMC2',
      'RWMC3',
      'RWMCOV',
      'RWMN',
      'RWM0',
    ]
  },
  'RWN': {
    'col': 2,
    'text': {'RWNH': '{homeTeam}', 'RWNC': '{awayTeam}'},
    'sort': ['RWNH', 'RWNC']
  },
  'ST': {
    'col': 2,
    'text': {
      'STLC': 'หลังเปลี่ยนตัวสำรอง - {awayTeam}',
      'STFC': 'ก่อนเปลี่ยนตัวสำรอง - {awayTeam}',
      'STLH': 'หลังเปลี่ยนตัวสำรอง - {homeTeam}',
      'STFN': 'ก่อนเปลี่ยนตัวสำรอง - ไม่มี',
      'STFH': 'ก่อนเปลี่ยนตัวสำรอง - {homeTeam}'
    },
    'sort': ['STLC', 'STFC', 'STLH', 'STFN', 'STFH']
  },
  'YC': {
    'col': 2,
    'text': {
      'YCFH': 'บอลออกลูกแรก - {homeTeam}',
      'YCFC': 'บอลออกลูกแรก - {awayTeam}',
      'YCLH': 'บอลออกลูกสุดท้าย - {homeTeam}',
      'YCLC': 'บอลออกลูกสุดท้าย - {awayTeam} '
    },
    'sort': ['YCFH', 'YCFC', 'YCLH', 'YCLC']
  },
  'KR': {
    'col': 2,
    'text': {'KRH': '{homeTeam} {ratio}', 'KRC': '{awayTeam} {ratio}'},
    'sort': ['KRH', 'KRC']
  },
  'KOU': {
    'col': 2,
    'text': {'KOUC': 'สูง {ratio}', 'KOUH': 'ต่ำ {ratio}'},
    'sort': ['KOUC', 'KOUH']
  },
  'KEO': {
    'col': 2,
    'text': {'KEOO': 'คี่', 'KEOE': 'คู่'},
    'sort': ['KEOO', 'KEOE']
  },
  'FB': {
    'col': 2,
    'text': {'FBH': '{homeTeam}', 'FBC': '{awayTeam}'},
    'sort': ['FBH', 'FBC']
  },
  'K5': {
    'col': 2,
    'text': {'K5H': '{homeTeam}', 'K5C': '{awayTeam}'},
    'sort': ['K5H', 'K5C']
  },
  'R5': {
    'col': 2,
    'text': {'R5Y': 'ใช่', 'R5N': 'ไม่'},
    'sort': ['R5Y', 'R5N']
  },
  'CT': {
    'col': 2,
    'text': {'CT33': '33:00หรือลงไป', 'CT34': '33:01หรือขึ้นไป'},
    'sort': ['CT33', 'CT34']
  },
  'K10': {
    'col': 2,
    'text': {'K10H': '{homeTeam}', 'K10C': '{awayTeam}'},
    'sort': ['K10H', 'K10C']
  },
  'R10': {
    'col': 2,
    'text': {'R10Y': 'ใช่', 'R10N': 'ไม่'},
    'sort': ['R10Y', 'R10N']
  },
  'KM': {
    'col': 2,
    'text': {'KMC': '{homeTeam}', 'KMH': '{awayTeam}'},
    'sort': ['KMC', 'KMH']
  },
  'MR_MK': {
    'col': 2,
    'text': {'MR_MKH': '{homeTeam}', 'MR_MKA': '{awayTeam}'},
    'sort': ['MR_MKH', 'MR_MKA']
  },
  'MR_MW': {
    'col': 2,
    'text': {'MR_MWH': '{homeTeam}', 'MR_MWA': '{awayTeam}'},
    'sort': ['MR_MWH', 'MR_MWA']
  },
  'MR_DT': {
    'col': 2,
    'text': {'MR_DTH': '{homeTeam}', 'MR_DTA': '{awayTeam}'},
    'sort': ['MR_DTH', 'MR_DTA']
  },
  'MR_MB': {
    'col': 2,
    'text': {'MR_MBH': '{homeTeam}', 'MR_MBA': '{awayTeam}'},
    'sort': ['MR_MBH', 'MR_MBA']
  },
  'MR_KH': {
    'col': 2,
    'text': {'MR_KHH': '{homeTeam} {ratio}', 'MR_KHC': '{awayTeam} {ratio}'},
    'sort': ['MR_KHH', 'MR_KHC']
  },
  'MR_TH': {
    'col': 2,
    'text': {'MR_THH': '{homeTeam} {ratio}', 'MR_THC': '{awayTeam} {ratio}'},
    'sort': ['MR_THH', 'MR_THC']
  },
  'MR_RK': {
    'col': 2,
    'text': {'MR_RKH': '{homeTeam}', 'MR_RKA': '{awayTeam}'},
    'sort': ['MR_RKH', 'MR_RKA']
  },
  'MOU_TK': {
    'col': 2,
    'text': {'MOU_TK12': 'สูง {ratio}', 'MOU_TK13': 'ต่ำ {ratio}'},
    'sort': ['MOU_TK12', 'MOU_TK13']
  },
  'MOU_TKFT': {
    'col': 2,
    'text': {'MOU_TKFT4': 'สูง {ratio}', 'MOU_TKFT5': 'ต่ำ {ratio}'},
    'sort': ['MOU_TKFT4', 'MOU_TKFT5']
  },
  'MR_MS': {
    'col': 2,
    'text': {'MR_MSH': '{homeTeam}', 'MR_MSA': '{awayTeam}'},
    'sort': ['MR_MSH', 'MR_MSA']
  },
  'MOU_KH': {
    'col': 2,
    'text': {'MOU_TK12': 'สูง {ratio}', 'MOU_TK13': 'ต่ำ {ratio}'},
    'sort': ['MOU_TK12', 'MOU_TK13']
  },
  'HR2': {
    'col': 2,
    'text': {'HR2H': '{homeTeam} {ratio}', 'HR2C': '{awayTeam} {ratio}'},
    'sort': ['HR2H', 'HR2C']
  },
  "MA": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RA": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUA": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "MB": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RB": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUB": {
    "col": 2,
    "text": {"OUC": "สูง1 {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "MD": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RD": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUD": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "MK": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RK": {
    "col": 2,
    "text": {"RH": '{homeTeam} {ratio}', "RC": '{awayTeam} {ratio}'},
    "sort": ['RH', 'RC']
  },
  "OUK": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "RG": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUG": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "ML": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RL": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUL": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
  },
  "MQ": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RQ": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUQ": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "M1": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "M2": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "M3": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "M4": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "M5": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  'RM1': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM2': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM3': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM4': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM5': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM6': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM7': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM8': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM9': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM10': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM11': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM12': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM13': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM14': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM15': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM16': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM17': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM18': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM19': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM20': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM21': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM22': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM23': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM24': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM25': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM26': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM27': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM28': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM29': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM30': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM31': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM32': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM33': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM34': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM35': {
    'col': 2,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RF': {
    'col': 3,
    'text': {
      'RFHH': 'เจ้าบ้าน/เจ้าบ้าน',
      'RFHN': 'เจ้าบ้าน/เสมอ',
      'RFHC': 'เจ้าบ้าน/ทีมเยือน',
      'RFNH': 'เสมอ/เจ้าบ้าน',
      'RFNN': 'เสมอ/เสมอ',
      'RFNC': 'เสมอ/ทีมเยือน',
      'RFCH': 'ทีมเยือน/เจ้าบ้าน',
      'RFCN': 'ทีมเยือน/เสมอ',
      'RFCC': 'ทีมเยือน/ทีมเยือน'
    },
    'sort': [
      'RFHH',
      'RFNN',
      'RFCC',
      'RFHN',
      'RFNH',
      'RFCN',
      'RFHC',
      'RFNC',
      'RFCH'
    ]
  },
  "HROUC": {
    'col': 2,
    'text': {'HROUCU': 'ต่ำ {ratio}', 'HROUCO': 'สูง {ratio}'},
    "text2": {"HROUCO": 'สูง {ratio} ลูก', "HROUCU": 'ต่ำ {ratio} ลูก'},
    'sort': ['HROUCO', 'HROUCU']
  },
  "HROUH": {
    'col': 2,
    'text': {'HROUHU': 'ต่ำ {ratio}', 'HROUHO': 'สูง {ratio}'},
    "text2": {"HROUHO": 'สูง {ratio} ลูก', "HROUHU": 'ต่ำ {ratio} ลูก'},
    'sort': ['HROUHO', 'HROUHU']
  },
  "TEOC": {
    "col": 2,
    "col188": 1,
    "text": {"TEOCO": "คี่", "TEOCE": "คู่"},
    "sort": ["TEOCO", "TEOCE"]
  },
  "TEOH": {
    "col": 2,
    "col188": 1,
    "text": {"TEOHO": "คี่", "TEOHE": "คู่"},
    "sort": ["TEOHO", "TEOHE"]
  },
  "HTEOC": {
    "col": 2,
    "col188": 1,
    "text": {"HTEOCO": "คี่", "HTEOCE": "คู่"},
    "sort": ["HTEOCO", "HTEOCE"]
  },
  "HTEOH": {
    "col": 2,
    "col188": 1,
    "text": {"HTEOHO": "คี่", "HTEOHE": "คู่"},
    "sort": ["HTEOHO", "HTEOHE"]
  },
  "HTEOC2": {
    "col": 2,
    "col188": 1,
    "text": {"HTEOC2O": "คี่", "HTEOC2E": "คู่"},
    "sort": ["HTEOC2O", "HTEOC2E"]
  },
  "HTEOH2": {
    "col": 2,
    "col188": 1,
    "text": {"HTEOH2O": "คี่", "HTEOH2E": "คู่"},
    "sort": ["HTEOH2O", "HTEOH2E"]
  },
  "REOC": {
    "col": 2,
    "col188": 1,
    "text": {"REOCO": "คี่", "REOCE": "คู่"},
    "sort": ["REOCO", "REOCE"]
  },
  "REOH": {
    "col": 2,
    "col188": 1,
    "text": {
      "REOHO": "คี่",
      "REOHE": "คู่",
    },
    "sort": ["REOHO", "REOHE"]
  },
};
