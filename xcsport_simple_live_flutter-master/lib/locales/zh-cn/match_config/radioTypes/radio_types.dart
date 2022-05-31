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
import 'OP/OP_RU.dart';
import 'OP/OP_SN.dart';
import 'OP/OP_TN.dart';
import 'OP/OP_VB.dart';
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
import 'OP_DJ.dart';

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
  "OP_DJ":op_djRadioTypes,
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
    "col188": 1,
    'iorType': true,
    'text': {'RH': '{homeTeam} {ratio}', 'RC': '{awayTeam} {ratio}'},
    'text2': {'RH': '{homeTeam}（{ratio}）', 'RC': '{awayTeam}（{ratio}）'},
    'textAsia': {'RH': '{ratio}', 'RC': '{ratio}'},
    'sort': ['RH', 'RC']
  },
  'RE': {
    'col': 2,
    "col188": 1,
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
    "col188": 1,
    'text': {'HRH': '{homeTeam} {ratio}', 'HRC': '{awayTeam} {ratio}'},
    'text2': {'HRH': '{homeTeam}（{ratio}）', 'HRC': '{awayTeam}（{ratio}）'},
    'textAsia': {'HRH': '{ratio}', 'HRC': '{ratio}'},
    'sort': ['HRH', 'HRC']
  },
  'HRE': {
    'half': true,
    'iorType': true,
    'col': 2,
    "col188": 1,
    'text': {'HREH': '{homeTeam} {ratio}', 'HREC': '{awayTeam} {ratio}'},
    'text2': {'HREH': '{homeTeam}（{ratio}）', 'HREC': '{awayTeam}（{ratio}）'},
    'textAsia': {'HREH': '{ratio}', 'HREC': '{ratio}'},
    'sort': ['HREH', 'HREC']
  },
  'OU': {
    'col': 2,
    'iorType': true,
    'text': {'OUC': '大 {ratio}', 'OUH': '小 {ratio}'},
    'text2': {'OUC': '大 {ratio} 个球', 'OUH': '小 {ratio} 个球'},
    'textAsia': {'OUC': '大 {ratio}', 'OUH': '小 {ratio}'},
    'sort': ['OUC', 'OUH']
  },
  'ROU': {
    'col': 2,
    'iorType': true,
    'text': {'ROUC': '大 {ratio}', 'ROUH': '小 {ratio}'},
    'text2': {'ROUC': '大 {ratio} 个球', 'ROUH': '小 {ratio} 个球'},
    'textAsia': {'ROUC': '大 {ratio}', 'ROUH': '小 {ratio}'},
    'sort': ['ROUC', 'ROUH']
  },
  'HOU': {
    'half': true,
    'iorType': true,
    'col': 2,
    'text': {'HOUC': '大 {ratio}', 'HOUH': '小 {ratio}'},
    'text2': {'HOUC': '大 {ratio} 个球', 'HOUH': '小 {ratio} 个球'},
    'textAsia': {'HOUC': '大 {ratio}', 'HOUH': '小 {ratio}'},
    'sort': ['HOUC', 'HOUH']
  },
  'HROU': {
    'half': true,
    'iorType': true,
    'col': 2,
    'text': {'HROUC': '大 {ratio}', 'HROUH': '小 {ratio}'},
    'text2': {'HROUC': '大 {ratio} 个球', 'HROUH': '小 {ratio} 个球'},
    'textAsia': {'HROUC': '大 {ratio}', 'HROUH': '小 {ratio}'},
    'sort': ['HROUC', 'HROUH']
  },
  'M': {
    'col': 3,
    "col188": 1,
    'text': {'MH': '{homeTeam}', 'MN': '平', 'MC': '{awayTeam}'},
    'text2': {'MH': '{homeTeam}获胜', 'MN': "平", 'MC': '{awayTeam}获胜'},
    'textAsia': {'MH': '主胜', 'MN': '和局', 'MC': '客胜'},
    'newTextAsia': {'MH': '1', 'MN': 'x', 'MC': '2'},
    'textAsiaXiaobai': {'MH': '主胜', 'MN': '和局', 'MC': '客胜'},
    'newTextAsiaXiaobai': {'MH': '主胜', 'MN': '和局', 'MC': '客胜'},
    'sort': ['MH', 'MN', 'MC'],
    'sort_asia': ['MH', 'MC', 'MN']
  },
  'RM': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': '平', 'RMC': '{awayTeam}'},
    'text2': {'RMH': '{homeTeam}获胜', 'RMN': "平", 'RMC': '{awayTeam}获胜'},
    'textAsia': {'RMH': '主胜', 'RMN': '和局', 'RMC': '客胜'},
    'newTextAsia': {'RMH': '1', 'RMN': 'x', 'RMC': '2'},
    'textAsiaXiaobai': {'RMH': '主胜', 'RMN': '和局', 'RMC': '客胜'},
    'newTextAsiaXiaobai': {'RMH': '主胜', 'RMN': '和局', 'RMC': '客胜'},
    'sort': ['RMH', 'RMN', 'RMC'],
    'sort_asia': ['RMH', 'RMC', 'RMN']
  },
  'HM': {
    'half': true,
    'col': 3,
    "col188": 1,
    'text': {'HMH': '{homeTeam}', 'HMN': '平', 'HMC': '{awayTeam}'},
    'text2': {'HMH': '{homeTeam}获胜', 'HMN': "平", 'HMC': '{awayTeam}获胜'},
    'textAsia': {'HMH': '主胜', 'HMN': '和局', 'HMC': '客胜'},
    'newTextAsia': {'HMH': '1', 'HMN': 'x', 'HMC': '2'},
    'sort': ['HMH', 'HMN', 'HMC'],
    'sort_asia': ['HMH', 'HMC', 'HMN']
  },
  'HRM': {
    'half': true,
    'col': 3,
    "col188": 1,
    'text': {'HRMH': '{homeTeam}', 'HRMN': '平', 'HRMC': '{awayTeam}'},
    'text2': {'HRMH': '{homeTeam}获胜', 'HRMN': "平", 'HRMC': '{awayTeam}获胜'},
    'textAsia': {'HRMH': '主胜', 'HRMN': '和局', 'HRMC': '客胜'},
    'newTextAsia': {'HRMH': '1', 'HRMN': 'x', 'HRMC': '2'},
    'sort': ['HRMH', 'HRMN', 'HRMC'],
    'sort_asia': ['HRMH', 'HRMC', 'HRMN']
  },
  'EO': {
    'col': 2,
    'text': {'EOO': '单', 'EOE': '双'},
    'text2': {'EOO': '不会', 'EOE': '会（包含0球）'},
    'textAsia': {'EOO': '单', 'EOE': '双'},
    'sort': ['EOO', 'EOE']
  },
  'REO': {
    'col': 2,
    'text': {'REOO': '单', 'REOE': '双'},
    'text2': {'REOO': '不会', 'REOE': '会（包含0球）'},
    'textAsia': {'REOO': '单', 'REOE': '双'},
    'sort': ['REOO', 'REOE']
  },
  'HEO': {
    'half': true,
    'col': 2,
    'text': {'HEOO': '单', 'HEOE': '双'},
    'text2': {'HEOO': '不会', 'HEOE': '会（包含0球）'},
    'textAsia': {'HEOO': '单', 'HEOE': '双'},
    'sort': ['HEOO', 'HEOE']
  },
  'HREO': {
    'half': true,
    'col': 2,
    'text': {'HREOO': '单', 'HREOE': '双'},
    'text2': {'HREOO': '不会', 'HREOE': '会（包含0球）'},
    'textAsia': {'HREOO': '单', 'HREOE': '双'},
    'sort': ['HREOO', 'HREOE']
  },
  'F': {
    'col': 3,
    "col188": 1,
    'text': {
      'FHH': '主/主',
      'FHN': '主/平',
      'FHC': '主/客',
      'FNH': '平/主',
      'FNN': '平/平',
      'FNC': '平/客',
      'FCH': '客/主',
      'FCN': '客/平',
      'FCC': '客/客'
    },
    'sort': ['FHH', 'FNN', 'FCC', 'FHN', 'FNH', 'FCN', 'FHC', 'FNC', 'FCH']
  },
  'AM': {
    'col': 3,
    "col188": 1,
    'text': {'AMH': '{homeTeam}', 'AMN': '和局', 'AMC': '{awayTeam}'},
    'text2': {'AMH': '{homeTeam}获胜', 'AMN': "平", 'AMC': '{awayTeam}获胜'},
    'sort': ['AMH', 'AMN', 'AMC']
  },
  'BM': {
    'col': 3,
    "col188": 1,
    'text': {'BMH': '{homeTeam}', 'BMN': '和局', 'BMC': '{awayTeam}'},
    'text2': {'BMH': '{homeTeam}获胜', 'BMN': "平", 'BMC': '{awayTeam}获胜'},
    'sort': ['BMH', 'BMN', 'BMC']
  },
  'CM': {
    'col': 3,
    "col188": 1,
    'text': {'CMH': '{homeTeam}', 'CMN': '和局', 'CMC': '{awayTeam}'},
    'text2': {'CMH': '{homeTeam}获胜', 'CMN': "平", 'CMC': '{awayTeam}获胜'},
    'sort': ['CMH', 'CMN', 'CMC']
  },
  'DM': {
    'col': 3,
    "col188": 1,
    'text': {'DMH': '{homeTeam}', 'DMN': '和局', 'DMC': '{awayTeam}'},
    'text2': {'DMH': '{homeTeam}获胜', 'DMN': "平", 'DMC': '{awayTeam}获胜'},
    'sort': ['DMH', 'DMN', 'DMC']
  },
  'EM': {
    'col': 3,
    "col188": 1,
    'text': {'EMH': '{homeTeam}', 'EMN': '和局', 'EMC': '{awayTeam}'},
    'text2': {'EMH': '{homeTeam}获胜', 'EMN': "平", 'EMC': '{awayTeam}获胜'},
    'sort': ['EMH', 'EMN', 'EMC']
  },
  'FM': {
    'col': 3,
    "col188": 1,
    'text': {'FMH': '{homeTeam}', 'FMN': '和局', 'FMC': '{awayTeam}'},
    'text2': {'FMH': '{homeTeam}获胜', 'FMN': "平", 'FMC': '{awayTeam}获胜'},
    'sort': ['FMH', 'FMN', 'FMC']
  },
  'ARM': {
    'col': 3,
    "col188": 1,
    'text': {'AMH': '{homeTeam}', 'AMN': '和局', 'AMC': '{awayTeam}'},
    'text2': {'AMH': '{homeTeam}获胜', 'AMN': "平", 'AMC': '{awayTeam}获胜'},
    'sort': ['ARMH', 'ARMN', 'ARMC']
  },
  'BRM': {
    'col': 3,
    "col188": 1,
    'text': {'BMH': '{homeTeam}', 'BMN': '和局', 'BMC': '{awayTeam}'},
    'text2': {'BMH': '{homeTeam}获胜', 'BMN': "平", 'BMC': '{awayTeam}获胜'},
    'sort': ['BRMH', 'BRMN', 'BRMC']
  },
  'CRM': {
    'col': 3,
    "col188": 1,
    'text': {'CMH': '{homeTeam}', 'CMN': '和局', 'CMC': '{awayTeam}'},
    'text2': {'CMH': '{homeTeam}获胜', 'CMN': "平", 'CMC': '{awayTeam}获胜'},
    'sort': ['CRMH', 'CRMN', 'CRMC']
  },
  'DRM': {
    'col': 3,
    "col188": 1,
    'text': {'DMH': '{homeTeam}', 'DMN': '和局', 'DMC': '{awayTeam}'},
    'text2': {'DMH': '{homeTeam}获胜', 'DMN': "平", 'DMC': '{awayTeam}获胜'},
    'sort': ['DRMH', 'DRMN', 'DRMC']
  },
  'ERM': {
    'col': 3,
    "col188": 1,
    'text': {'EMH': '{homeTeam}', 'EMN': '和局', 'EMC': '{awayTeam}'},
    'text2': {'EMH': '{homeTeam}获胜', 'EMN': "平", 'EMC': '{awayTeam}获胜'},
    'sort': ['ERMH', 'ERMN', 'ERMC']
  },
  'FRM': {
    'col': 3,
    "col188": 1,
    'text': {'FMH': '{homeTeam}', 'FMN': '和局', 'FMC': '{awayTeam}'},
    'text2': {'FMH': '{homeTeam}获胜', 'FMN': "平", 'FMC': '{awayTeam}获胜'},
    'sort': ['FRMH', 'FRMN', 'FRMC']
  },
  'AR': {
    'col': 2,
    "col188": 1,
    'iorType': true,
    'text': {'ARH': '{homeTeam} {ratio}', 'ARC': '{awayTeam} {ratio}'},
    'sort': ['ARH', 'ARC']
  },
  'BR': {
    'col': 2,
    "col188": 1,
    'text': {'BRH': '{homeTeam} {ratio}', 'BRC': '{awayTeam} {ratio}'},
    'sort': ['BRH', 'BRC']
  },
  'CR': {
    'col': 2,
    "col188": 1,
    'text': {'CRH': '{homeTeam} {ratio}', 'CRC': '{awayTeam} {ratio}'},
    'sort': ['CRH', 'CRC']
  },
  'DR': {
    'col': 2,
    "col188": 1,
    'text': {'DRH': '{homeTeam} {ratio}', 'DRC': '{awayTeam} {ratio}'},
    'sort': ['DRH', 'DRC']
  },
  'ER': {
    'col': 2,
    "col188": 1,
    'text': {'ERH': '{homeTeam} {ratio}', 'ERC': '{awayTeam} {ratio}'},
    'sort': ['ERH', 'ERC']
  },
  'FR': {
    'col': 2,
    "col188": 1,
    'text': {'FRH': '{homeTeam} {ratio}', 'FRC': '{awayTeam} {ratio}'},
    'sort': ['FRH', 'FRC']
  },
  'ARE': {
    'col': 2,
    "col188": 1,
    'iorType': true,
    'text': {'ARH': '{homeTeam} {ratio}', 'ARC': '{awayTeam} {ratio}'},
    'sort': ['AREH', 'AREC']
  },
  'BRE': {
    'col': 2,
    "col188": 1,
    'text': {'BRH': '{homeTeam} {ratio}', 'BRC': '{awayTeam} {ratio}'},
    'sort': ['BREH', 'BREC']
  },
  'CRE': {
    'col': 2,
    "col188": 1,
    'text': {'CRH': '{homeTeam} {ratio}', 'CRC': '{awayTeam} {ratio}'},
    'sort': ['CREH', 'CREC']
  },
  'DRE': {
    'col': 2,
    "col188": 1,
    'text': {'DRH': '{homeTeam} {ratio}', 'DRC': '{awayTeam} {ratio}'},
    'sort': ['DREH', 'DREC']
  },
  'ERE': {
    'col': 2,
    "col188": 1,
    'text': {'ERH': '{homeTeam} {ratio}', 'ERC': '{awayTeam} {ratio}'},
    'sort': ['EREH', 'EREC']
  },
  'FRE': {
    'col': 2,
    "col188": 1,
    'text': {'FRH': '{homeTeam} {ratio}', 'FRC': '{awayTeam} {ratio}'},
    'sort': ['FREH', 'FREC']
  },
  'AOU': {
    'col': 2,
    'iorType': true,
    'text': {'AOUO': '大 {ratio}', 'AOUU': '小 {ratio}'},
    'text2': {'AOUO': '大 {ratio} 个球', 'AOUU': '小 {ratio} 个球'},
    'sort': ['AOUO', 'AOUU']
  },
  'BOU': {
    'col': 2,
    'text': {'BOUO': '大 {ratio}', 'BOUU': '小 {ratio}'},
    'text2': {'BOUO': '大 {ratio} 个球', 'BOUU': '小 {ratio} 个球'},
    'sort': ['BOUO', 'BOUU']
  },
  'COU': {
    'col': 2,
    'text': {'COUO': '大 {ratio}', 'COUU': '小 {ratio}'},
    'text2': {'COUO': '大 {ratio} 个球', 'COUU': '小 {ratio} 个球'},
    'sort': ['COUO', 'COUU']
  },
  'DOU': {
    'col': 2,
    'text': {'DOUO': '大 {ratio}', 'DOUU': '小 {ratio}'},
    'text2': {'DOUO': '大 {ratio} 个球', 'DOUU': '小 {ratio} 个球'},
    'sort': ['DOUO', 'DOUU']
  },
  'EOU': {
    'col': 2,
    'text': {'EOUO': '大 {ratio}', 'EOUU': '小 {ratio}'},
    'text2': {'EOUO': '大 {ratio} 个球', 'EOUU': '小 {ratio} 个球'},
    'sort': ['EOUO', 'EOUU']
  },
  'FOU': {
    'col': 2,
    'text': {'FOUO': '大 {ratio}', 'FOUU': '小 {ratio}'},
    'text2': {'FOUO': '大 {ratio} 个球', 'FOUU': '小 {ratio} 个球'},
    'sort': ['FOUO', 'FOUU']
  },
  'AROU': {
    'col': 2,
    'iorType': true,
    'text': {'AROUO': '大 {ratio}', 'AROUU': '小 {ratio}'},
    'text2': {'AROUO': '大 {ratio} 个球', 'AROUU': '小 {ratio} 个球'},
    'sort': ['AROUO', 'AROUU']
  },
  'BROU': {
    'col': 2,
    'text': {'BROUO': '大 {ratio}', 'BROUU': '小 {ratio}'},
    'text2': {'BROUO': '大 {ratio} 个球', 'BROUU': '小 {ratio} 个球'},
    'sort': ['BROUO', 'BROUU']
  },
  'CROU': {
    'col': 2,
    'text': {'CROUO': '大 {ratio}', 'CROUU': '小 {ratio}'},
    'text2': {'CROUO': '大 {ratio} 个球', 'CROUU': '小 {ratio} 个球'},
    'sort': ['CROUO', 'CROUU']
  },
  'DROU': {
    'col': 2,
    'text': {'DROUO': '大 {ratio}', 'DROUU': '小 {ratio}'},
    'text2': {'DROUO': '大 {ratio} 个球', 'DROUU': '小 {ratio} 个球'},
    'sort': ['DROUO', 'DROUU']
  },
  'EROU': {
    'col': 2,
    'text': {'EROUO': '大 {ratio}', 'EROUU': '小 {ratio}'},
    'text2': {'EROUO': '大 {ratio} 个球', 'EROUU': '小 {ratio} 个球'},
    'sort': ['EROUO', 'EROUU']
  },
  'FROU': {
    'col': 2,
    'text': {'FROUO': '大 {ratio}', 'FROUU': '小 {ratio}'},
    'text2': {'FROUO': '大 {ratio} 个球', 'FROUU': '小 {ratio} 个球'},
    'sort': ['FROUO', 'FROUU']
  },
  'BH': {
    'col': 2,
    "col188": 1,
    'text': {'BHH': '{homeTeam}', 'BHC': '{awayTeam}'},
    'sort': ['BHH', 'BHC']
  },
  'CS': {
    'col': 2,
    "col188": 1,
    'text': {'CSH': '{homeTeam}', 'CSC': '{awayTeam}'},
    'sort': ['CSH', 'CSC']
  },
  'DC': {
    'col': 3,
    "col188": 1,
    'text': {'DCHN': '主队/和局', 'DCCN': '客队/和局', 'DCHC': '主队/客队'},
    'sort': ['DCHN', 'DCCN', 'DCHC']
  },
  'F2G': {
    'col': 3,
    "col188": 1,
    'text': {'F2GH': '{homeTeam}', 'F2GC': '{awayTeam}', 'F2GN': '两队都沒'},
    'text2': {'F2GH': '{homeTeam}', 'F2GC': '{awayTeam}', 'F2GN': '都没有进2个'},
    'sort': ['F2GH', 'F2GC', 'F2GN']
  },
  'F3G': {
    'col': 3,
    "col188": 1,
    'text': {'F3GH': '{homeTeam}', 'F3GC': '{awayTeam}', 'F3GN': '两队都没'},
    'text2': {'F3GH': '{homeTeam}', 'F3GC': '{awayTeam}', 'F3GN': '都没有进3个'},
    'sort': ['F3GH', 'F3GC', 'F3GN']
  },
  'FG': {
    'col': 3,
    "col188": 1,
    'text': {
      'FGS': '普通脚踢射门',
      'FGH': '头球',
      'FGP': '点球',
      'FGF': '任意球',
      'FGO': '乌龙球',
      'FGN': '无进球'
    },
    'text2': {
      'FGS': '普通脚踢射门',
      'FGH': '头球',
      'FGP': '点球',
      'FGF': '任意球',
      'FGO': '乌龙球',
      'FGN': '无进球'
    },
    'sort': ['FGS', 'FGH', 'FGN', 'FGP', 'FGF', 'FGO']
  },
  'HG': {
    'col': 2,
    "col188": 1,
    'text': {'HGH': '上半场', 'HGC': '下半场'},
    'sort': ['HGH', 'HGC']
  },
  'HOUC': {
    'half': true,
    'col': 2,
    'text': {'HOUCO': '大 {ratio}', 'HOUCU': '小 {ratio}'},
    'text2': {'HOUCO': '大 {ratio} 个球', 'HOUCU': '小 {ratio} 个球'},
    'sort': ['HOUCO', 'HOUCU']
  },
  'HOUH': {
    'half': true,
    'col': 2,
    'text': {'HOUHO': '大 {ratio}', 'HOUHU': '小 {ratio}'},
    'text2': {'HOUHO': '大 {ratio} 个球', 'HOUHU': '小 {ratio} 个球'},
    'sort': ['HOUHO', 'HOUHU']
  },
  'HT': {
    'half': true,
    'col': 2,
    "col188": 1,
    'text': {'HT0': '0', 'HT1': '1', 'HT2': '2', 'HTOV': '3+'},
    'text2': {'HT0': '没有进球', 'HT1': '进1个球', 'HT2': '进2个球', 'HTOV': '进3个球以上'},
    'sort': ['HT0', 'HT1', 'HT2', 'HTOV']
  },
  'MG': {
    'col': 3,
    "col188": 1,
    'text': {'MGH': '上半场', 'MGN': '无进球', 'MGC': '下半场'},
    'sort': ['MGH', 'MGC', 'MGN']
  },
  'OUC': {
    'col': 2,
    'text': {'OUCO': '大 {ratio}', 'OUCU': '小 {ratio}'},
    'text2': {'OUCO': '大 {ratio} 个球', 'OUCU': '小 {ratio} 个球'},
    'sort': ['OUCO', 'OUCU']
  },
  'OUH': {
    'col': 2,
    'text': {'OUHO': '大 {ratio}', 'OUHU': '小 {ratio}'},
    'text2': {'OUHO': '大 {ratio} 个球', 'OUHU': '小 {ratio} 个球'},
    'sort': ['OUHO', 'OUHU']
  },
  'PA': {
    'col': 2,
    'text': {'PAH': '是', 'PAC': '否'},
    'sort': ['PAH', 'PAC']
  },
  'RCD': {
    'col': 2,
    'text': {'RCDH': '是', 'RCDC': '否'},
    'sort': ['RCDH', 'RCDC']
  },
  'SB': {
    'col': 2,
    "col188": 1,
    'text': {'SBH': '{homeTeam}', 'SBC': '{awayTeam}'},
    'sort': ['SBH', 'SBC']
  },
  'T': {
    'col': 2,
    "col188": 1,
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
      'T01': '0~1个进球',
      'T23': '2~3个进球',
      'T46': '4~6个进球',
      'OVER': '7个进球以上',
      'T01P': '0~1个进球',
      'T23P': '2~3个进球',
      'T46P': '4~5个进球',
      'OVERP': '6个进球以上'
    },
    'sort': ['T01', 'T23', 'T46', 'OVER', 'T01P', 'T23P', 'T46P', 'OVERP']
  },
  'T3G': {
    'col': 3,
    "col188": 1,
    'text': {'T3G1': '上半场26分钟或之前', 'T3G2': '上半场27分钟或之后', 'T3GN': '没有进球'},
    'sort': ['T3G1', 'T3G2', 'T3GN']
  },
  'TK': {
    'col': 2,
    "col188": 1,
    'text': {'TKH': '{homeTeam}', 'TKC': '{awayTeam}'},
    'sort': ['TKH', 'TKC']
  },
  'TS': {
    'col': 2,
    'text': {'TSY': '是', 'TSN': '否'},
    'sort': ['TSY', 'TSN']
  },
  'W3': {
    'col': 3,
    "col188": 1,
    'text': {
      'W3H': '{homeTeam} {ratio}',
      'W3N': '和局 {ratio}',
      'W3C': '{awayTeam} {ratio}'
    },
    'sort': ['W3H', 'W3N', 'W3C']
  },
  'WB': {
    'col': 2,
    "col188": 1,
    'text': {'WBH': '{homeTeam}', 'WBC': '{awayTeam}'},
    'sort': ['WBH', 'WBC']
  },
  'WE': {
    'col': 2,
    "col188": 1,
    'text': {'WEH': '{homeTeam}', 'WEC': '{awayTeam}'},
    'sort': ['WEH', 'WEC']
  },
  'WM': {
    'col': 2,
    "col188": 1,
    'text': {
      'WMH1': '主队-净贏1球',
      'WMH2': '主队-净贏2球',
      'WMH3': '主队-净贏3球',
      'WMHOV': '主队-净贏4 球以上',
      'WMC1': '客队-净贏1球',
      'WMC2': '客队-净贏2球',
      'WMC3': '客队-净贏3球',
      'WMCOV': '客队-净贏4 球以上',
      'WMN': '进球和局',
      'WM0': '无进球',
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
    "col188": 1,
    'text': {'WNH': '{homeTeam}', 'WNC': '{awayTeam}'},
    'sort': ['WNH', 'WNC']
  },
  'ARG': {
    'col': 3,
    "col188": 1,
    'text': {'ARGC': '{awayTeam}', 'ARGN': '没有进球', 'ARGH': '{homeTeam}'},
    'sort': ['ARGH', 'ARGC', 'ARGN']
  },
  'BRG': {
    'col': 3,
    "col188": 1,
    'text': {'BRGN': '没有进球', 'BRGH': '{homeTeam}', 'BRGC': '{awayTeam}'},
    'sort': ['BRGN', 'BRGH', 'BRGC']
  },
  'CD': {
    'col': 2,
    "col188": 1,
    'text': {
      'CDFH': '第一张 - {homeTeam}',
      'CDFC': '第一张 - {awayTeam}',
      'CDLH': '最后一张 - {homeTeam}',
      'CDLC': '最后一张 - {awayTeam}',
      'CDLN': '没有罚牌',
      'CDFN': '没有罚牌'
    },
    'sort': ['CDFH', 'CDFC', 'CDLH', 'CDLC', 'CDLN', 'CDFN']
  },
  'CN': {
    'col': 3,
    "col188": 1,
    'text': {
      'CNLC': '最后一个 - {awayTeam}',
      'CNLH': '最后一个 - {homeTeam}',
      'CNFN': '没有角球',
      'CNLN': '没有角球',
      'CNFH': '第一个 - {homeTeam}',
      'CNFC': '第一个 - {awayTeam}'
    },
    'sort': ['CNFH', 'CNFC', 'CNFN', 'CNLH', 'CNLC', 'CNLN']
  },
  'CRG': {
    'col': 3,
    "col188": 1,
    'text': {'CRGC': '{awayTeam}', 'CRGN': '没有进球', 'CRGH': '{homeTeam}'},
    'sort': ['CRGH', 'CRGC', 'CRGN']
  },
  'DRG': {
    'col': 3,
    "col188": 1,
    'text': {'DRGN': '没有进球', 'DRGC': '{awayTeam}', 'DRGH': '{homeTeam}'},
    'sort': ['DRGH', 'DRGC', 'DRGN']
  },
  'ERG': {
    'col': 3,
    "col188": 1,
    'text': {'ERGH': '{homeTeam}', 'ERGC': '{awayTeam}', 'ERGN': '没有进球'},
    'sort': ['ERGH', 'ERGC', 'ERGN']
  },
  'FRG': {
    'col': 3,
    "col188": 1,
    'text': {'FRGN': '没有进球', 'FRGC': '{awayTeam}', 'FRGH': '{homeTeam}'},
    'sort': ['FRGH', 'FRGC', 'FRGN']
  },
  'GA': {
    'col': 2,
    "col188": 1,
    'text': {
      'GAFC': '最先球门球 - {awayTeam}',
      'GAFH': '最先球门球 - {homeTeam}',
      'GALC': '最后球门球 - {awayTeam}',
      'GALH': '最后球门球 - {homeTeam}'
    },
    'sort': ['GAFH', 'GAFC', 'GALH', 'GALC']
  },
  'GRG': {
    'col': 3,
    "col188": 1,
    'text': {'GRGH': '{homeTeam}', 'GRGN': '没有进球', 'GRGC': '{awayTeam}'},
    'sort': ['GRGH', 'GRGC', 'GRGN']
  },
  'HPD': {
    'half': true,
    'col': 2,
    'text': {},
    'sort': [],
  },
  'HRG': {
    'col': 3,
    "col188": 1,
    'text': {'HRGN': '没有进球', 'HRGC': '{awayTeam}', 'HRGH': '{homeTeam}'},
    'sort': ['HRGH', 'HRGC', 'HRGN']
  },
  'HRPD': {'half': true, 'col': 2, 'text': {}, 'sort': []},
  'HRT': {
    'half': true,
    'col': 2,
    "col188": 1,
    'text': {'HRT1': '1', 'HRT0': '0', 'HRTOV': '3+', 'HRT2': '2'},
    'text2': {
      'HRT1': '进1个球',
      'HRT0': '没有进球',
      'HRT2': '进2个球',
      'HRTOV': '进3个球以上'
    },
    'sort': ['HRT0', 'HRT1', 'HRT2', 'HRTOV']
  },
  'HRUC': {
    'half': true,
    'col': 2,
    'text': {'HRUCU': '小于 {ratio}', 'HRUCO': '大于 {ratio}'},
    'text2': {'HRUCO': '大于 {ratio} 个球', 'HRUCU': '小于 {ratio} 个球'},
    'sort': ['HRUCO', 'HRUCU']
  },
  'HRUH': {
    'half': true,
    'col': 2,
    'text': {'HRUHO': '大于 {ratio}', 'HRUHU': '小于 {ratio}'},
    'text2': {'HRUHO': '大于 {ratio} 个球', 'HRUHU': '小于 {ratio} 个球'},
    'sort': ['HRUHO', 'HRUHU']
  },
  'IRG': {
    'col': 3,
    "col188": 1,
    'text': {'IRGH': '{homeTeam}', 'IRGN': '没有进球', 'IRGC': '{awayTeam}'},
    'sort': ['IRGH', 'IRGC', 'IRGN']
  },
  'JRG': {
    'col': 3,
    "col188": 1,
    'text': {'JRGH': '{homeTeam}', 'JRGN': '没有进球', 'JRGC': '{awayTeam}'},
    'sort': ['JRGH', 'JRGC', 'JRGN']
  },
  'OS': {
    'col': 2,
    "col188": 1,
    'text': {
      'OSLH': '后越位 - {homeTeam}',
      'OSFN': '先越位 - 无',
      'OSFC': '先越位 - {awayTeam}',
      'OSLC': '后越位 - {awayTeam}',
      'OSFH': '先越位 - {homeTeam} '
    },
    'sort': ['OSLH', 'OSFN', 'OSFC', 'OSLC', 'OSFH']
  },
  'PD': {'col': 2, 'text': {}, 'sort': []},
  'PG': {
    'col': 2,
    "col188": 1,
    'text': {
      'PGLC': '后进球 - {awayTeam}',
      'PGFH': '先进球 - {homeTeam}',
      'PGFN': '先进球 - 无',
      'PGFC': '先进球 - {awayTeam}',
      'PGLH': '后进球 - {homeTeam}'
    },
    'sort': ['PGLC', 'PGFH', 'PGFN', 'PGFC', 'PGLH']
  },
  'RC': {
    'col': 2,
    "col188": 1,
    'text': {
      'RCFH': '最先任意球 - {homeTeam} ',
      'RCLH': '最后任意球 - {homeTeam} ',
      'RCFC': '最先任意球 - {awayTeam} ',
      'RCLC': '最后任意球 - {awayTeam} '
    },
    'sort': ['RCFH', 'RCFC', 'RCLH', 'RCLC']
  },
  'RCS': {
    'col': 2,
    "col188": 1,
    'text': {'RCSC': '{awayTeam}', 'RCSH': '{homeTeam}'},
    'sort': ['RCSC', 'RCSH']
  },
  'RDC': {
    'col': 3,
    "col188": 1,
    'text': {'RDCHN': '主队/和局', 'RDCHC': '主队/客队', 'RDCCN': '客队/和局'},
    'sort': ['RDCHN', 'RDCHC', 'RDCCN']
  },
  'RHG': {
    'col': 2,
    "col188": 1,
    'text': {'RHGH': '上半场', 'RHGC': '下半场'},
    'sort': ['RHGH', 'RHGC']
  },
  'RMG': {
    'col': 3,
    "col188": 1,
    'text': {'RMGN': '得分相同', 'RMGC': '下半场', 'RMGH': '上半场'},
    'sort': ['RMGH', 'RMGC', 'RMGN']
  },
  'ROUC': {
    'col': 2,
    'text': {'ROUCU': '小 {ratio}', 'ROUCO': '大 {ratio}'},
    'text2': {'ROUCO': '大 {ratio} 个球', 'ROUCU': '小 {ratio} 个球'},
    'sort': ['ROUCO', 'ROUCU']
  },
  'ROUH': {
    'col': 2,
    'text': {'ROUHU': '小 {ratio}', 'ROUHO': '大 {ratio}'},
    'text2': {'ROUHO': '大 {ratio} 个球', 'ROUHU': '小 {ratio} 个球'},
    'sort': ['ROUHO', 'ROUHU']
  },
  'RPD': {'col': 2, 'text': {}, 'sort': []},
  'RSB': {
    'col': 2,
    "col188": 1,
    'text': {'RSBC': '{awayTeam}', 'RSBH': '{homeTeam}'},
    'sort': ['RSBC', 'RSBH']
  },
  'RT': {
    'col': 2,
    "col188": 1,
    'text': {
      'RT01P': '0-1个球',
      'RT23P': '2-3个球',
      'RT46P': '4-5个球',
      'ROVERP': '6+个球',
      'RT46': '4~6个球',
      'RT01': '0~1个球',
      'RT23': '2~3个球',
      'ROVER': '7+个球',
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
    "col188": 1,
    'text': {
      'RT1G3': '上半场30：00 - 半场结束',
      'RT1G2': '上半场15：00 - 29：59',
      'RT1G1': '比赛开始 - 14:59',
      'RT1G6': '下半场75：00 - 完场',
      'RT1G5': '下半场60：00 - 74：59',
      'RT1G4': '下半场开始 - 59：59',
      'RT1GN': '没有进球'
    },
    'sort': ['RT1G1', 'RT1G2', 'RT1G3', 'RT1G4', 'RT1G5', 'RT1G6', 'RT1GN']
  },
  'RT3G': {
    'col': 3,
    "col188": 1,
    'text': {'RT3G1': '上半场26分钟或之前', 'RT3G2': '上半场27分钟或之后', 'RT3GN': '没有进球'},
    'sort': ['RT3G1', 'RT3G2', 'RT3GN']
  },
  'RTS': {
    'col': 2,
    'text': {'RTSY': '是', 'RTSN': '否'},
    'sort': ['RTSY', 'RTSN']
  },
  'RWB': {
    'col': 2,
    "col188": 1,
    'text': {'RWBC': '{awayTeam}', 'RWBH': '{homeTeam}'},
    'sort': ['RWBC', 'RWBH']
  },
  'RWE': {
    'col': 2,
    "col188": 1,
    'text': {'RWEH': '{homeTeam}', 'RWEC': '{awayTeam}'},
    'sort': ['RWEH', 'RWEC']
  },
  'RWM': {
    'col': 2,
    "col188": 1,
    'text': {
      'RWMH1': '主队-净贏1球',
      'RWMH2': '主队-净贏2球',
      'RWMH3': '主队-净贏3球',
      'RWMHOV': '主队-净贏4球以上',
      'RWMC1': '客队-净贏1球',
      'RWMC2': '客队-净贏2球',
      'RWMC3': '客队-净贏3球',
      'RWMCOV': '客队-净贏4球以上',
      'RWMN': '进球和局',
      'RWM0': '无进球',
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
    "col188": 1,
    'text': {'RWNH': '{homeTeam}', 'RWNC': '{awayTeam}'},
    'sort': ['RWNH', 'RWNC']
  },
  'ST': {
    'col': 2,
    "col188": 1,
    'text': {
      'STLC': '后替补球员 - {awayTeam}',
      'STFC': '先替补球员 - {awayTeam}',
      'STLH': '后替补球员 - {homeTeam}',
      'STFN': '先替补球员 - 无',
      'STFH': '先替补球员 - {homeTeam}'
    },
    'sort': ['STLC', 'STFC', 'STLH', 'STFN', 'STFH']
  },
  'YC': {
    'col': 2,
    "col188": 1,
    'text': {
      'YCFH': '最先界外球 - {homeTeam}',
      'YCFC': '最先界外球 - {awayTeam}',
      'YCLH': '最后界外球 - {homeTeam}',
      'YCLC': '最后界外球 - {awayTeam} '
    },
    'sort': ['YCFH', 'YCFC', 'YCLH', 'YCLC']
  },
  'KR': {
    'col': 2,
    "col188": 1,
    'text': {'KRH': '{homeTeam} {ratio}', 'KRC': '{awayTeam} {ratio}'},
    'sort': ['KRH', 'KRC']
  },
  'KOU': {
    'col': 2,
    'text': {'KOUC': '大 {ratio}', 'KOUH': '小 {ratio}'},
    'sort': ['KOUC', 'KOUH']
  },
  'KEO': {
    'col': 2,
    'text': {'KEOO': '单', 'KEOE': '双'},
    'sort': ['KEOO', 'KEOE']
  },
  'FB': {
    'col': 2,
    "col188": 1,
    'text': {'FBH': '{homeTeam}', 'FBC': '{awayTeam}'},
    'sort': ['FBH', 'FBC']
  },
  'K5': {
    'col': 2,
    "col188": 1,
    'text': {'K5H': '{homeTeam}', 'K5C': '{awayTeam}'},
    'sort': ['K5H', 'K5C']
  },
  'R5': {
    'col': 2,
    'text': {'R5Y': '是', 'R5N': '否'},
    'sort': ['R5Y', 'R5N']
  },
  'CT': {
    'col': 2,
    "col188": 1,
    'text': {'CT33': '33:00或以下', 'CT34': '33:01或以上'},
    'sort': ['CT33', 'CT34']
  },
  'K10': {
    'col': 2,
    "col188": 1,
    'text': {'K10H': '{homeTeam}', 'K10C': '{awayTeam}'},
    'sort': ['K10H', 'K10C']
  },
  'R10': {
    'col': 2,
    'text': {'R10Y': '是', 'R10N': '否'},
    'sort': ['R10Y', 'R10N']
  },
  'KM': {
    'col': 2,
    "col188": 1,
    'text': {'KMC': '{homeTeam}', 'KMH': '{awayTeam}'},
    'sort': ['KMC', 'KMH']
  },
  'MR_MK': {
    'col': 2,
    "col188": 1,
    'text': {'MR_MKH': '{homeTeam}', 'MR_MKA': '{awayTeam}'},
    'sort': ['MR_MKH', 'MR_MKA']
  },
  'MR_MW': {
    'col': 2,
    "col188": 1,
    'text': {'MR_MWH': '{homeTeam}', 'MR_MWA': '{awayTeam}'},
    'sort': ['MR_MWH', 'MR_MWA']
  },
  'MR_DT': {
    'col': 2,
    "col188": 1,
    'text': {'MR_DTH': '{homeTeam}', 'MR_DTA': '{awayTeam}'},
    'sort': ['MR_DTH', 'MR_DTA']
  },
  'MR_MB': {
    'col': 2,
    "col188": 1,
    'text': {'MR_MBH': '{homeTeam}', 'MR_MBA': '{awayTeam}'},
    'sort': ['MR_MBH', 'MR_MBA']
  },
  'MR_KH': {
    'col': 2,
    "col188": 1,
    'text': {'MR_KHH': '{homeTeam} {ratio}', 'MR_KHC': '{awayTeam} {ratio}'},
    'sort': ['MR_KHH', 'MR_KHC']
  },
  'MR_TH': {
    'col': 2,
    "col188": 1,
    'text': {'MR_THH': '{homeTeam} {ratio}', 'MR_THC': '{awayTeam} {ratio}'},
    'sort': ['MR_THH', 'MR_THC']
  },
  'MR_RK': {
    'col': 2,
    "col188": 1,
    'text': {'MR_RKH': '{homeTeam}', 'MR_RKA': '{awayTeam}'},
    'sort': ['MR_RKH', 'MR_RKA']
  },
  'MOU_TK': {
    'col': 2,
    'text': {'MOU_TK12': '大 {ratio}', 'MOU_TK13': '小 {ratio}'},
    'sort': ['MOU_TK12', 'MOU_TK13']
  },
  'MOU_TKFT': {
    'col': 2,
    'text': {'MOU_TKFT4': '大 {ratio}', 'MOU_TKFT5': '小 {ratio}'},
    'sort': ['MOU_TKFT4', 'MOU_TKFT5']
  },
  'MR_MS': {
    'col': 2,
    "col188": 1,
    'text': {'MR_MSH': '{homeTeam}', 'MR_MSA': '{awayTeam}'},
    'sort': ['MR_MSH', 'MR_MSA']
  },
  'MOU_KH': {
    'col': 2,
    'text': {'MOU_TK12': '大 {ratio}', 'MOU_TK13': '小 {ratio}'},
    'sort': ['MOU_TK12', 'MOU_TK13']
  },
  'HR2': {
    'col': 2,
    "col188": 1,
    'text': {'HR2H': '{homeTeam} {ratio}', 'HR2C': '{awayTeam} {ratio}'},
    'sort': ['HR2H', 'HR2C']
  },
  "MA": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RA": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUA": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "MB": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RB": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUB": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "MD": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RD": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUD": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "MK": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RK": {
    "col": 2,
    "col188": 1,
    "text": {"RH": '{homeTeam} {ratio}', "RC": '{awayTeam} {ratio}'},
    "sort": ['RH', 'RC']
  },
  "OUK": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "RG": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUG": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "ML": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RL": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUL": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "MQ": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "RQ": {
    "col": 2,
    "col188": 1,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUQ": {
    "col": 2,
    "text": {"OUC": "大 {ratio}", "OUH": "小 {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "M1": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "M2": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "M3": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "M4": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "M5": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  'RM1': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM2': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM3': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM4': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM5': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM6': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM7': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM8': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM9': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM10': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM11': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM12': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM13': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM14': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM15': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM16': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM17': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM18': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM19': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM20': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM21': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM22': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM23': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM24': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM25': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM26': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM27': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM28': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM29': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM30': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM31': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM32': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM33': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM34': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RM35': {
    'col': 2,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMC': '{awayTeam}'},
    'sort': ['RMH', 'RMC']
  },
  'RF': {
    'col': 3,
    "col188": 1,
    'text': {
      'RFHH': '主/主',
      'RFHN': '主/平',
      'RFHC': '主/客',
      'RFNH': '平/主',
      'RFNN': '平/平',
      'RFNC': '平/客',
      'RFCH': '客/主',
      'RFCN': '客/平',
      'RFCC': '客/客'
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
    'text': {'HROUCU': '小 {ratio}', 'HROUCO': '大 {ratio}'},
    "text2": {"HROUCO": '大 {ratio} 个球', "HROUCU": '小 {ratio} 个球'},
    'sort': ['HROUCO', 'HROUCU']
  },
  "HROUH": {
    'col': 2,
    'text': {'HROUHU': '小 {ratio}', 'HROUHO': '大 {ratio}'},
    "text2": {"HROUHO": '大 {ratio} 个球', "HROUHU": '小 {ratio} 个球'},
    'sort': ['HROUHO', 'HROUHU']
  },
  "TEOC": {
    "col": 2,
    "text": {"TEOCO": "单", "TEOCE": "双"},
    "sort": ["TEOCO", "TEOCE"]
  },
  "TEOH": {
    "col": 2,
    "text": {"TEOHO": "单", "TEOHE": "双"},
    "sort": ["TEOHO", "TEOHE"]
  },
  "HTEOC": {
    "col": 2,
    "text": {"HTEOCO": "单", "HTEOCE": "双"},
    "sort": ["HTEOCO", "HTEOCE"]
  },
  "HTEOH": {
    "col": 2,
    "text": {"HTEOHO": "单", "HTEOHE": "双"},
    "sort": ["HTEOHO", "HTEOHE"]
  },
  "HTEOC2": {
    "col": 2,
    "text": {"HTEOC2O": "单", "HTEOC2E": "双"},
    "sort": ["HTEOC2O", "HTEOC2E"]
  },
  "HTEOH2": {
    "col": 2,
    "text": {"HTEOH2O": "单", "HTEOH2E": "双"},
    "sort": ["HTEOH2O", "HTEOH2E"]
  },
  "REOC": {
    "col": 2,
    "text": {"REOCO": "单", "REOCE": "双"},
    "sort": ["REOCO", "REOCE"]
  },
  "REOH": {
    "col": 2,
    "text": {
      "REOHO": "单",
      "REOHE": "双",
    },
    "sort": ["REOHO", "REOHE"]
  },
  
};
