// 英雄联盟
const dynamic lolRadioTypes = {
  'M': {
    'col': 2,
    "col188": 1,
    'text': {'MH': '{homeTeam}', 'MC': '{awayTeam}'},
    'sort': ['MH', 'MC']
  },
  'MCS': {
    'col': 2,
    "col188": 1,
    'text': {
      'MCS21': '2:0',
      'MCS22': '1:1',
      'MCS23': '0:2',
      'MCS34': '2:0',
      'MCS35': '2:1',
      'MCS36': '1:2',
      'MCS37': '0:2',
      'MCS510': '3:2',
      'MCS511': '2:3',
      'MCS512': '1:3',
      'MCS513': '0:3',
      'MCS58': '3:0',
      'MCS59': '3:1',
      'MCS714': '4:0',
      'MCS715': '4:1',
      'MCS716': '4:2',
      'MCS717': '4:3',
      'MCS718': '3:4',
      'MCS719': '2:4',
      'MCS720': '1:4',
      'MCS721': '0:4'
    },
    'sort': [
      'MCS21',
      'MCS22',
      'MCS23',
      'MCS34',
      'MCS35',
      'MCS36',
      'MCS37',
      'MCS510',
      'MCS511',
      'MCS512',
      'MCS513',
      'MCS58',
      'MCS59',
      'MCS714',
      'MCS715',
      'MCS716',
      'MCS717',
      'MCS718',
      'MCS719',
      'MCS720',
      'MCS721'
    ]
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
  'MR_KH': {
    'col': 2,
    "col188": 1,
    'text': {'MR_KHH': '{homeTeam} {ratio}', 'MR_KHC': '{awayTeam} {ratio}'},
    'sort': ['MR_KHH', 'MR_KHC']
  },
  'MR_MD': {
    'col': 2,
    "col188": 1,
    'text': {'MR_MDH': '{homeTeam}', 'MR_MDA': '{awayTeam}'},
    'sort': ['MR_MDH', 'MR_MDA']
  },
  'MR_MB': {
    'col': 2,
    "col188": 1,
    'text': {'MR_MBH': '{homeTeam}', 'MR_MBA': '{awayTeam}'},
    'sort': ['MR_MBH', 'MR_MBA']
  },
  'MR_MI': {
    'col': 2,
    "col188": 1,
    'text': {'MR_MIH': '{homeTeam}', 'MR_MIA': '{awayTeam}'},
    'sort': ['MR_MIH', 'MR_MIA']
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
  'K5': {
    'col': 2,
    "col188": 1,
    'text': {'K5H': '{homeTeam}', 'K5C': '{awayTeam}'},
    'sort': ['K5H', 'K5C']
  },
  'FB': {
    'col': 2,
    "col188": 1,
    'text': {'FBH': '{homeTeam}', 'FBC': '{awayTeam}'},
    'sort': ['FBH', 'FBC']
  },
  'CT': {
    'col': 2,
    "col188": 1,
    'text': {'CT33': '35:00或以下', 'CT34': '35:01或以上'},
    'sort': ['CT33', 'CT34']
  },

  'M_FW1': {
    'col': 2,
    "col188": 1,
    'text': {'M_FW1H': '{homeTeam}', 'M_FW1C': '{awayTeam}'},
    'sort': ['M_FW1H', 'M_FW1C']
  },
  'M_CT1': {
    'col': 2,
    'text': {'M_CT1O': '大 {ratio}', 'M_CT1U': '小 {ratio}'},
    'sort': ['M_CT1O', 'M_CT1U']
  },
  'M_FB1': {
    'col': 2,
    "col188": 1,
    'text': {'M_FB1H': '{homeTeam}', 'M_FB1C': '{awayTeam}'},
    'sort': ['M_FB1H', 'M_FB1C']
  },
  'M_FFK1': {
    'col': 2,
    'text': {'M_FFK1H': '{homeTeam}', 'M_FFK1C': '{awayTeam}'},
    'sort': ['M_FFK1H', 'M_FFK1C']
  },
  'M_KED1': {
    'col': 2,
    "col188": 1,
    'text': {'M_KED1H': '{homeTeam}', 'M_KED1C': '{awayTeam}'},
    'sort': ['M_KED1H', 'M_KED1C']
  },
  'M_DFDT1': {
    'col': 2,
    "col188": 1,
    'text': {'M_DFDT1H': '{homeTeam}', 'M_DFDT1C': '{awayTeam}'},
    'sort': ['M_DFDT1H', 'M_DFDT1C']
  },
  'M_FKBN1': {
    'col': 2,
    "col188": 1,
    'text': {'M_FKBN1H': '{homeTeam}', 'M_FKBN1C': '{awayTeam}'},
    'sort': ['M_FKBN1H', 'M_FKBN1C']
  },
  'M_FW2': {
    'col': 2,
    "col188": 1,
    'text': {'M_FW2H': '{homeTeam}', 'M_FW2C': '{awayTeam}'},
    'sort': ['M_FW2H', 'M_FW2C']
  },
  'M_CT2': {
    'col': 2,
    'text': {'M_CT2O': '大 {ratio}', 'M_CT2U': '小 {ratio}'},
    'sort': ['M_CT2O', 'M_CT2U']
  },
  'M_FB2': {
    'col': 2,
    "col188": 1,
    'text': {'M_FB1H': '{homeTeam}', 'M_FB1C': '{awayTeam}'},
    'sort': ['M_FB1H', 'M_FB1C']
  },
  'M_FFK2': {
    'col': 2,
    "col188": 1,
    'text': {'M_FFK2H': '{homeTeam}', 'M_FFK2C': '{awayTeam}'},
    'sort': ['M_FFK2H', 'M_FFK2C']
  },
  'M_KED2': {
    'col': 2,
    "col188": 1,
    'text': {'M_KED2H': '{homeTeam}', 'M_KED2C': '{awayTeam}'},
    'sort': ['M_KED2H', 'M_KED2C']
  },
  'M_DFDT2': {
    'col': 2,
    "col188": 1,
    'text': {'M_DFDT2H': '{homeTeam}', 'M_DFDT2C': '{awayTeam}'},
    'sort': ['M_DFDT2H', 'M_DFDT2C']
  },
  'M_FKBN2': {
    'col': 2,
    "col188": 1,
    'text': {'M_FKBN2H': '{homeTeam}', 'M_FKBN2C': '{awayTeam}'},
    'sort': ['M_FKBN2H', 'M_FKBN2C']
  },

  'M_FR1': {
    'col': 2,
    "col188": 1,
    'text': {'M_FR1H': '{homeTeam} {ratio}', 'M_FR1C': '{awayTeam} {ratio}'},
    'sort': ['M_FR1H', 'M_FR1C']
  },
  'M_FEO1': {
    'col': 2,
    'text': {'M_FEO1O': '单', 'M_FEO1E': '双'},
    'sort': ['M_FEO1O', 'M_FEO1E']
  },
  'M_FOU1': {
    'col': 2,
    'text': {'M_FOU1H': '大 {ratio}', 'M_FOU1C': '小 {ratio}'},
    'sort': ['M_FOU1H', 'M_FOU1C']
  },
  'M_FR2': {
    'col': 2,
    "col188": 1,
    'text': {'M_FR2H': '{homeTeam} {ratio}', 'M_FR2C': '{awayTeam} {ratio}'},
    'sort': ['M_FR2H', 'M_FR2C']
  },
  'M_FEO2': {
    'col': 2,
    'text': {'M_FEO2O': '单', 'M_FEO2E': '双'},
    'sort': ['M_FEO2O', 'M_FEO2E']
  },
  'M_FOU2': {
    'col': 2,
    'text': {'M_FOU2H': '大 {ratio}', 'M_FOU2C': '小 {ratio}'},
    'sort': ['M_FOU2H', 'M_FOU2C']
  },

};
