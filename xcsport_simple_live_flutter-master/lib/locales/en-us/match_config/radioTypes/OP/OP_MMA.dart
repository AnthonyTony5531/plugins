// MMA
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
      'WMHK': '{homeTeam}Won through KO',
      'WMHS': '{homeTeam}Won through submission',
      'WMHD': '{homeTeam}Won through decision',
      'WMN': "Draw",
      'WMCK': '{awayTeam}Won through KO',
      'WMCS': '{awayTeam}Won through submission',
      'WMCD': '{awayTeam}Won through decision'
    },
    'sort': ['WMHK', 'WMHS', 'WMHD', 'WMN', 'WMCK', 'WMCS', 'WMCD']
  },
  'WFD': {
    'col': 2,
    'text': {'WFDY': 'Yes', 'WFDN': 'No'},
    'sort': ['WFDY', 'WFDN']
  },
  'WER': {
    'col': 3,
    "col188": 1,
    'text': {
      'WER3H1': '{homeTeam} 1 round',
      'WER3H2': '{homeTeam} 2 round',
      'WER3H3': '{homeTeam} 3 round',
      'WER3HD': '{homeTeam} Won through decision',
      'WER3N': "Draw",
      'WER3C1': '{awayTeam} 1 round',
      'WER3C2': '{awayTeam} 2 round',
      'WER3C3': '{awayTeam} 3 round',
      'WER3CD': '{awayTeam} Won through decision',
      'WER5H1': '{homeTeam} 1 round',
      'WER5H2': '{homeTeam} 2 round',
      'WER5H3': '{homeTeam} 3 round',
      'WER5H4': '{homeTeam} 4 round',
      'WER5H5': '{homeTeam} 5 round',
      'WER5HD': '{homeTeam} Won through decision',
      'WER5N': "Draw",
      'WER5C1': '{awayTeam} 1 round',
      'WER5C2': '{awayTeam} 2 round',
      'WER5C3': '{awayTeam} 3 round',
      'WER5C4': '{awayTeam} 4 round',
      'WER5C5': '{awayTeam} 5 round',
      'WER5CD': '{awayTeam} Won through decision',
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
      'WVHK':"Home-Won through KO, TKO, opponent's disqualified or forfeit",
      'WVHD': 'Home-Won through decision',
      'WVCK':"Away-Won through KO, TKO, opponent's disqualified or forfeit",
      'WVCD': 'Away-Won through decision',
      'WVN': 'Draw or Technical Draw',
    },
    'sort': ['WVHK', 'WVHD', 'WVCK', 'WVCD', 'WVN']
  },
  'WERB': {
    'col': 2,
    "col188": 1,
    'text': {
      'WERBH1':"Home - Won through KO, TKO or opponent's forfeit in 1st round",
      'WERBH2':"Home - Won through KO, TKO or opponent's forfeit in 1st round",
      'WERBH3':"Home - Won through KO, TKO or opponent's forfeit in 3rd round",
      'WERBC1':"Away - Won through KO, TKO or opponent's forfeit in 1st round",
      'WERBC2':"Away - Won through KO, TKO or opponent's forfeit in 1st round",
      'WERBC3':"Away - Won through KO, TKO or opponent's forfeit in 3rd round",
      'WERBN': "Draw or Technical Draw",
    },
    'sort': [
      'WERBH1',
      'WERBH2',
      'WERBH3',
      'WERBC1',
      'WERBC2',
      'WERBC3',
      'WERBN'
    ]
  },
};
