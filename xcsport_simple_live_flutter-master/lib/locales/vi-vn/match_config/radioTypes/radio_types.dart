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
    'text': {'OUC': 'Tài {ratio}', 'OUH': 'Xỉu {ratio}'},
    'text2': {'OUC': 'Tài {ratio} bóng', 'OUH': 'Xỉu {ratio} bóng'},
    'textAsia': {'OUC': 'Tài {ratio}', 'OUH': 'Xỉu {ratio}'},
    'sort': ['OUC', 'OUH']
  },
  'ROU': {
    'col': 2,
    'iorType': true,
    'text': {'ROUC': 'Tài {ratio}', 'ROUH': 'Xỉu {ratio}'},
    'text2': {'ROUC': 'Tài {ratio} bóng', 'ROUH': 'Xỉu {ratio} bóng'},
    'textAsia': {'ROUC': 'Tài {ratio}', 'ROUH': 'Xỉu {ratio}'},
    'sort': ['ROUC', 'ROUH']
  },
  'HOU': {
    'half': true,
    'iorType': true,
    'col': 2,
    'text': {'HOUC': 'Tài {ratio}', 'HOUH': 'Xỉu {ratio}'},
    'text2': {'HOUC': 'Tài {ratio} bóng', 'HOUH': 'Xỉu {ratio} bóng'},
    'textAsia': {'HOUC': 'Tài {ratio}', 'HOUH': 'Xỉu {ratio}'},
    'sort': ['HOUC', 'HOUH']
  },
  'HROU': {
    'half': true,
    'iorType': true,
    'col': 2,
    'text': {'HROUC': 'Tài {ratio}', 'HROUH': 'Xỉu {ratio}'},
    'text2': {'HROUC': 'Tài {ratio} bóng', 'HROUH': 'Xỉu {ratio} bóng'},
    'textAsia': {'HROUC': 'Tài {ratio}', 'HROUH': 'Xỉu {ratio}'},
    'sort': ['HROUC', 'HROUH']
  },
  'M': {
    'col': 3,
    'text': {'MH': '{homeTeam}', 'MN': 'Hòa', 'MC': '{awayTeam}'},
    'text2': {
      'MH': '{homeTeam} Chiến thắng',
      'MN': 'Hòa',
      'MC': '{awayTeam} Chiến thắng'
    },
    'textAsia': {'MH': 'Chủ nhà thắng', 'MN': 'Hòa', 'MC': 'Khách thắng'},
    'newTextAsia': {'MH': '1', 'MN': 'x', 'MC': '2'},
    'textAsiaXiaobai': {
      'MH': 'Chủ nhà thắng',
      'MN': 'Hòa',
      'MC': 'Khách thắng'
    },
    'newTextAsiaXiaobai': {
      'MH': 'Chủ nhà thắng',
      'MN': 'Hòa',
      'MC': 'Khách thắng'
    },
    'sort': ['MH', 'MN', 'MC'],
    'sort_asia': ['MH', 'MC', 'MN']
  },
  'RM': {
    'col': 3,
    'text': {'RMH': '{homeTeam}', 'RMN': 'Hòa', 'RMC': '{awayTeam}'},
    'text2': {
      'RMH': '{homeTeam} Chiến thắng',
      'RMN': 'Hòa',
      'RMC': '{awayTeam} Chiến thắng'
    },
    'textAsia': {'RMH': 'Chủ nhà thắng', 'RMN': 'Hòa', 'RMC': 'Khách thắng'},
    'newTextAsia': {'RMH': '1', 'RMN': 'x', 'RMC': '2'},
    'textAsiaXiaobai': {
      'RMH': 'Chủ nhà thắng',
      'RMN': 'Hòa',
      'RMC': 'Khách thắng'
    },
    'newTextAsiaXiaobai': {
      'RMH': 'Chủ nhà thắng',
      'RMN': 'Hòa',
      'RMC': 'Khách thắng'
    },
    'sort': ['RMH', 'RMN', 'RMC'],
    'sort_asia': ['RMH', 'RMC', 'RMN']
  },
  'HM': {
    'half': true,
    'col': 3,
    'text': {'HMH': '{homeTeam}', 'HMN': 'Hòa', 'HMC': '{awayTeam}'},
    'text2': {
      'HMH': '{homeTeam} Chiến thắng',
      'HMN': 'Hòa',
      'HMC': '{awayTeam} Chiến thắng'
    },
    'textAsia': {'HMH': 'Chủ nhà thắng', 'HMN': 'Hòa', 'HMC': 'Khách thắng'},
    'newTextAsia': {'HMH': '1', 'HMN': 'x', 'HMC': '2'},
    'sort': ['HMH', 'HMN', 'HMC'],
    'sort_asia': ['HMH', 'HMC', 'HMN']
  },
  'HRM': {
    'half': true,
    'col': 3,
    'text': {'HRMH': '{homeTeam}', 'HRMN': 'Hòa', 'HRMC': '{awayTeam}'},
    'text2': {
      'HRMH': '{homeTeam} Chiến thắng',
      'HRMN': 'Hòa',
      'HRMC': '{awayTeam} Chiến thắng'
    },
    'textAsia': {'HRMH': 'Chủ nhà thắng', 'HRMN': 'Hòa', 'HRMC': 'Khách thắng'},
    'newTextAsia': {'HRMH': '1', 'HRMN': 'x', 'HRMC': '2'},
    'sort': ['HRMH', 'HRMN', 'HRMC'],
    'sort_asia': ['HRMH', 'HRMC', 'HRMN']
  },
  'EO': {
    'col': 2,
    'text': {'EOO': 'Lẻ', 'EOE': 'Chẵn'},
    'text2': {'EOO': 'Không', 'EOE': 'Có (gồm 0 bóng）'},
    'textAsia': {'EOO': 'Lẻ', 'EOE': 'Chẵn'},
    'sort': ['EOO', 'EOE']
  },
  'REO': {
    'col': 2,
    'text': {'REOO': 'Lẻ', 'REOE': 'Chẵn'},
    'text2': {'REOO': 'Không', 'REOE': 'Có (gồm 0 bóng）'},
    'textAsia': {'REOO': 'Lẻ', 'REOE': 'Chẵn'},
    'sort': ['REOO', 'REOE']
  },
  'HEO': {
    'half': true,
    'col': 2,
    'text': {'HEOO': 'Lẻ', 'HEOE': 'Chẵn'},
    'text2': {'HEOO': 'Không', 'HEOE': 'Có (gồm 0 bóng）'},
    'textAsia': {'HEOO': 'Lẻ', 'HEOE': 'Chẵn'},
    'sort': ['HEOO', 'HEOE']
  },
  'HREO': {
    'half': true,
    'col': 2,
    'text': {'HREOO': 'Lẻ', 'HREOE': 'Chẵn'},
    'text2': {'HREOO': 'Không', 'HREOE': 'Có (gồm 0 bóng）'},
    'textAsia': {'HREOO': 'Lẻ', 'HREOE': 'Chẵn'},
    'sort': ['HREOO', 'HREOE']
  },
  'F': {
    'col': 3,
    'text': {
      'FHH': 'Chủ/Chủ',
      'FHN': 'Chủ/Hòa',
      'FHC': 'Chủ/Khách',
      'FNH': 'Hòa/Chủ',
      'FNN': 'Hòa/Hòa',
      'FNC': 'Hòa/Khách',
      'FCH': 'Khách/Chủ',
      'FCN': 'Khách/Hòa',
      'FCC': 'Khách/Khách'
    },
    'sort': ['FHH', 'FNN', 'FCC', 'FHN', 'FNH', 'FCN', 'FHC', 'FNC', 'FCH']
  },
  'AM': {
    'col': 3,
    'text': {'AMH': '{homeTeam}', 'AMN': 'Hòa', 'AMC': '{awayTeam}'},
    'text2': {
      'AMH': '{homeTeam} Chiến thắng',
      'AMN': 'Hòa',
      'AMC': '{awayTeam} Chiến thắng'
    },
    'sort': ['AMH', 'AMN', 'AMC']
  },
  'BM': {
    'col': 3,
    'text': {'BMH': '{homeTeam}', 'BMN': 'Hòa', 'BMC': '{awayTeam}'},
    'text2': {
      'BMH': '{homeTeam} Chiến thắng',
      'BMN': 'Hòa',
      'BMC': '{awayTeam} Chiến thắng'
    },
    'sort': ['BMH', 'BMN', 'BMC']
  },
  'CM': {
    'col': 3,
    'text': {'CMH': '{homeTeam}', 'CMN': 'Hòa', 'CMC': '{awayTeam}'},
    'text2': {
      'CMH': '{homeTeam} Chiến thắng',
      'CMN': 'Hòa',
      'CMC': '{awayTeam} Chiến thắng'
    },
    'sort': ['CMH', 'CMN', 'CMC']
  },
  'DM': {
    'col': 3,
    'text': {'DMH': '{homeTeam}', 'DMN': 'Hòa', 'DMC': '{awayTeam}'},
    'text2': {
      'DMH': '{homeTeam} Chiến thắng',
      'DMN': 'Hòa',
      'DMC': '{awayTeam} Chiến thắng'
    },
    'sort': ['DMH', 'DMN', 'DMC']
  },
  'EM': {
    'col': 3,
    'text': {'EMH': '{homeTeam}', 'EMN': 'Hòa', 'EMC': '{awayTeam}'},
    'text2': {
      'EMH': '{homeTeam} Chiến thắng',
      'EMN': 'Hòa',
      'EMC': '{awayTeam} Chiến thắng'
    },
    'sort': ['EMH', 'EMN', 'EMC']
  },
  'FM': {
    'col': 3,
    'text': {'FMH': '{homeTeam}', 'FMN': 'Hòa', 'FMC': '{awayTeam}'},
    'text2': {
      'FMH': '{homeTeam} Chiến thắng',
      'FMN': 'Hòa',
      'FMC': '{awayTeam} Chiến thắng'
    },
    'sort': ['FMH', 'FMN', 'FMC']
  },
  'ARM': {
    'col': 3,
    'text': {'AMH': '{homeTeam}', 'AMN': 'Hòa', 'AMC': '{awayTeam}'},
    'text2': {
      'AMH': '{homeTeam} Chiến thắng',
      'AMN': 'Hòa',
      'AMC': '{awayTeam} Chiến thắng'
    },
    'sort': ['ARMH', 'ARMN', 'ARMC']
  },
  'BRM': {
    'col': 3,
    'text': {'BMH': '{homeTeam}', 'BMN': 'Hòa', 'BMC': '{awayTeam}'},
    'text2': {
      'BMH': '{homeTeam} Chiến thắng',
      'BMN': 'Hòa',
      'BMC': '{awayTeam} Chiến thắng'
    },
    'sort': ['BRMH', 'BRMN', 'BRMC']
  },
  'CRM': {
    'col': 3,
    'text': {'CMH': '{homeTeam}', 'CMN': 'Hòa', 'CMC': '{awayTeam}'},
    'text2': {
      'CMH': '{homeTeam} Chiến thắng',
      'CMN': 'Hòa',
      'CMC': '{awayTeam} Chiến thắng'
    },
    'sort': ['CRMH', 'CRMN', 'CRMC']
  },
  'DRM': {
    'col': 3,
    'text': {'DMH': '{homeTeam}', 'DMN': 'Hòa', 'DMC': '{awayTeam}'},
    'text2': {
      'DMH': '{homeTeam} Chiến thắng',
      'DMN': 'Hòa',
      'DMC': '{awayTeam} Chiến thắng'
    },
    'sort': ['DRMH', 'DRMN', 'DRMC']
  },
  'ERM': {
    'col': 3,
    'text': {'EMH': '{homeTeam}', 'EMN': 'Hòa', 'EMC': '{awayTeam}'},
    'text2': {
      'EMH': '{homeTeam} Chiến thắng',
      'EMN': 'Hòa',
      'EMC': '{awayTeam} Chiến thắng'
    },
    'sort': ['ERMH', 'ERMN', 'ERMC']
  },
  'FRM': {
    'col': 3,
    'text': {'FMH': '{homeTeam}', 'FMN': 'Hòa', 'FMC': '{awayTeam}'},
    'text2': {
      'FMH': '{homeTeam} Chiến thắng',
      'FMN': 'Hòa',
      'FMC': '{awayTeam} Chiến thắng'
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
    'text': {'AOUO': 'Tài {ratio}', 'AOUU': 'Xỉu {ratio}'},
    'text2': {'AOUO': 'Tài {ratio} bóng', 'AOUU': 'Xỉu {ratio} bóng'},
    'sort': ['AOUO', 'AOUU']
  },
  'BOU': {
    'col': 2,
    'text': {'BOUO': 'Tài {ratio}', 'BOUU': 'Xỉu {ratio}'},
    'text2': {'BOUO': 'Tài {ratio} bóng', 'BOUU': 'Xỉu {ratio} bóng'},
    'sort': ['BOUO', 'BOUU']
  },
  'COU': {
    'col': 2,
    'text': {'COUO': 'Tài {ratio}', 'COUU': 'Xỉu {ratio}'},
    'text2': {'COUO': 'Tài {ratio} bóng', 'COUU': 'Xỉu {ratio} bóng'},
    'sort': ['COUO', 'COUU']
  },
  'DOU': {
    'col': 2,
    'text': {'DOUO': 'Tài {ratio}', 'DOUU': 'Xỉu {ratio}'},
    'text2': {'DOUO': 'Tài {ratio} bóng', 'DOUU': 'Xỉu {ratio} bóng'},
    'sort': ['DOUO', 'DOUU']
  },
  'EOU': {
    'col': 2,
    'text': {'EOUO': 'Tài {ratio}', 'EOUU': 'Xỉu {ratio}'},
    'text2': {'EOUO': 'Tài {ratio} bóng', 'EOUU': 'Xỉu {ratio} bóng'},
    'sort': ['EOUO', 'EOUU']
  },
  'FOU': {
    'col': 2,
    'text': {'FOUO': 'Tài {ratio}', 'FOUU': 'Xỉu {ratio}'},
    'text2': {'FOUO': 'Tài {ratio} bóng', 'FOUU': 'Xỉu {ratio} bóng'},
    'sort': ['FOUO', 'FOUU']
  },
  'AROU': {
    'col': 2,
    'iorType': true,
    'text': {'AROUO': 'Tài {ratio}', 'AROUU': 'Xỉu {ratio}'},
    'text2': {'AROUO': 'Tài {ratio} bóng', 'AROUU': 'Xỉu {ratio} bóng'},
    'sort': ['AROUO', 'AROUU']
  },
  'BROU': {
    'col': 2,
    'text': {'BROUO': 'Tài {ratio}', 'BROUU': 'Xỉu {ratio}'},
    'text2': {'BROUO': 'Tài {ratio} bóng', 'BROUU': 'Xỉu {ratio} bóng'},
    'sort': ['BROUO', 'BROUU']
  },
  'CROU': {
    'col': 2,
    'text': {'CROUO': 'Tài {ratio}', 'CROUU': 'Xỉu {ratio}'},
    'text2': {'CROUO': 'Tài {ratio} bóng', 'CROUU': 'Xỉu {ratio} bóng'},
    'sort': ['CROUO', 'CROUU']
  },
  'DROU': {
    'col': 2,
    'text': {'DROUO': 'Tài {ratio}', 'DROUU': 'Xỉu {ratio}'},
    'text2': {'DROUO': 'Tài {ratio} bóng', 'DROUU': 'Xỉu {ratio} bóng'},
    'sort': ['DROUO', 'DROUU']
  },
  'EROU': {
    'col': 2,
    'text': {'EROUO': 'Tài {ratio}', 'EROUU': 'Xỉu {ratio}'},
    'text2': {'EROUO': 'Tài {ratio} bóng', 'EROUU': 'Xỉu {ratio} bóng'},
    'sort': ['EROUO', 'EROUU']
  },
  'FROU': {
    'col': 2,
    'text': {'FROUO': 'Tài {ratio}', 'FROUU': 'Xỉu {ratio}'},
    'text2': {'FROUO': 'Tài {ratio} bóng', 'FROUU': 'Xỉu {ratio} bóng'},
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
      'DCHN': 'Chủ nhà/Hòa',
      'DCCN': 'Đội khách/Hòa',
      'DCHC': 'Chủ nhà/Đội khách'
    },
    'sort': ['DCHN', 'DCCN', 'DCHC']
  },
  'F2G': {
    'col': 3,
    'text': {
      'F2GH': '{homeTeam}',
      'F2GC': '{awayTeam}',
      'F2GN': 'Hai đội đều không'
    },
    'text2': {
      'F2GH': '{homeTeam}',
      'F2GC': '{awayTeam}',
      'F2GN': 'đều không vào 2 bóng'
    },
    'sort': ['F2GH', 'F2GC', 'F2GN']
  },
  'F3G': {
    'col': 3,
    'text': {
      'F3GH': '{homeTeam}',
      'F3GC': '{awayTeam}',
      'F3GN': 'Hai đội đều không'
    },
    'text2': {
      'F3GH': '{homeTeam}',
      'F3GC': '{awayTeam}',
      'F3GN': 'đều không vào 2 bóng'
    },
    'sort': ['F3GH', 'F3GC', 'F3GN']
  },
  'FG': {
    'col': 3,
    'text': {
      'FGS': 'Cú đá bình thường vào khung thành',
      'FGH': 'Đánh đầu',
      'FGP': 'Phạt đền',
      'FGF': 'Đá phạt',
      'FGO': 'Đá phản lưới nhà',
      'FGN': 'Không có bàn thắng'
    },
    'text2': {
      'FGS': 'Cú đá bình thường vào khung thành',
      'FGH': 'Đánh đầu',
      'FGP': 'Phạt đền',
      'FGF': 'Đá phạt',
      'FGO': 'Đá phản lưới nhà',
      'FGN': 'Không có bàn thắng'
    },
    'sort': ['FGS', 'FGH', 'FGN', 'FGP', 'FGF', 'FGO']
  },
  'HG': {
    'col': 2,
    'text': {'HGH': 'Hiệp 1 ', 'HGC': 'Hiệp 2'},
    'sort': ['HGH', 'HGC']
  },
  'HOUC': {
    'half': true,
    'col': 2,
    'text': {'HOUCO': 'Tài {ratio}', 'HOUCU': 'Xỉu {ratio}'},
    'text2': {'HOUCO': 'Tài {ratio} bóng', 'HOUCU': 'Xỉu {ratio} bóng'},
    'sort': ['HOUCO', 'HOUCU']
  },
  'HOUH': {
    'half': true,
    'col': 2,
    'text': {'HOUHO': 'Tài {ratio}', 'HOUHU': 'Xỉu {ratio}'},
    'text2': {'HOUHO': 'Tài {ratio} bóng', 'HOUHU': 'Xỉu {ratio} bóng'},
    'sort': ['HOUHO', 'HOUHU']
  },
  'HT': {
    'half': true,
    'col': 2,
    'text': {'HT0': '0', 'HT1': '1', 'HT2': '2', 'HTOV': '3+'},
    'text2': {
      'HT0': 'Không vào',
      'HT1': 'Vào 1 bóng',
      'HT2': 'Vào 2 bóng',
      'HTOV': 'Vào 3 bóng trở lên'
    },
    'sort': ['HT0', 'HT1', 'HT2', 'HTOV']
  },
  'MG': {
    'col': 3,
    'text': {'MGH': 'Hiệp 1 ', 'MGN': 'Không có bàn thắng', 'MGC': 'Hiệp 2'},
    'sort': ['MGH', 'MGC', 'MGN']
  },
  'OUC': {
    'col': 2,
    'text': {'OUCO': 'Tài {ratio}', 'OUCU': 'Xỉu {ratio}'},
    'text2': {'OUCO': 'Tài {ratio} bóng', 'OUCU': 'Xỉu {ratio} bóng'},
    'sort': ['OUCO', 'OUCU']
  },
  'OUH': {
    'col': 2,
    'text': {'OUHO': 'Tài {ratio}', 'OUHU': 'Xỉu {ratio}'},
    'text2': {'OUHO': 'Tài {ratio} bóng', 'OUHU': 'Xỉu {ratio} bóng'},
    'sort': ['OUHO', 'OUHU']
  },
  'PA': {
    'col': 2,
    'text': {'PAH': 'Có', 'PAC': 'Không'},
    'sort': ['PAH', 'PAC']
  },
  'RCD': {
    'col': 2,
    'text': {'RCDH': 'Có', 'RCDC': 'Không'},
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
      'T01': '0~1 bóng',
      'T23': '2~3 bóng',
      'T46': '4~6 bóng',
      'OVER': '7 bóng trở lên',
      'T01P': '0~1 bóng',
      'T23P': '2~3 bóng',
      'T46P': '4~5 bóng',
      'OVERP': '6 bóng trở lên'
    },
    'sort': ['T01', 'T23', 'T46', 'OVER', 'T01P', 'T23P', 'T46P', 'OVERP']
  },
  'T3G': {
    'col': 3,
    'text': {
      'T3G1': '26 phút hoặc trước hiệp một',
      'T3G2': '27 phút hoặc muộn hơn trong hiệp một',
      'T3GN': 'Không ghi bàn'
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
    'text': {'TSY': 'Có', 'TSN': 'Không'},
    'sort': ['TSY', 'TSN']
  },
  'W3': {
    'col': 3,
    'text': {
      'W3H': '{homeTeam} {ratio}',
      'W3N': 'Hòa {ratio}',
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
      'WMH1': 'Chủ nhà-Thắng cách biệt 1 bàn',
      'WMH2': 'Chủ nhà-Thắng cách biệt 2 bàn',
      'WMH3': 'Chủ nhà-Thắng cách biệt 3 bàn',
      'WMHOV': 'Chủ nhà-Thắng cách biệt 1 bàn trở lên',
      'WMC1': 'Đội khách-Thắng cách biệt 1 bàn',
      'WMC2': 'Đội khách-Thắng cách biệt 2 bàn',
      'WMC3': 'Đội khách-Thắng cách biệt 3 bàn',
      'WMCOV': 'Đội khách-Thắng cách biệt 1 bàn trở lên',
      'WMN': 'Bàn thắng và hòa',
      'WM0': 'Không có bàn thắng',
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
    'text': {
      'ARGC': '{awayTeam}',
      'ARGN': 'Không ghi bàn',
      'ARGH': '{homeTeam}'
    },
    'sort': ['ARGH', 'ARGC', 'ARGN']
  },
  'BRG': {
    'col': 3,
    'text': {
      'BRGN': 'Không ghi bàn',
      'BRGH': '{homeTeam}',
      'BRGC': '{awayTeam}'
    },
    'sort': ['BRGN', 'BRGH', 'BRGC']
  },
  'CD': {
    'col': 2,
    'text': {
      'CDFH': 'Thẻ phạt đầu tiên - {homeTeam}',
      'CDFC': 'Thẻ phạt đầu tiên - {awayTeam}',
      'CDLH': 'Thẻ phạt cuối cùng - {homeTeam}',
      'CDLC': 'Thẻ phạt cuối cùng - {awayTeam}',
      'CDLN': 'Không có thẻ phạt',
      'CDFN': 'Không có thẻ phạt'
    },
    'sort': ['CDFH', 'CDFC', 'CDLH', 'CDLC', 'CDLN', 'CDFN']
  },
  'CN': {
    'col': 3,
    'text': {
      'CNLC': 'Quả cuối cùng - {awayTeam}',
      'CNLH': 'Quả cuối cùng - {homeTeam}',
      'CNFN': 'Không có phạt góc',
      'CNLN': 'Không có phạt góc',
      'CNFH': 'Quả đầu tiên - {homeTeam}',
      'CNFC': 'Quả đầu tiên - {awayTeam}'
    },
    'sort': ['CNFH', 'CNFC', 'CNFN', 'CNLH', 'CNLC', 'CNLN']
  },
  'CRG': {
    'col': 3,
    'text': {
      'CRGC': '{awayTeam}',
      'CRGN': 'Không ghi bàn',
      'CRGH': '{homeTeam}'
    },
    'sort': ['CRGH', 'CRGC', 'CRGN']
  },
  'DRG': {
    'col': 3,
    'text': {
      'DRGN': 'Không ghi bàn',
      'DRGC': '{awayTeam}',
      'DRGH': '{homeTeam}'
    },
    'sort': ['DRGH', 'DRGC', 'DRGN']
  },
  'ERG': {
    'col': 3,
    'text': {
      'ERGH': '{homeTeam}',
      'ERGC': '{awayTeam}',
      'ERGN': 'Không ghi bàn'
    },
    'sort': ['ERGH', 'ERGC', 'ERGN']
  },
  'FRG': {
    'col': 3,
    'text': {
      'FRGN': 'Không ghi bàn',
      'FRGC': '{awayTeam}',
      'FRGH': '{homeTeam}'
    },
    'sort': ['FRGH', 'FRGC', 'FRGN']
  },
  'GA': {
    'col': 2,
    'text': {
      'GAFC': 'Quả phát bóng đầu tiên - {awayTeam}',
      'GAFH': 'Quả phát bóng đầu tiên - {homeTeam}',
      'GALC': 'Quả phát bóng cuối cùng - {awayTeam}',
      'GALH': 'Quả phát bóng cuối cùng - {homeTeam}'
    },
    'sort': ['GAFH', 'GAFC', 'GALH', 'GALC']
  },
  'GRG': {
    'col': 3,
    'text': {
      'GRGH': '{homeTeam}',
      'GRGN': 'Không ghi bàn',
      'GRGC': '{awayTeam}'
    },
    'sort': ['GRGH', 'GRGC', 'GRGN']
  },
  'HPD': {'half': true, 'col': 2, 'text': {}, 'sort': []},
  'HRG': {
    'col': 3,
    'text': {
      'HRGN': 'Không ghi bàn',
      'HRGC': '{awayTeam}',
      'HRGH': '{homeTeam}'
    },
    'sort': ['HRGH', 'HRGC', 'HRGN']
  },
  'HRPD': {'half': true, 'col': 2, 'text': {}, 'sort': []},
  'HRT': {
    'half': true,
    'col': 2,
    'text': {'HRT1': '1', 'HRT0': '0', 'HRTOV': '3+', 'HRT2': '2'},
    'text2': {
      'HRT1': 'Vào 1 bàn',
      'HRT0': 'Không ghi bàn',
      'HRT2': 'Vào 2 bàn',
      'HRTOV': 'Vào 3 bàn trở lên'
    },
    'sort': ['HRT0', 'HRT1', 'HRT2', 'HRTOV']
  },
  'HRUC': {
    'half': true,
    'col': 2,
    'text': {'HRUCU': 'Nhỏ hơn {ratio}', 'HRUCO': 'Lớn hơn {ratio}'},
    'text2': {'HRUCO': 'Lớn hơn {ratio} bóng', 'HRUCU': 'Nhỏ hơn {ratio} bóng'},
    'sort': ['HRUCO', 'HRUCU']
  },
  'HRUH': {
    'half': true,
    'col': 2,
    'text': {'HRUHO': 'Lớn hơn {ratio}', 'HRUHU': 'Nhỏ hơn {ratio}'},
    'text2': {'HRUHO': 'Lớn hơn {ratio} bóng', 'HRUHU': 'Nhỏ hơn {ratio} bóng'},
    'sort': ['HRUHO', 'HRUHU']
  },
  'IRG': {
    'col': 3,
    'text': {
      'IRGH': '{homeTeam}',
      'IRGN': 'Không ghi bàn',
      'IRGC': '{awayTeam}'
    },
    'sort': ['IRGH', 'IRGC', 'IRGN']
  },
  'JRG': {
    'col': 3,
    'text': {
      'JRGH': '{homeTeam}',
      'JRGN': 'Không ghi bàn',
      'JRGC': '{awayTeam}'
    },
    'sort': ['JRGH', 'JRGC', 'JRGN']
  },
  'OS': {
    'col': 2,
    'text': {
      'OSLH': 'Việt vị cuối cùng- {homeTeam}',
      'OSFN': 'Việt vị đầu tiên  - Không',
      'OSFC': 'Việt vị đầu tiên - {awayTeam}',
      'OSLC': 'Việt vị cuối cùng - {awayTeam}',
      'OSFH': 'Việt vị đầu tiên - {homeTeam} '
    },
    'sort': ['OSLH', 'OSFN', 'OSFC', 'OSLC', 'OSFH']
  },
  'PD': {'col': 2, 'text': {}, 'sort': []},
  'PG': {
    'col': 2,
    'text': {
      'PGLC': 'Bàn thắng sau cùng - {awayTeam}',
      'PGFH': 'Bàn thắng đầu tiên - {homeTeam}',
      'PGFN': 'Bàn thắng đầu tiên - Không',
      'PGFC': 'Bàn thắng đầu tiên - {awayTeam}',
      'PGLH': 'Bàn thắng sau cùng - {homeTeam}'
    },
    'sort': ['PGLC', 'PGFH', 'PGFN', 'PGFC', 'PGLH']
  },
  'RC': {
    'col': 2,
    'text': {
      'RCFH': 'Quả Đá phạt đầu tiên - {homeTeam} ',
      'RCLH': 'Quả Đá phạt cuối cùng - {homeTeam} ',
      'RCFC': 'Quả Đá phạt đầu tiên - {awayTeam} ',
      'RCLC': 'Quả Đá phạt cuối cùng - {awayTeam} '
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
      'RDCHN': 'Chủ nhà/Hòa',
      'RDCHC': 'Chủ nhà/Đội khách',
      'RDCCN': 'Đội khách/Hòa'
    },
    'sort': ['RDCHN', 'RDCHC', 'RDCCN']
  },
  'RHG': {
    'col': 2,
    'text': {'RHGH': 'Hiệp 1 ', 'RHGC': 'Hiệp 2'},
    'sort': ['RHGH', 'RHGC']
  },
  'RMG': {
    'col': 3,
    'text': {'RMGN': 'Không có bàn thắng', 'RMGC': 'Hiệp 2', 'RMGH': 'Hiệp 1 '},
    'sort': ['RMGH', 'RMGC', 'RMGN']
  },
  'ROUC': {
    'col': 2,
    'text': {'ROUCU': 'Xỉu {ratio}', 'ROUCO': 'Tài {ratio}'},
    'text2': {'ROUCO': 'Tài {ratio} bóng', 'ROUCU': 'Xỉu {ratio} bóng'},
    'sort': ['ROUCO', 'ROUCU']
  },
  'ROUH': {
    'col': 2,
    'text': {'ROUHU': 'Xỉu {ratio}', 'ROUHO': 'Tài {ratio}'},
    'text2': {'ROUHO': 'Tài {ratio} bóng', 'ROUHU': 'Xỉu {ratio} bóng'},
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
      'RT01P': '0-1 bóng',
      'RT23P': '2-3 bóng',
      'RT46P': '4-5 bóng',
      'ROVERP': '6+ bóng',
      'RT46': '4~6 bóng',
      'RT01': '0~1 bóng',
      'RT23': '2~3 bóng',
      'ROVER': '7+ bóng',
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
      'RT1G3': 'Hiệp 1 30：00 - Kết thúc hiệp 1',
      'RT1G2': 'Hiệp 1 15：00 - 29：59',
      'RT1G1': 'Trận đấu bắt đầu - 14:59',
      'RT1G6': 'Hiệp 2 75：00 - Hết trận',
      'RT1G5': 'Hiệp 2 60：00 - 74：59',
      'RT1G4': 'Hiệp 2 bắt đầu - 59：59',
      'RT1GN': 'Không ghi bàn'
    },
    'sort': ['RT1G1', 'RT1G2', 'RT1G3', 'RT1G4', 'RT1G5', 'RT1G6', 'RT1GN']
  },
  'RT3G': {
    'col': 3,
    'text': {
      'RT3G1': '26 phút hoặc trước hiệp một',
      'RT3G2': '27 phút hoặc muộn hơn trong hiệp một',
      'RT3GN': 'Không ghi bàn'
    },
    'sort': ['RT3G1', 'RT3G2', 'RT3GN']
  },
  'RTS': {
    'col': 2,
    'text': {'RTSY': 'Có', 'RTSN': 'Không'},
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
      'RWMH1': 'Chủ nhà-thắng cách biệt 1 bàn',
      'RWMH2': 'Chủ nhà-thắng cách biệt 2 bàn',
      'RWMH3': 'Chủ nhà-thắng cách biệt 3 bàn',
      'RWMHOV': 'Chủ nhà-thắng cách biệt 4 bàn trở lên',
      'RWMC1': 'Đội khách-thắng cách biệt 1 bàn',
      'RWMC2': 'Đội khách-thắng cách biệt 2 bàn',
      'RWMC3': 'Đội khách-thắng cách biệt 3 bàn',
      'RWMCOV': 'Đội khách-thắng cách biệt 4 bàn trở lên',
      'RWMN': 'Bàn thắng và hòa',
      'RWM0': 'Không có bàn thắng',
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
      'STLC': 'Thay Cầu thủ dự bị cuối cùng - {awayTeam}',
      'STFC': 'Thay Cầu thủ dự bị đầu tiên - {awayTeam}',
      'STLH': 'Thay Cầu thủ dự bị cuối cùng - {homeTeam}',
      'STFN': 'Thay Cầu thủ dự bị đầu tiên - không',
      'STFH': 'Thay Cầu thủ dự bị đầu tiên - {homeTeam}'
    },
    'sort': ['STLC', 'STFC', 'STLH', 'STFN', 'STFH']
  },
  'YC': {
    'col': 2,
    'text': {
      'YCFH': 'Quả ném biên đầu tiên - {homeTeam}',
      'YCFC': 'Quả ném biên đầu tiên - {awayTeam}',
      'YCLH': 'Quả ném biên sau cùng - {homeTeam}',
      'YCLC': 'Quả ném biên sau cùng - {awayTeam} '
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
    'text': {'KOUC': 'Tài {ratio}', 'KOUH': 'Xỉu {ratio}'},
    'sort': ['KOUC', 'KOUH']
  },
  'KEO': {
    'col': 2,
    'text': {'KEOO': 'Lẻ', 'KEOE': 'Chẵn'},
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
    'text': {'R5Y': 'Có', 'R5N': 'Không'},
    'sort': ['R5Y', 'R5N']
  },
  'CT': {
    'col': 2,
    'text': {'CT33': '33:00 hoặc dưới', 'CT34': '33:01 hoặc trên'},
    'sort': ['CT33', 'CT34']
  },
  'K10': {
    'col': 2,
    'text': {'K10H': '{homeTeam}', 'K10C': '{awayTeam}'},
    'sort': ['K10H', 'K10C']
  },
  'R10': {
    'col': 2,
    'text': {'R10Y': 'Có', 'R10N': 'Không'},
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
    'text': {'MOU_TK12': 'Tài {ratio}', 'MOU_TK13': 'Xỉu {ratio}'},
    'sort': ['MOU_TK12', 'MOU_TK13']
  },
  'MOU_TKFT': {
    'col': 2,
    'text': {'MOU_TKFT4': 'Tài {ratio}', 'MOU_TKFT5': 'Xỉu {ratio}'},
    'sort': ['MOU_TKFT4', 'MOU_TKFT5']
  },
  'MR_MS': {
    'col': 2,
    'text': {'MR_MSH': '{homeTeam}', 'MR_MSA': '{awayTeam}'},
    'sort': ['MR_MSH', 'MR_MSA']
  },
  'MOU_KH': {
    'col': 2,
    'text': {'MOU_TK12': 'Tài {ratio}', 'MOU_TK13': 'Xỉu {ratio}'},
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
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
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
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
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
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
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
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "RG": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OUG": {
    "col": 2,
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
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
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
    "sort": ["OUC", "OUH"]
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
    "text": {"OUC": "Tài {ratio}", "OUH": "Xỉu {ratio}"},
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
      'RFHH': 'Chủ/Chủ',
      'RFHN': 'Chủ/Hòa',
      'RFHC': 'Chủ/Khách',
      'RFNH': 'Hòa/Chủ',
      'RFNN': 'Hòa/Hòa',
      'RFNC': 'Hòa/Khách',
      'RFCH': 'Khách/Chủ',
      'RFCN': 'Khách/Hòa',
      'RFCC': 'Khách/Khách'
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
    'text': {'HROUCU': 'Xỉu {ratio}', 'HROUCO': 'Tài {ratio}'},
    "text2": {"HROUCO": 'Tài {ratio} bóng', "HROUCU": 'Xỉu {ratio} bóng'},
    'sort': ['HROUCO', 'HROUCU']
  },
  "HROUH": {
    'col': 2,
    'text': {'HROUHU': 'Xỉu {ratio}', 'HROUHO': 'Tài {ratio}'},
    "text2": {"HROUHO": 'Tài {ratio} bóng', "HROUHU": 'Xỉu {ratio} bóng'},
    'sort': ['HROUHO', 'HROUHU']
  },
  "TEOC": {
    "col": 2,
    "col188": 1,
    "text": {"TEOCO": "Lẻ ", "TEOCE": "Chẵn"},
    "sort": ["TEOCO", "TEOCE"]
  },
  "TEOH": {
    "col": 2,
    "col188": 1,
    "text": {"TEOHO": "Lẻ ", "TEOHE": "Chẵn"},
    "sort": ["TEOHO", "TEOHE"]
  },
  "HTEOC": {
    "col": 2,
    "col188": 1,
    "text": {"HTEOCO": "Lẻ ", "HTEOCE": "Chẵn"},
    "sort": ["HTEOCO", "HTEOCE"]
  },
  "HTEOH": {
    "col": 2,
    "col188": 1,
    "text": {"HTEOHO": "Lẻ ", "HTEOHE": "Chẵn"},
    "sort": ["HTEOHO", "HTEOHE"]
  },
  "HTEOC2": {
    "col": 2,
    "col188": 1,
    "text": {"HTEOC2O": "Lẻ ", "HTEOC2E": "Chẵn"},
    "sort": ["HTEOC2O", "HTEOC2E"]
  },
  "HTEOH2": {
    "col": 2,
    "col188": 1,
    "text": {"HTEOH2O": "Lẻ ", "HTEOH2E": "Chẵn"},
    "sort": ["HTEOH2O", "HTEOH2E"]
  },
  "REOC": {
    "col": 2,
    "col188": 1,
    "text": {"REOCO": "Lẻ ", "REOCE": "Chẵn"},
    "sort": ["REOCO", "REOCE"]
  },
  "REOH": {
    "col": 2,
    "col188": 1,
    "text": {
      "REOHO": "Lẻ ",
      "REOHE": "Chẵn",
    },
    "sort": ["REOHO", "REOHE"]
  },
};
