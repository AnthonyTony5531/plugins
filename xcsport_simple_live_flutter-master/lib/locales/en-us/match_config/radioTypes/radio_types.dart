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
    'text': {'OUC': 'Over {ratio}', 'OUH': 'Under {ratio}'},
    'text2': {'OUC': 'Over {ratio} Goal', 'OUH': 'Under {ratio} Goal'},
    'textAsia': {'OUC': 'Over {ratio}', 'OUH': 'Under {ratio}'},
    'sort': ['OUC', 'OUH']
  },
  'ROU': {
    'col': 2,
    'iorType': true,
    'text': {'ROUC': 'Over {ratio}', 'ROUH': 'Under {ratio}'},
    'text2': {'ROUC': 'Over {ratio} Goal', 'ROUH': 'Under {ratio} Goal'},
    'textAsia': {'ROUC': 'Over {ratio}', 'ROUH': 'Under {ratio}'},
    'sort': ['ROUC', 'ROUH']
  },
  'HOU': {
    'half': true,
    'iorType': true,
    'col': 2,
    'text': {'HOUC': 'Over {ratio}', 'HOUH': 'Under {ratio}'},
    'text2': {'HOUC': 'Over {ratio} Goal', 'HOUH': 'Under {ratio} Goal'},
    'textAsia': {'HOUC': 'Over {ratio}', 'HOUH': 'Under {ratio}'},
    'sort': ['HOUC', 'HOUH']
  },
  'HROU': {
    'half': true,
    'iorType': true,
    'col': 2,
    'text': {'HROUC': 'Over {ratio}', 'HROUH': 'Under {ratio}'},
    'text2': {'HROUC': 'Over {ratio} Goal', 'HROUH': 'Under {ratio} Goal'},
    'textAsia': {'HROUC': 'Over {ratio}', 'HROUH': 'Under {ratio}'},
    'sort': ['HROUC', 'HROUH']
  },
  'M': {
    'col': 3,
    "col188": 1,
    'text': {'MH': '{homeTeam}', 'MN': 'Draw', 'MC': '{awayTeam}'},
    'text2': {'MH': '{homeTeam}Won', 'MN': "Draw", 'MC': '{awayTeam}Won'},
    'textAsia': {'MH': 'Home Team won', 'MN': 'Draw', 'MC': 'Away Team won'},
    'newTextAsia': {'MH': '1', 'MN': 'x', 'MC': '2'},
    'textAsiaXiaobai': {
      'MH': 'Home Team won',
      'MN': 'Draw',
      'MC': 'Away Team won'
    },
    'newTextAsiaXiaobai': {
      'MH': 'Home Team won',
      'MN': 'Draw',
      'MC': 'Away Team won'
    },
    'sort': ['MH', 'MN', 'MC'],
    'sort_asia': ['MH', 'MC', 'MN']
  },
  'RM': {
    'col': 3,
    "col188": 1,
    'text': {'RMH': '{homeTeam}', 'RMN': 'Draw', 'RMC': '{awayTeam}'},
    'text2': {'RMH': '{homeTeam}Won', 'RMN': "Draw", 'RMC': '{awayTeam}Won'},
    'textAsia': {'RMH': 'Home Team won', 'RMN': 'Draw', 'RMC': 'Away Team won'},
    'newTextAsia': {'RMH': '1', 'RMN': 'x', 'RMC': '2'},
    'textAsiaXiaobai': {
      'RMH': 'Home Team won',
      'RMN': 'Draw',
      'RMC': 'Away Team won'
    },
    'newTextAsiaXiaobai': {
      'RMH': 'Home Team won',
      'RMN': 'Draw',
      'RMC': 'Away Team won'
    },
    'sort': ['RMH', 'RMN', 'RMC'],
    'sort_asia': ['RMH', 'RMC', 'RMN']
  },
  'HM': {
    'half': true,
    'col': 3,
    "col188": 1,
    'text': {'HMH': '{homeTeam}', 'HMN': 'Draw', 'HMC': '{awayTeam}'},
    'text2': {'HMH': '{homeTeam}Won', 'HMN': "Draw", 'HMC': '{awayTeam}Won'},
    'textAsia': {'HMH': 'Home Team won', 'HMN': 'Draw', 'HMC': 'Away Team won'},
    'newTextAsia': {'HMH': '1', 'HMN': 'x', 'HMC': '2'},
    'sort': ['HMH', 'HMN', 'HMC'],
    'sort_asia': ['HMH', 'HMC', 'HMN']
  },
  'HRM': {
    'half': true,
    'col': 3,
    "col188": 1,
    'text': {'HRMH': '{homeTeam}', 'HRMN': 'Draw', 'HRMC': '{awayTeam}'},
    'text2': {'HRMH': '{homeTeam}Won', 'HRMN': "Draw", 'HRMC': '{awayTeam}Won'},
    'textAsia': {
      'HRMH': 'Home Team won',
      'HRMN': 'Draw',
      'HRMC': 'Away Team won'
    },
    'newTextAsia': {'HRMH': '1', 'HRMN': 'x', 'HRMC': '2'},
    'sort': ['HRMH', 'HRMN', 'HRMC'],
    'sort_asia': ['HRMH', 'HRMC', 'HRMN']
  },
  'EO': {
    'col': 2,
    'text': {'EOO': 'Odd', 'EOE': 'Even'},
    'text2': {'EOO': 'No', 'EOE': 'Yes（Including no Goal）'},
    'textAsia': {'EOO': 'Odd', 'EOE': 'Even'},
    'sort': ['EOO', 'EOE']
  },
  'REO': {
    'col': 2,
    'text': {'REOO': 'Odd', 'REOE': 'Even'},
    'text2': {'REOO': 'No', 'REOE': 'Yes（Including no Goal）'},
    'textAsia': {'REOO': 'Odd', 'REOE': 'Even'},
    'sort': ['REOO', 'REOE']
  },
  'HEO': {
    'half': true,
    'col': 2,
    'text': {'HEOO': 'Odd', 'HEOE': 'Even'},
    'text2': {'HEOO': 'No', 'HEOE': 'Yes（Including no Goal）'},
    'textAsia': {'HEOO': 'Odd', 'HEOE': 'Even'},
    'sort': ['HEOO', 'HEOE']
  },
  'HREO': {
    'half': true,
    'col': 2,
    'text': {'HREOO': 'Odd', 'HREOE': 'Even'},
    'text2': {'HREOO': 'No', 'HREOE': 'Yes（Including no Goal）'},
    'textAsia': {'HREOO': 'Odd', 'HREOE': 'Even'},
    'sort': ['HREOO', 'HREOE']
  },
  'F': {
    'col': 3,
    "col188": 1,
    'text': {
      'FHH': 'Home/Home',
      'FHN': 'Home/Draw',
      'FHC': 'Home/Away',
      'FNH': 'Draw/Home',
      'FNN': 'Draw/Draw',
      'FNC': 'Draw/Away',
      'FCH': 'Away/Home',
      'FCN': 'Away/Draw',
      'FCC': 'Away/Away'
    },
    'sort': ['FHH', 'FNN', 'FCC', 'FHN', 'FNH', 'FCN', 'FHC', 'FNC', 'FCH']
  },
  'AM': {
    'col': 3,
    "col188": 1,
    'text': {'AMH': '{homeTeam}', 'AMN': 'Draw', 'AMC': '{awayTeam}'},
    'text2': {'AMH': '{homeTeam}Won', 'AMN': "Draw", 'AMC': '{awayTeam}Won'},
    'sort': ['AMH', 'AMN', 'AMC']
  },
  'BM': {
    'col': 3,
    "col188": 1,
    'text': {'BMH': '{homeTeam}', 'BMN': 'Draw', 'BMC': '{awayTeam}'},
    'text2': {'BMH': '{homeTeam}Won', 'BMN': "Draw", 'BMC': '{awayTeam}Won'},
    'sort': ['BMH', 'BMN', 'BMC']
  },
  'CM': {
    'col': 3,
    "col188": 1,
    'text': {'CMH': '{homeTeam}', 'CMN': 'Draw', 'CMC': '{awayTeam}'},
    'text2': {'CMH': '{homeTeam}Won', 'CMN': "Draw", 'CMC': '{awayTeam}Won'},
    'sort': ['CMH', 'CMN', 'CMC']
  },
  'DM': {
    'col': 3,
    "col188": 1,
    'text': {'DMH': '{homeTeam}', 'DMN': 'Draw', 'DMC': '{awayTeam}'},
    'text2': {'DMH': '{homeTeam}Won', 'DMN': "Draw", 'DMC': '{awayTeam}Won'},
    'sort': ['DMH', 'DMN', 'DMC']
  },
  'EM': {
    'col': 3,
    "col188": 1,
    'text': {'EMH': '{homeTeam}', 'EMN': 'Draw', 'EMC': '{awayTeam}'},
    'text2': {'EMH': '{homeTeam}Won', 'EMN': "Draw", 'EMC': '{awayTeam}Won'},
    'sort': ['EMH', 'EMN', 'EMC']
  },
  'FM': {
    'col': 3,
    "col188": 1,
    'text': {'FMH': '{homeTeam}', 'FMN': 'Draw', 'FMC': '{awayTeam}'},
    'text2': {'FMH': '{homeTeam}Won', 'FMN': "Draw", 'FMC': '{awayTeam}Won'},
    'sort': ['FMH', 'FMN', 'FMC']
  },
  'ARM': {
    'col': 3,
    "col188": 1,
    'text': {'AMH': '{homeTeam}', 'AMN': 'Draw', 'AMC': '{awayTeam}'},
    'text2': {'AMH': '{homeTeam}Won', 'AMN': "Draw", 'AMC': '{awayTeam}Won'},
    'sort': ['ARMH', 'ARMN', 'ARMC']
  },
  'BRM': {
    'col': 3,
    "col188": 1,
    'text': {'BMH': '{homeTeam}', 'BMN': 'Draw', 'BMC': '{awayTeam}'},
    'text2': {'BMH': '{homeTeam}Won', 'BMN': "Draw", 'BMC': '{awayTeam}Won'},
    'sort': ['BRMH', 'BRMN', 'BRMC']
  },
  'CRM': {
    'col': 3,
    "col188": 1,
    'text': {'CMH': '{homeTeam}', 'CMN': 'Draw', 'CMC': '{awayTeam}'},
    'text2': {'CMH': '{homeTeam}Won', 'CMN': "Draw", 'CMC': '{awayTeam}Won'},
    'sort': ['CRMH', 'CRMN', 'CRMC']
  },
  'DRM': {
    'col': 3,
    "col188": 1,
    'text': {'DMH': '{homeTeam}', 'DMN': 'Draw', 'DMC': '{awayTeam}'},
    'text2': {'DMH': '{homeTeam}Won', 'DMN': "Draw", 'DMC': '{awayTeam}Won'},
    'sort': ['DRMH', 'DRMN', 'DRMC']
  },
  'ERM': {
    'col': 3,
    "col188": 1,
    'text': {'EMH': '{homeTeam}', 'EMN': 'Draw', 'EMC': '{awayTeam}'},
    'text2': {'EMH': '{homeTeam}Won', 'EMN': "Draw", 'EMC': '{awayTeam}Won'},
    'sort': ['ERMH', 'ERMN', 'ERMC']
  },
  'FRM': {
    'col': 3,
    "col188": 1,
    'text': {'FMH': '{homeTeam}', 'FMN': 'Draw', 'FMC': '{awayTeam}'},
    'text2': {'FMH': '{homeTeam}Won', 'FMN': "Draw", 'FMC': '{awayTeam}Won'},
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
    'text': {'AOUO': 'Over {ratio}', 'AOUU': 'Under {ratio}'},
    'text2': {'AOUO': 'Over {ratio} Goal', 'AOUU': 'Under {ratio} Goal'},
    'sort': ['AOUO', 'AOUU']
  },
  'BOU': {
    'col': 2,
    'text': {'BOUO': 'Over {ratio}', 'BOUU': 'Under {ratio}'},
    'text2': {'BOUO': 'Over {ratio} Goal', 'BOUU': 'Under {ratio} Goal'},
    'sort': ['BOUO', 'BOUU']
  },
  'COU': {
    'col': 2,
    'text': {'COUO': 'Over {ratio}', 'COUU': 'Under {ratio}'},
    'text2': {'COUO': 'Over {ratio} Goal', 'COUU': 'Under {ratio} Goal'},
    'sort': ['COUO', 'COUU']
  },
  'DOU': {
    'col': 2,
    'text': {'DOUO': 'Over {ratio}', 'DOUU': 'Under {ratio}'},
    'text2': {'DOUO': 'Over {ratio} Goal', 'DOUU': 'Under {ratio} Goal'},
    'sort': ['DOUO', 'DOUU']
  },
  'EOU': {
    'col': 2,
    'text': {'EOUO': 'Over {ratio}', 'EOUU': 'Under {ratio}'},
    'text2': {'EOUO': 'Over {ratio} Goal', 'EOUU': 'Under {ratio} Goal'},
    'sort': ['EOUO', 'EOUU']
  },
  'FOU': {
    'col': 2,
    'text': {'FOUO': 'Over {ratio}', 'FOUU': 'Under {ratio}'},
    'text2': {'FOUO': 'Over {ratio} Goal', 'FOUU': 'Under {ratio} Goal'},
    'sort': ['FOUO', 'FOUU']
  },
  'AROU': {
    'col': 2,
    'iorType': true,
    'text': {'AROUO': 'Over {ratio}', 'AROUU': 'Under {ratio}'},
    'text2': {'AROUO': 'Over {ratio} Goal', 'AROUU': 'Under {ratio} Goal'},
    'sort': ['AROUO', 'AROUU']
  },
  'BROU': {
    'col': 2,
    'text': {'BROUO': 'Over {ratio}', 'BROUU': 'Under {ratio}'},
    'text2': {'BROUO': 'Over {ratio} Goal', 'BROUU': 'Under {ratio} Goal'},
    'sort': ['BROUO', 'BROUU']
  },
  'CROU': {
    'col': 2,
    'text': {'CROUO': 'Over {ratio}', 'CROUU': 'Under {ratio}'},
    'text2': {'CROUO': 'Over {ratio} Goal', 'CROUU': 'Under {ratio} Goal'},
    'sort': ['CROUO', 'CROUU']
  },
  'DROU': {
    'col': 2,
    'text': {'DROUO': 'Over {ratio}', 'DROUU': 'Under {ratio}'},
    'text2': {'DROUO': 'Over {ratio} Goal', 'DROUU': 'Under {ratio} Goal'},
    'sort': ['DROUO', 'DROUU']
  },
  'EROU': {
    'col': 2,
    'text': {'EROUO': 'Over {ratio}', 'EROUU': 'Under {ratio}'},
    'text2': {'EROUO': 'Over {ratio} Goal', 'EROUU': 'Under {ratio} Goal'},
    'sort': ['EROUO', 'EROUU']
  },
  'FROU': {
    'col': 2,
    'text': {'FROUO': 'Over {ratio}', 'FROUU': 'Under {ratio}'},
    'text2': {'FROUO': 'Over {ratio} Goal', 'FROUU': 'Under {ratio} Goal'},
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
    'text': {
      'DCHN': 'Home Team/Draw',
      'DCCN': 'Away Team/Draw',
      'DCHC': 'Home Team/Away Team'
    },
    'sort': ['DCHN', 'DCCN', 'DCHC']
  },
  'F2G': {
    'col': 3,
    "col188": 1,
    'text': {
      'F2GH': '{homeTeam}',
      'F2GC': '{awayTeam}',
      'F2GN': 'Neither for both team'
    },
    'text2': {
      'F2GH': '{homeTeam}',
      'F2GC': '{awayTeam}',
      'F2GN': 'Neither made 2 goals'
    },
    'sort': ['F2GH', 'F2GC', 'F2GN']
  },
  'F3G': {
    'col': 3,
    "col188": 1,
    'text': {
      'F3GH': '{homeTeam}',
      'F3GC': '{awayTeam}',
      'F3GN': 'Neither for both team'
    },
    'text2': {
      'F3GH': '{homeTeam}',
      'F3GC': '{awayTeam}',
      'F3GN': 'Neither made 3 goals'
    },
    'sort': ['F3GH', 'F3GC', 'F3GN']
  },
  'FG': {
    'col': 3,
    "col188": 1,
    'text': {
      'FGS': 'Shoot by leg',
      'FGH': 'Header',
      'FGP': 'Penalty Kick',
      'FGF': 'Free Kick',
      'FGO': 'Own Goal',
      'FGN': 'No Goal'
    },
    'text2': {
      'FGS': 'Shoot by leg',
      'FGH': 'Header',
      'FGP': 'Penalty Kick',
      'FGF': 'Free Kick',
      'FGO': 'Own Goal',
      'FGN': 'No Goal'
    },
    'sort': ['FGS', 'FGH', 'FGN', 'FGP', 'FGF', 'FGO']
  },
  'HG': {
    'col': 2,
    "col188": 1,
    'text': {'HGH': 'First Half', 'HGC': 'Second Half'},
    'sort': ['HGH', 'HGC']
  },
  'HOUC': {
    'half': true,
    'col': 2,
    'text': {'HOUCO': 'Over {ratio}', 'HOUCU': 'Under {ratio}'},
    'text2': {'HOUCO': 'Over {ratio} Goal', 'HOUCU': 'Under {ratio} Goal'},
    'sort': ['HOUCO', 'HOUCU']
  },
  'HOUH': {
    'half': true,
    'col': 2,
    'text': {'HOUHO': 'Over {ratio}', 'HOUHU': 'Under {ratio}'},
    'text2': {'HOUHO': 'Over {ratio} Goal', 'HOUHU': 'Under {ratio} Goal'},
    'sort': ['HOUHO', 'HOUHU']
  },
  'HT': {
    'half': true,
    'col': 2,
    "col188": 1,
    'text': {'HT0': '0', 'HT1': '1', 'HT2': '2', 'HTOV': '3+'},
    'text2': {
      'HT0': 'No Goal',
      'HT1': 'Made 1 Goal',
      'HT2': 'Made 2 Goals',
      'HTOV': 'Made 3+ Goals'
    },
    'sort': ['HT0', 'HT1', 'HT2', 'HTOV']
  },
  'MG': {
    'col': 3,
    "col188": 1,
    'text': {'MGH': 'First Half', 'MGN': 'No Goal', 'MGC': 'Second Half'},
    'sort': ['MGH', 'MGC', 'MGN']
  },
  'OUC': {
    'col': 2,
    'text': {'OUCO': 'Over {ratio}', 'OUCU': 'Under {ratio}'},
    'text2': {'OUCO': 'Over {ratio} Goal', 'OUCU': 'Under {ratio} Goal'},
    'sort': ['OUCO', 'OUCU']
  },
  'OUH': {
    'col': 2,
    'text': {'OUHO': 'Over {ratio}', 'OUHU': 'Under {ratio}'},
    'text2': {'OUHO': 'Over {ratio} Goal', 'OUHU': 'Under {ratio} Goal'},
    'sort': ['OUHO', 'OUHU']
  },
  'PA': {
    'col': 2,
    'text': {'PAH': 'Yes', 'PAC': 'No'},
    'sort': ['PAH', 'PAC']
  },
  'RCD': {
    'col': 2,
    'text': {'RCDH': 'Yes', 'RCDC': 'No'},
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
      'T01': '0~1 Goal',
      'T23': '2~3 Goals',
      'T46': '4~6 Goals',
      'OVER': '7+ Goals',
      'T01P': '0~1 Goal',
      'T23P': '2~3 Goals',
      'T46P': '4~5 Goals',
      'OVERP': '6+ Goals'
    },
    'sort': ['T01', 'T23', 'T46', 'OVER', 'T01P', 'T23P', 'T46P', 'OVERP']
  },
  'T3G': {
    'col': 3,
    "col188": 1,
    'text': {
      'T3G1': 'First Half Before 26 minutes',
      'T3G2': 'First Half After 27 minutes',
      'T3GN': 'No Goal'
    },
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
    'text': {'TSY': 'Yes', 'TSN': 'No'},
    'sort': ['TSY', 'TSN']
  },
  'W3': {
    'col': 3,
    "col188": 1,
    'text': {
      'W3H': '{homeTeam} {ratio}',
      'W3N': 'Draw {ratio}',
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
      'WMH1': 'Home Team-Net winning by 1',
      'WMH2': 'Home Team-Net winning by 2',
      'WMH3': 'Home Team-Net winning by 3',
      'WMHOV': 'Home Team-Net winning by 4+',
      'WMC1': 'Away Team-Net winning by 1',
      'WMC2': 'Away Team-Net winning by 2',
      'WMC3': 'Away Team-Net winning by 3',
      'WMCOV': 'Away Team-Net winning by 4+',
      'WMN': 'Draw with goal',
      'WM0': 'No Goal',
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
    'text': {'ARGC': '{awayTeam}', 'ARGN': 'No Goal', 'ARGH': '{homeTeam}'},
    'sort': ['ARGH', 'ARGC', 'ARGN']
  },
  'BRG': {
    'col': 3,
    "col188": 1,
    'text': {'BRGN': 'No Goal', 'BRGH': '{homeTeam}', 'BRGC': '{awayTeam}'},
    'sort': ['BRGN', 'BRGH', 'BRGC']
  },
  'CD': {
    'col': 2,
    "col188": 1,
    'text': {
      'CDFH': '1st card - {homeTeam}',
      'CDFC': '1st card - {awayTeam}',
      'CDLH': 'Last card - {homeTeam}',
      'CDLC': 'Last card - {awayTeam}',
      'CDLN': 'No card',
      'CDFN': 'No card'
    },
    'sort': ['CDFH', 'CDFC', 'CDLH', 'CDLC', 'CDLN', 'CDFN']
  },
  'CN': {
    'col': 3,
    "col188": 1,
    'text': {
      'CNLC': 'Last corner kick - {awayTeam}',
      'CNLH': 'Last corner kick - {homeTeam}',
      'CNFN': 'No corner kick',
      'CNLN': 'No corner kick',
      'CNFH': '1st corner kick - {homeTeam}',
      'CNFC': '1st corner kick - {awayTeam}'
    },
    'sort': ['CNFH', 'CNFC', 'CNFN', 'CNLH', 'CNLC', 'CNLN']
  },
  'CRG': {
    'col': 3,
    "col188": 1,
    'text': {'CRGC': '{awayTeam}', 'CRGN': 'No Goal', 'CRGH': '{homeTeam}'},
    'sort': ['CRGH', 'CRGC', 'CRGN']
  },
  'DRG': {
    'col': 3,
    "col188": 1,
    'text': {'DRGN': 'No Goal', 'DRGC': '{awayTeam}', 'DRGH': '{homeTeam}'},
    'sort': ['DRGH', 'DRGC', 'DRGN']
  },
  'ERG': {
    'col': 3,
    "col188": 1,
    'text': {'ERGH': '{homeTeam}', 'ERGC': '{awayTeam}', 'ERGN': 'No Goal'},
    'sort': ['ERGH', 'ERGC', 'ERGN']
  },
  'FRG': {
    'col': 3,
    "col188": 1,
    'text': {'FRGN': 'No Goal', 'FRGC': '{awayTeam}', 'FRGH': '{homeTeam}'},
    'sort': ['FRGH', 'FRGC', 'FRGN']
  },
  'GA': {
    'col': 2,
    "col188": 1,
    'text': {
      'GAFC': '1st goal kick - {awayTeam}',
      'GAFH': '1st goal kick - {homeTeam}',
      'GALC': 'Last goal kick - {awayTeam}',
      'GALH': 'Last goal kick - {homeTeam}'
    },
    'sort': ['GAFH', 'GAFC', 'GALH', 'GALC']
  },
  'GRG': {
    'col': 3,
    "col188": 1,
    'text': {'GRGH': '{homeTeam}', 'GRGN': 'No Goal', 'GRGC': '{awayTeam}'},
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
    'text': {'HRGN': 'No Goal', 'HRGC': '{awayTeam}', 'HRGH': '{homeTeam}'},
    'sort': ['HRGH', 'HRGC', 'HRGN']
  },
  'HRPD': {'half': true, 'col': 2, 'text': {}, 'sort': []},
  'HRT': {
    'half': true,
    'col': 2,
    "col188": 1,
    'text': {'HRT1': '1', 'HRT0': '0', 'HRTOV': '3+', 'HRT2': '2'},
    'text2': {
      'HRT1': 'Made 1Goal',
      'HRT0': 'No Goal',
      'HRT2': 'Made 2 Goals',
      'HRTOV': 'Made 3+ Goals'
    },
    'sort': ['HRT0', 'HRT1', 'HRT2', 'HRTOV']
  },
  'HRUC': {
    'half': true,
    'col': 2,
    'text': {'HRUCU': 'Under {ratio}', 'HRUCO': 'Over {ratio}'},
    'text2': {'HRUCO': 'Over {ratio} Goal', 'HRUCU': 'Under {ratio} Goal'},
    'sort': ['HRUCO', 'HRUCU']
  },
  'HRUH': {
    'half': true,
    'col': 2,
    'text': {'HRUHO': 'Over {ratio}', 'HRUHU': 'Under {ratio}'},
    'text2': {'HRUHO': 'Over {ratio} Goal', 'HRUHU': 'Under {ratio} Goal'},
    'sort': ['HRUHO', 'HRUHU']
  },
  'IRG': {
    'col': 3,
    "col188": 1,
    'text': {'IRGH': '{homeTeam}', 'IRGN': 'No Goal', 'IRGC': '{awayTeam}'},
    'sort': ['IRGH', 'IRGC', 'IRGN']
  },
  'JRG': {
    'col': 3,
    "col188": 1,
    'text': {'JRGH': '{homeTeam}', 'JRGN': 'No Goal', 'JRGC': '{awayTeam}'},
    'sort': ['JRGH', 'JRGC', 'JRGN']
  },
  'OS': {
    'col': 2,
    "col188": 1,
    'text': {
      'OSLH': 'Offside last - {homeTeam}',
      'OSFN': 'Offside first - No',
      'OSFC': 'Offside first - {awayTeam}',
      'OSLC': 'Offside last - {awayTeam}',
      'OSFH': 'Offside first - {homeTeam} '
    },
    'sort': ['OSLH', 'OSFN', 'OSFC', 'OSLC', 'OSFH']
  },
  'PD': {'col': 2, 'text': {}, 'sort': []},
  'PG': {
    'col': 2,
    "col188": 1,
    'text': {
      'PGLC': 'Score last - {awayTeam}',
      'PGFH': 'Score first - {homeTeam}',
      'PGFN': 'Score first - No',
      'PGFC': 'Score first - {awayTeam}',
      'PGLH': 'Score last - {homeTeam}'
    },
    'sort': ['PGLC', 'PGFH', 'PGFN', 'PGFC', 'PGLH']
  },
  'RC': {
    'col': 2,
    "col188": 1,
    'text': {
      'RCFH': 'First Free Kick - {homeTeam} ',
      'RCLH': 'Last Free Kick - {homeTeam} ',
      'RCFC': 'First Free Kick - {awayTeam} ',
      'RCLC': 'Last Free Kick - {awayTeam} '
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
    'text': {
      'RDCHN': 'Home Team/Draw',
      'RDCHC': 'Home Team/Away Team',
      'RDCCN': 'Away Team/Draw'
    },
    'sort': ['RDCHN', 'RDCHC', 'RDCCN']
  },
  'RHG': {
    'col': 2,
    "col188": 1,
    'text': {'RHGH': 'First Half', 'RHGC': 'Second Half'},
    'sort': ['RHGH', 'RHGC']
  },
  'RMG': {
    'col': 3,
    "col188": 1,
    'text': {'RMGN': 'Same Goal', 'RMGC': 'Second Half', 'RMGH': 'First Half'},
    'sort': ['RMGH', 'RMGC', 'RMGN']
  },
  'ROUC': {
    'col': 2,
    'text': {'ROUCU': 'Under {ratio}', 'ROUCO': 'Over {ratio}'},
    'text2': {'ROUCO': 'Over {ratio} Goal', 'ROUCU': 'Under {ratio} Goal'},
    'sort': ['ROUCO', 'ROUCU']
  },
  'ROUH': {
    'col': 2,
    'text': {'ROUHU': 'Under {ratio}', 'ROUHO': 'Over {ratio}'},
    'text2': {'ROUHO': 'Over {ratio} Goal', 'ROUHU': 'Under {ratio} Goal'},
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
      'RT01P': '0-1 Goal',
      'RT23P': '2-3 Goals',
      'RT46P': '4-5 Goals',
      'ROVERP': '6+ Goals',
      'RT46': '4~6 Goals',
      'RT01': '0~1 Goal',
      'RT23': '2~3 Goals',
      'ROVER': '7+ Goals',
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
      'RT1G3': 'First Half 30：00 - Half Ended',
      'RT1G2': 'First Half 15：00 - 29：59',
      'RT1G1': '00：00 - 14:59',
      'RT1G6': 'Second Half 75：00 - Full Court Ended',
      'RT1G5': 'Second Half 60：00 - 74：59',
      'RT1G4': 'Second Half 45：00 - 59：59',
      'RT1GN': 'No Goal'
    },
    'sort': ['RT1G1', 'RT1G2', 'RT1G3', 'RT1G4', 'RT1G5', 'RT1G6', 'RT1GN']
  },
  'RT3G': {
    'col': 3,
    "col188": 1,
    'text': {
      'RT3G1': 'First Half Before 26 minutes',
      'RT3G2': 'First Half After 27 minutes',
      'RT3GN': 'No Goal'
    },
    'sort': ['RT3G1', 'RT3G2', 'RT3GN']
  },
  'RTS': {
    'col': 2,
    'text': {'RTSY': 'Yes', 'RTSN': 'No'},
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
      'RWMH1': 'Home Team-Net winning by 1 ',
      'RWMH2': 'Home Team-Net winning by 2 ',
      'RWMH3': 'Home Team-Net winning by 3 ',
      'RWMHOV': 'Home Team-Net winning by 4+',
      'RWMC1': 'Away Team-Net winning by 1 ',
      'RWMC2': 'Away Team-Net winning by 2 ',
      'RWMC3': 'Away Team-Net winning by 3 ',
      'RWMCOV': 'Away Team-Net winning by 4+ ',
      'RWMN': 'Draw with goal',
      'RWM0': 'No Goal',
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
      'STLC': 'Replace the player last - {awayTeam}',
      'STFC': 'Replace the player first - {awayTeam}',
      'STLH': 'Replace the player last - {homeTeam}',
      'STFN': 'Replace the player first - No',
      'STFH': 'Replace the player first - {homeTeam}'
    },
    'sort': ['STLC', 'STFC', 'STLH', 'STFN', 'STFH']
  },
  'YC': {
    'col': 2,
    "col188": 1,
    'text': {
      'YCFH': 'First throw-in - {homeTeam}',
      'YCFC': 'First throw-in - {awayTeam}',
      'YCLH': 'Last throw-in - {homeTeam}',
      'YCLC': 'Last throw-in - {awayTeam} '
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
    'text': {'KOUC': 'Over {ratio}', 'KOUH': 'Under {ratio}'},
    'sort': ['KOUC', 'KOUH']
  },
  'KEO': {
    'col': 2,
    'text': {'KEOO': 'Odd', 'KEOE': 'Even'},
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
    'text': {'R5Y': 'Yes', 'R5N': 'No'},
    'sort': ['R5Y', 'R5N']
  },
  'CT': {
    'col': 2,
    "col188": 1,
    'text': {'CT33': '33:00 or before', 'CT34': '33:01 or after'},
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
    'text': {'R10Y': 'Yes', 'R10N': 'No'},
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
    'text': {'MOU_TK12': 'Over {ratio}', 'MOU_TK13': 'Under {ratio}'},
    'sort': ['MOU_TK12', 'MOU_TK13']
  },
  'MOU_TKFT': {
    'col': 2,
    'text': {'MOU_TKFT4': 'Over {ratio}', 'MOU_TKFT5': 'Under {ratio}'},
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
    'text': {'MOU_TK12': 'Over {ratio}', 'MOU_TK13': 'Under {ratio}'},
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
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
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
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
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
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
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
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
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
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
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
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
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
    "text": {"OUC": "Over {ratio}", "OUH": "Under {ratio}"},
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
      'RFHH': 'Home/Home',
      'RFHN': 'Home/Draw',
      'RFHC': 'Home/Away',
      'RFNH': 'Draw/Home',
      'RFNN': 'Draw/Draw',
      'RFNC': 'Draw/Away',
      'RFCH': 'Away/Home',
      'RFCN': 'Away/Draw',
      'RFCC': 'Away/Away'
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
    'text': {'HROUCU': 'Under {ratio}', 'HROUCO': 'Over {ratio}'},
    "text2": {"HROUCO": 'Over {ratio} Goal', "HROUCU": 'Under {ratio} Goal'},
    'sort': ['HROUCO', 'HROUCU']
  },
  "HROUH": {
    'col': 2,
    'text': {'HROUHU': 'Under {ratio}', 'HROUHO': 'Over {ratio}'},
    "text2": {"HROUHO": 'Over {ratio} Goal', "HROUHU": 'Under {ratio} Goal'},
    'sort': ['HROUHO', 'HROUHU']
  },
  "TEOC": {
    "col": 2,
    "text": {"TEOCO": "Odd", "TEOCE": "Even"},
    "sort": ["TEOCO", "TEOCE"]
  },
  "TEOH": {
    "col": 2,
    "text": {"TEOHO": "Odd", "TEOHE": "Even"},
    "sort": ["TEOHO", "TEOHE"]
  },
  "HTEOC": {
    "col": 2,
    "text": {"HTEOCO": "Odd", "HTEOCE": "Even"},
    "sort": ["HTEOCO", "HTEOCE"]
  },
  "HTEOH": {
    "col": 2,
    "text": {"HTEOHO": "Odd", "HTEOHE": "Even"},
    "sort": ["HTEOHO", "HTEOHE"]
  },
  "HTEOC2": {
    "col": 2,
    "text": {"HTEOC2O": "Odd", "HTEOC2E": "Even"},
    "sort": ["HTEOC2O", "HTEOC2E"]
  },
  "HTEOH2": {
    "col": 2,
    "text": {"HTEOH2O": "Odd", "HTEOH2E": "Even"},
    "sort": ["HTEOH2O", "HTEOH2E"]
  },
  "REOC": {
    "col": 2,
    "text": {"REOCO": "Odd", "REOCE": "Even"},
    "sort": ["REOCO", "REOCE"]
  },
  "REOH": {
    "col": 2,
    "text": {
      "REOHO": "Odd",
      "REOHE": "Even",
    },
    "sort": ["REOHO", "REOHE"]
  },
};
