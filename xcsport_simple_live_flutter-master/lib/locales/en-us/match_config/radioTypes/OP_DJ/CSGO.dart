// CS GO
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
    'text': {'MOU_RTO': 'Over {ratio}', 'MOU_RTU': 'Under {ratio}'},
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
    'text': {'MEO_MRO': 'Odd', 'MEO_MRE': 'Even'},
    'sort': ['MEO_MRO', 'MEO_MRE']
  },
  'MOU_TH': {
    'col': 2,
    'text': {'MOU_THO': 'Over {ratio}', 'MOU_THU': 'Under {ratio}'},
    'sort': ['MOU_THO', 'MOU_THU']
  },
  'MOU_RXT': {
    'col': 2,
    'text': {'MOU_RXTO': 'Over {ratio}', 'MOU_RXTU': 'Under {ratio}'},
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
    'text': {'MOU_TKHO': 'Over {ratio}', 'MOU_TKHU': 'Under {ratio}'},
    'sort': ['MOU_TKHO', 'MOU_TKHU']
  },
  'MOU_TKC': {
    'col': 2,
    'text': {'MOU_TKCO': 'Over {ratio}', 'MOU_TKCU': 'Under {ratio}'},
    'sort': ['MOU_TKCO', 'MOU_TKCU']
  },
  'MRBP': {
    'col': 2,
    'text': {'MRBPY': 'Yes', 'MRBPN': 'No'},
    'sort': ['MRBPY', 'MRBPN']
  },
  'MRBD': {
    'col': 2,
    'text': {'MRBDY': 'Yes', 'MRBDN': 'No'},
    'sort': ['MRBDY', 'MRBDN']
  },

  // 7.23 New Type of Handicap for E-sports
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
  'CT': {
    'col': 2,
    "col188": 1,
    'text': {'CT33': 'Before 33:00', 'CT34': 'After 33:01'},
    'sort': ['CT33', 'CT34']
  }
};
