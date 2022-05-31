// 刀塔
const dynamic dotaRadioTypes = {
  'M': {
    'col': 2,
    'text': {'MH': '{homeTeam}', 'MC': '{awayTeam}'},
    'sort': ['MH', 'MC']
  },
  'MCS': {
    'col': 2,
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
  'WBR': {
    'col': 2,
    'text': {'WBR74': '是', 'WBR76': '否'},
    'sort': ['WBR74', 'WBR76']
  },
  'WUK': {
    'col': 2,
    'text': {'WUK74': '是', 'WUK76': '否'},
    'sort': ['WUK74', 'WUK76']
  },
  'MOU_TK': {
    'col': 2,
    'text': {'MOU_TK12': '大 {ratio}', 'MOU_TK13': '小 {ratio}'},
    'sort': ['MOU_TK12', 'MOU_TK13']
  },
  'MOU_TT': {
    'col': 2,
    'text': {'MOU_TT12': '大 {ratio}', 'MOU_TT13': '小 {ratio}'},
    'sort': ['MOU_TT12', 'MOU_TT13']
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

  'FB': {
    'col': 2,
    "col188": 1,
    'text': {'FBH': '{homeTeam}', 'FBC': '{awayTeam}'},
    'sort': ['FBH', 'FBC']
  },
  'K10': {
    'col': 2,
    "col188": 1,
    'text': {'K10H': '{homeTeam}', 'K10C': '{awayTeam}'},
    'sort': ['K10H', 'K10C']
  },
  'CT': {
    'col': 2,
    "col188": 1,
    'text': {'CT35': '35:00或以下', 'CT36': '35:01或以上'},
    'sort': ['CT35', 'CT36']
  },
  'KM': {
    'col': 2,
    "col188": 1,
    'text': {'KMH': '{homeTeam}', 'KMC': '{awayTeam}'},
    'sort': ['KMH', 'KMC']
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
};
