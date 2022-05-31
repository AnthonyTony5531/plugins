// 綜合格鬥
const dynamic op_mmaRadioTypes = {

  'M': {
    'col': 2,
    "col188": 1,
    'text': {'MH': '{homeTeam}', 'MC': '{awayTeam}'},
    'sort': ['MH', 'MC']
  },
  'MN': {
    'col': 2,
    "col188": 1,
    'text': {'MNH': '{homeTeam}', 'MNC': '{awayTeam}'},
    'sort': ['MNH', 'MNC']
  },
  'WME': {
    'col': 2,
    "col188": 1,
    'text': {
      'WMHK': '{homeTeam}通過KO取勝',
      'WMHS': '{homeTeam}通過製服取勝',
      'WMHD': '{homeTeam}通過判決取勝',
      'WMN': "平",
      'WMCK': '{awayTeam}通過KO取勝',
      'WMCS': '{awayTeam}通過製服取勝',
      'WMCD': '{awayTeam}通過判決取勝'
    },
    'sort': ['WMHK', 'WMHS', 'WMHD', 'WMN', 'WMCK', 'WMCS', 'WMCD']
  },
  'WFD': {
    'col': 2,
    'text': {'WFDY': '是', 'WFDN': '否'},
    'sort': ['WFDY', 'WFDN']
  },
  'WER': {
    'col': 3,
    "col188": 1,
    'text': {
      'WER3H1': '{homeTeam} 1回合',
      'WER3H2': '{homeTeam} 2回合',
      'WER3H3': '{homeTeam} 3回合',
      'WER3HD': '{homeTeam} 判決勝出',
      'WER3N': "平",
      'WER3C1': '{awayTeam} 1回合',
      'WER3C2': '{awayTeam} 2回合',
      'WER3C3': '{awayTeam} 3回合',
      'WER3CD': '{awayTeam} 判決勝出',
      'WER5H1': '{homeTeam} 1回合',
      'WER5H2': '{homeTeam} 2回合',
      'WER5H3': '{homeTeam} 3回合',
      'WER5H4': '{homeTeam} 4回合',
      'WER5H5': '{homeTeam} 5回合',
      'WER5HD': '{homeTeam} 判決勝出',
      'WER5N': "平",
      'WER5C1': '{awayTeam} 1回合',
      'WER5C2': '{awayTeam} 2回合',
      'WER5C3': '{awayTeam} 3回合',
      'WER5C4': '{awayTeam} 4回合',
      'WER5C5': '{awayTeam} 5回合',
      'WER5CD': '{awayTeam} 判決勝出'
    },
    'sort': [
      'WER3H1',
      'WER3H2',
      'WER3H3',
      'WER3HD',
      'WER3N',
      'WER3C1',
      'WER3C2',
      'WER3C3',
      'WER3CD',
      'WER5H1',
      'WER5H2',
      'WER5H3',
      'WER5H4',
      'WER5H5',
      'WER5HD',
      'WER5N',
      'WER5C1',
      'WER5C2',
      'WER5C3',
      'WER5C4',
      'WER5C5',
      'WER5CD'
    ]
  },

  'WVM': {
    'col': 2,
    "col188": 1,
    'text': {
      'WVHK': '主隊通過擊倒、技術擊倒、對方取消資格或對方降服而勝出',
      'WVHD': '主隊通過判決而勝出',
      'WVCK': '客隊通過擊倒、技術擊倒、對方取消資格或對方降服而勝出',
      'WVCD': '客隊通過判決而勝出',
      'WVN': '平局或技術平局',
    },
    'sort': ['WVHK', 'WVHD', 'WVCK', 'WVCD', 'WVN']
  },
  'WERB': {
    'col': 2,
    "col188": 1,
    'text': {
      'WERBH1': '主隊在第1回合通過擊倒、技術擊倒或對方放棄而勝出',
      'WERBH2': '主隊在第2回合通過擊倒、技術擊倒或對方放棄而勝出',
      'WERBH3': '主隊在第3回合通過擊倒、技術擊倒或對方放棄而勝出',
      'WERBC1': '客隊在第1回合通過擊倒、技術擊倒或對方放棄而勝出',
      'WERBC2': '客隊在第2回合通過擊倒、技術擊倒或對方放棄而勝出',
      'WERBC3': '客隊在第3回合通過擊倒、技術擊倒或對方放棄而勝出',
      'WERBN':'平局或技術平局'
    },
    'sort': ['WERBH1', 'WERBH2', 'WERBH3', 'WERBC1', 'WERBC2','WERBC3','WERBN']
  },

};