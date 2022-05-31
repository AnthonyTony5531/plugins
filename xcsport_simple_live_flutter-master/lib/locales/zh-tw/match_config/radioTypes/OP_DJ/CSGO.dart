// 反恐精英
const dynamic csgoRadioTypes = {
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
  'MR_MW': {
    'col': 2,
    "col188": 1,
    'text': {'MR_MWH': '{homeTeam}', 'MR_MWA': '{awayTeam}'},
    'sort': ['MR_MWH', 'MR_MWA']
  },
  'MR_RH': {
    'col': 2,
    "col188": 1,
    'text': {'MR_RHH': '{homeTeam} {ratio}', 'MR_RHC': '{awayTeam} {ratio}'},
    'sort': ['MR_RHH', 'MR_RHC']
  },
  'MOU_RT': {
    'col': 2,
    'text': {'MOU_RTO': '大 {ratio}', 'MOU_RTU': '小 {ratio}'},
    'sort': ['MOU_RTO', 'MOU_RTU']
  },
  'MR_MK': {
    'col': 2,
    "col188": 1,
    'text': {'MR_MKH': '{homeTeam}', 'MR_MKA': '{awayTeam}'},
    'sort': ['MR_MKH', 'MR_MKA']
  },
  'MR_RW': {
    'col': 2,
    "col188": 1,
    'text': {'MR_RWH': '{homeTeam}', 'MR_RWA': '{awayTeam}'},
    'sort': ['MR_RWH', 'MR_RWA']
  },
  'MR_RR': {
    'col': 2,
    "col188": 1,
    'text': {'MR_RRH': '{homeTeam}', 'MR_RRA': '{awayTeam}'},
    'sort': ['MR_RRH', 'MR_RRA']
  },
  'MEO_MR': {
    'col': 2,
    'text': {'MEO_MRO': '單', 'MEO_MRE': '雙'},
    'sort': ['MEO_MRO', 'MEO_MRE']
  },
  'MOU_TH': {
    'col': 2,
    'text': {'MOU_THO': '大 {ratio}', 'MOU_THU': '小 {ratio}'},
    'sort': ['MOU_THO', 'MOU_THU']
  },
  'MOU_RXT': {
    'col': 2,
    'text': {'MOU_RXTO': '大 {ratio}', 'MOU_RXTU': '小 {ratio}'},
    'sort': ['MOU_RXTO', 'MOU_RXTU']
  },
  'MR_KH': {
    'col': 2,
    "col188": 1,
    'text': {'MR_KHH': '{homeTeam} {ratio}', 'MR_KHC': '{awayTeam} {ratio}'},
    'sort': ['MR_KHH', 'MR_KHC']
  },
  'MOU_TKH': {
    'col': 2,
    'text': {'MOU_TKHO': '大 {ratio}', 'MOU_TKHU': '小 {ratio}'},
    'sort': ['MOU_TKHO', 'MOU_TKHU']
  },
  'MOU_TKC': {
    'col': 2,
    'text': {'MOU_TKCO': '大 {ratio}', 'MOU_TKCU': '小 {ratio}'},
    'sort': ['MOU_TKCO', 'MOU_TKCU']
  },
  'MRBP': {
    'col': 2,
    'text': {'MRBPY': '是', 'MRBPN': '否'},
    'sort': ['MRBPY', 'MRBPN']
  },
  'MRBD': {
    'col': 2,
    'text': {'MRBDY': '是', 'MRBDN': '否'},
    'sort': ['MRBDY', 'MRBDN']
  },

  // 7.23新增電競玩法
  'M': {
    'col': 2,
    "col188": 1,
    'text': {'MH': '{homeTeam}', 'MC': '{awayTeam}'},
    'sort': ['MH', 'MC']
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
    'text': {'KEOO': '單', 'KEOE': '雙'},
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
  'CT': {
    'col': 2,
    "col188": 1,
    'text': {'CT33': '33:00或以下', 'CT34': '33:01或以上'},
    'sort': ['CT33', 'CT34']
  }
};
