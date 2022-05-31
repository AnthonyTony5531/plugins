// Boxing
const dynamic op_boRadioTypes = {
  "M": {
    "col": 2,
    "col188": 1,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "MN": {
    "col": 2,
    "col188": 1,
    "text": {"MNH": "{homeTeam}", "MNC": "{awayTeam}"},
    "sort": ["MNH", "MNC"]
  },
  "WME": {
    "col": 2,
    "col188": 1,
    "text": {
      "WMHK": "{homeTeam}Won through KO",
      "WMHD": "{homeTeam}Won through decision",
      "WMN": "Draw",
      "WMCK": "{awayTeam}Won through KO",
      "WMCD": "{awayTeam}Won through decision"
    },
    "sort": ["WMHK", "WMHD", "WMN", "WMCK", "WMCD"]
  },
  "WFD": {
    "col": 2,
    "text": {"WFDY": "Yes", "WFDN": "No"},
    "sort": ["WFDY", "WFDN"]
  },
  "WER": {
    "col": 3,
    "col188": 1,
    "text": {
      "WERH1": "{homeTeam} 1 Round",
      "WERH2": "{homeTeam} 2 Round",
      "WERH3": "{homeTeam} 3 Round",
      "WERH4": "{homeTeam} 4 Round",
      "WERH5": "{homeTeam} 5 Round",
      "WERH6": "{homeTeam} 6 Round",
      "WERH7": "{homeTeam} 7 Round",
      "WERH8": "{homeTeam} 8 Round",
      "WERH9": "{homeTeam} 9 Round",
      "WERH10": "{homeTeam} 10 Round",
      "WERH11": "{homeTeam} 11 Round",
      "WERH12": "{homeTeam} 12 Round",
      "WERHD": "{homeTeam} Won through decision",
      "WERN": "Draw",
      "WERC1": "{awayTeam} 1 Round",
      "WERC2": "{awayTeam} 2 Round",
      "WERC3": "{awayTeam} 3 Round",
      "WERC4": "{awayTeam} 4 Round",
      "WERC5": "{awayTeam} 5 Round",
      "WERC6": "{awayTeam} 6 Round",
      "WERC7": "{awayTeam} 7 Round",
      "WERC8": "{awayTeam} 8 Round",
      "WERC9": "{awayTeam} 9 Round",
      "WERC10": "{awayTeam} 10 Round",
      "WERC11": "{awayTeam} 11 Round",
      "WERC12": "{awayTeam} 12 Round",
      "WERCD": "{awayTeam} Won through decision"
    },
    "sort": [
      "WERH1",
      "WERH2",
      "WERH3",
      "WERH4",
      "WERH5",
      "WERH6",
      "WERH7",
      "WERH8",
      "WERH9",
      "WERH10",
      "WERH11",
      "WERH12",
      "WERHD",
      "WERN",
      "WERC1",
      "WERC2",
      "WERC3",
      "WERC4",
      "WERC5",
      "WERC6",
      "WERC7",
      "WERC8",
      "WERC9",
      "WERC10",
      "WERC11",
      "WERC12",
      "WERCD"
    ]
  },
  "WRR": {
    "col": 2,
    "col188": 1,
    "text": {
      "WRRH0": "{homeTeam} 1-3 Round",
      "WRRH1": "{homeTeam} 4-6 Round",
      "WRRH2": "{homeTeam} 7-9 Round",
      "WRRH3": "{homeTeam} 10-12 Round",
      "WRRH4": "{homeTeam} Won through decision",
      "WRRN5": "Draw",
      "WRRC6": "{awayTeam} 1-3 Round",
      "WRRC7": "{awayTeam} 4-6 Round",
      "WRRC8": "{awayTeam} 7-9 Round",
      "WRRC9": "{awayTeam} 10-12 Round",
      "WRRC0": "{awayTeam} Won through decision"
    },
    "sort": [
      "WRRH0",
      "WRRH1",
      "WRRH2",
      "WRRH3",
      "WRRH4",
      "WRRN5",
      "WRRC6",
      "WRRC7",
      "WRRC8",
      "WRRC9",
      "WRRC0"
    ]
  },
  "WVM": {
    "col": 2,
    "col188": 1,
    "text": {
      "WVHK":
          "Home Won through KO, TKO, opponent disqualified or opponent surrender",
      "WVHD": "Home Won through decision",
      "WVCK":
          "Away Won through KO, TKO, opponent disqualified or opponent surrender",
      "WVCD": "Away Won through decision",
      "WVN": "Draw or technical draw"
    },
    "sort": ["WVHK", "WVHD", "WVCK", "WVCD", "WVN"]
  },
  "WERB": {
    "col": 2,
    "col188": 1,
    "text": {
      "WERBH1": "Home at 1 Round Won through KO, TKO, or forfeit from opponent",
      "WERBH2": "Home at 2 Round Won through KO, TKO, or forfeit from opponent",
      "WERBH3": "Home at 3 Round Won through KO, TKO, or forfeit from opponent",
      "WERBH4": "Home at 4 Round Won through KO, TKO, or forfeit from opponent",
      "WERBH5": "Home at 5 Round Won through KO, TKO, or forfeit from opponent",
      "WERBH6": "Home at 6 Round Won through KO, TKO, or forfeit from opponent",
      "WERBH7": "Home at 7 Round Won through KO, TKO, or forfeit from opponent",
      "WERBH8": "Home at 8 Round Won through KO, TKO, or forfeit from opponent",
      "WERBH9": "Home at 9 Round Won through KO, TKO, or forfeit from opponent",
      "WERBH10":
          "Home at 10 Round Won through KO, TKO, or forfeit from opponent",
      "WERBH11":
          "Home at 11 Round Won through KO, TKO, or forfeit from opponent",
      "WERBH12":
          "Home at 12 Round Won through KO, TKO, or forfeit from opponent",
      "WERBC1": "Away at 1 Round Won through KO, TKO, or forfeit from opponent",
      "WERBC2": "Away at 2 Round Won through KO, TKO, or forfeit from opponent",
      "WERBC3": "Away at 3 Round Won through KO, TKO, or forfeit from opponent",
      "WERBC4": "Away at 4 Round Won through KO, TKO, or forfeit from opponent",
      "WERBC5": "Away at 5 Round Won through KO, TKO, or forfeit from opponent",
      "WERBC6": "Away at 6 Round Won through KO, TKO, or forfeit from opponent",
      "WERBC7": "Away at 7 Round Won through KO, TKO, or forfeit from opponent",
      "WERBC8": "Away at 8 Round Won through KO, TKO, or forfeit from opponent",
      "WERBC9": "Away at 9 Round Won through KO, TKO, or forfeit from opponent",
      "WERBC10":
          "Away at 10 Round Won through KO, TKO, or forfeit from opponent",
      "WERBC11":
          "Away at 11 Round Won through KO, TKO, or forfeit from opponent",
      "WERBC12":
          "Away at 12 Round Won through KO, TKO, or forfeit from opponent",
      "WERBHD": "Home Won through decision",
      "WERBCD": "Away Won through decision",
      "WERBN": "Draw or technical draw"
    },
    "sort": [
      "WERBH1",
      "WERBH2",
      "WERBH3",
      "WERBH4",
      "WERBH5",
      "WERBH6",
      "WERBH7",
      "WERBH8",
      "WERBH9",
      "WERBH10",
      "WERBH11",
      "WERBH12",
      "WERBC1",
      "WERBC2",
      "WERBC3",
      "WERBC4",
      "WERBC5",
      "WERBC6",
      "WERBC7",
      "WERBC8",
      "WERBC9",
      "WERBC10",
      "WERBC11",
      "WERBC12",
      "WERBHD",
      "WERBCD",
      "WERBN"
    ]
  },
  "WERB2": {
    "col": 1,
    "col188": 1,
    "text": {
      "WERBH1": "Home at 1 Round Won through KO, TKO, or forfeit from opponent",
      "WERBH2": "Home at 2 Round Won through KO, TKO, or forfeit from opponent",
      "WERBH3": "Home at 3 Round Won through KO, TKO, or forfeit from opponent",
      "WERBC1": "Away at 1 Round Won through KO, TKO, or forfeit from opponent",
      "WERBC2": "Away at 2 Round Won through KO, TKO, or forfeit from opponent",
      "WERBC3": "Away at 3 Round Won through KO, TKO, or forfeit from opponent",
      "WERBN": "Draw or technical draw"
    },
    "sort": [
      "WERBH1",
      "WERBH2",
      "WERBH3",
      "WERBC1",
      "WERBC2",
      "WERBC3",
      "WERBN"
    ]
  },
  "DC": {
    "col": 2,
    "col188": 1,
    "text": {
      "RD1": "1 Round",
      "RD2": "2 Round",
      "RD3": "3 Round",
      "RD4": "4 Round",
      "RD5": "5 Round",
      "RDP": "Score"
    },
    "sort": ["RD1", "RD2", "RD3", "RD4", "RD5", "RDP"]
  },
  "WFO": {
    "col": 2,
    "col188": 1,
    "text": {
      "WFOK": "KO/TKO",
      "WFOY": "Submission techniques",
      "WFOP": "Score"
    },
    "sort": ["WFOK", "WFOY", "WFOP"]
  },
  "WRD": {
    "col": 2,
    "col188": 1,
    "text": {
      "RD1": "1 Round",
      "RD2": "2 Round",
      "RD3": "3 Round",
      "RD4": "4 Round",
      "RD5": "5 Round",
      "RDP": "Score"
    },
    "sort": ["RD1", "RD2", "RD3", "RD4", "RD5", "RDP"]
  },
  'RBW': {
    'col': 1,
    'text': {
      'RBWH1':
          '{homeTeam}at 1 Round Won through KO, TKO, or forfeit from opponent',
      'RBWH2':
          '{homeTeam}at 2 Round Won through KO, TKO, or forfeit from opponent',
      'RBWH3':
          '{homeTeam}at 3 Round Won through KO, TKO, or forfeit from opponent',
      'RBWH4':
          '{homeTeam}at 4 Round Won through KO, TKO, or forfeit from opponent',
      'RBWH5':
          '{homeTeam}at 5 Round Won through KO, TKO, or forfeit from opponent',
      'RBWHD': '{homeTeam}Won through decision',
      'RBWC1':
          '{awayTeam}at 1 Round Won through KO, TKO, or forfeit from opponent',
      'RBWC2':
          '{awayTeam}at 2 Round Won through KO, TKO, or forfeit from opponent',
      'RBWC3':
          '{awayTeam}at 3 Round Won through KO, TKO, or forfeit from opponent',
      'RBWC4':
          '{awayTeam}at 4 Round Won through KO, TKO, or forfeit from opponent',
      'RBWC5':
          '{awayTeam}at 5 Round Won through KO, TKO, or forfeit from opponent',
      'RBWCD': '{awayTeam}Won through decision',
      'RBWN': 'Draw or technical draw'
    },
    'sort': [
      'RBWH1',
      'RBWH2',
      'RBWH3',
      'RBWH4',
      'RBWH5',
      'RBWHD',
      'RBWC1',
      'RBWC2',
      'RBWC3',
      'RBWC4',
      'RBWC5',
      'RBWCD',
      'RBWN'
    ]
  },
  "MV": {
    "col": 2,
    "col188": 1,
    "text": {
      "MVHK": "{homeTeam}Won through KO, TKO, or opponent's foul",
      "MVHS": "{homeTeam}Won through submission techniques",
      "MVHP": "{homeTeam}Won through points decision",
      "MVN": "Draw",
      "MVCK": "{awayTeam}Won through KO",
      "MVCS": "{awayTeam}Won through submission techniques",
      "MVCP": "{awayTeam}Won through points decision"
    },
    "sort": ['MVHK', 'MVCK', 'MVHS', 'MVCS', 'MVHP', 'MVCP', 'MVN']
  },
  "FD": {
    "col": 2,
    "text": {"FDY": "Yes", "FDN": "No"},
    "sort": ["FDY", "FDN"]
  },
  'AG': {
    'col': 2,
    'text': {'AGC': 'Over {ratio}', 'AGH': 'Under {ratio}'},
    'sort': ['AGC', 'AGH']
  },
  "WC": {
    "col": 1,
    "col188": 1,
    "text": {
      "WCHK1": "{homeTeam}at 1 Round Won through KO, TKO, or opponent's foul",
      "WCHK2": "{homeTeam}at 2 Round Won through KO, TKO, or opponent's foul",
      "WCHK3": "{homeTeam}at 3 Round Won through KO, TKO, or opponent's foul",
      "WCHK4": "{homeTeam}at 4 Round Won through KO, TKO, or opponent's foul",
      "WCHK5": "{homeTeam}at 5 Round Won through KO, TKO, or opponent's foul",
      "WCHS1": "{homeTeam}at 1 Round Won through Submission techniques",
      "WCHS2": "{homeTeam}at 2 Round Won through Submission techniques",
      "WCHS3": "{homeTeam}at 3 Round Won through Submission techniques",
      "WCHS4": "{homeTeam}at 4 Round Won through Submission techniques",
      "WCHS5": "{homeTeam}at 5 Round Won through Submission techniques",
      "WCCK1": "{awayTeam}at 1 Round Won through KO, TKO, or opponent's foul",
      "WCCK2": "{awayTeam}at 2 Round Won through KO, TKO, or opponent's foul",
      "WCCK3": "{awayTeam}at 3 Round Won through KO, TKO, or opponent's foul",
      "WCCK4": "{awayTeam}at 4 Round Won through KO, TKO, or opponent's foul",
      "WCCK5": "{awayTeam}at 5 Round Won through KO, TKO, or opponent's foul",
      "WCCS1": "{awayTeam}at 1 Round Won through Submission techniques",
      "WCCS2": "{awayTeam}at 2 Round Won through Submission techniques",
      "WCCS3": "{awayTeam}at 3 Round Won through Submission techniques",
      "WCCS4": "{awayTeam}at 4 Round Won through Submission techniques",
      "WCCS5": "{awayTeam}at 5 Round Won through Submission techniques",
      "WCF": "Draw or technical draw"
    },
    "sort": [
      "WCHK1",
      "WCHK2",
      "WCHK3",
      "WCHK4",
      "WCHK5",
      "WCHS1",
      "WCHS2",
      "WCHS3",
      "WCHS4",
      "WCHS5",
      "WCCK1",
      "WCCK2",
      "WCCK3",
      "WCCK4",
      "WCCK5",
      "WCCS1",
      "WCCS2",
      "WCCS3",
      "WCCS4",
      "WCCS5",
      "WCF"
    ]
  },
  "T2R": {
    "col": 2,
    "text": {"T2RY": "Yes", "T2RN": "No"},
    "sort": ["T2RY", "T2RN"]
  },
  "T3R": {
    "col": 2,
    "text": {"T3RY": "Yes", "T3RN": "No"},
    "sort": ["T3RY", "T3RN"]
  },
  "T4R": {
    "col": 2,
    "text": {"T4RY": "Yes", "T4RN": "No"},
    "sort": ["T4RY", "T4RN"]
  },
  "T5R": {
    "col": 2,
    "text": {"T5RY": "Yes", "T5RN": "No"},
    "sort": ["T5RY", "T5RN"]
  },
  "HWM": {
    "col": 2,
    "text": {"HWMY": "Yes", "HWMN": "No"},
    "sort": ["HWMY", "HWMN"]
  },
  "CWM": {
    "col": 2,
    "text": {"CWMY": "Yes", "CWMN": "No"},
    "sort": ["CWMY", "CWMN"]
  },
  'END': {
    'col': 2,
    'text': {'ENDY': 'Yes', 'ENDN': 'No'},
    'sort': ['ENDY', 'ENDN']
  },
  "WTO": {
    "col": 1,
    "col188": 1,
    "text": {
      "WTOHA": "{homeTeam}Won & total round is Over 0.5",
      "WTOHB": "{homeTeam}Won & total round is Over 1.5",
      "WTOHC": "{homeTeam}Won & total round is Over 2.5",
      "WTOHD": "{homeTeam}Won & total round is Over 3.5",
      "WTOHE": "{homeTeam}Won & total round is Over 4.5",
      "WTOCA": "{awayTeam}Won & total round is Over 0.5",
      "WTOCB": "{awayTeam}Won & total round is Over 1.5",
      "WTOCC": "{awayTeam}Won & total round is Over 2.5",
      "WTOCD": "{awayTeam}Won & total round is Over 3.5",
      "WTOCE": "{awayTeam}Won & total round is Over 4.5"
    },
    "sort": [
      "WTOHA",
      "WTOHB",
      "WTOHC",
      "WTOHD",
      "WTOHE",
      "WTOCA",
      "WTOCB",
      "WTOCC",
      "WTOCD",
      "WTOCE"
    ]
  },
  'WTU': {
    'col': 1,
    'text': {
      'WTUHA': '{homeTeam}Won & total round is Under 0.5',
      'WTUHB': '{homeTeam}Won & total round is Under 1.5',
      'WTUHC': '{homeTeam}Won & total round is Under 2.5',
      'WTUHD': '{homeTeam}Won & total round is Under 3.5',
      'WTUHE': '{homeTeam}Won & total round is Under 4.5',
      'WTUCA': '{awayTeam}Won & total round is Under 0.5',
      'WTUCB': '{awayTeam}Won & total round is Under 1.5',
      'WTUCC': '{awayTeam}Won & total round is Under 2.5',
      'WTUCD': '{awayTeam}Won & total round is Under 3.5',
      'WTUCE': '{awayTeam}Won & total round is Under 4.5'
    },
    'sort': [
      'WTUHA',
      'WTUHB',
      'WTUHC',
      'WTUHD',
      'WTUHE',
      'WTUCA',
      'WTUCB',
      'WTUCC',
      'WTUCD',
      'WTUCE'
    ]
  },
  "WT": {
    "col": 1,
    "text": {
      "WT1": "Round 1 game ended during 00:00-01:59 ",
      "WT2": "Round 1 game ended during 02:00-02:59 ",
      "WT3": "Round 1 game ended during 03:00-03:59 ",
      "WT4": "Round 1 game ended during 04:00-04:59 ",
      "WT5": "Round 1 game ended during after 4 minutes",
      "WT6": "Round 2 game ended during 00:00-01:59 ",
      "WT7": "Round 2 game ended during 02:00-02:59 ",
      "WT8": "Round 2 game ended during 03:00-03:59 ",
      "WT9": "Round 2 game ended during 04:00-04:59 ",
      "WT10": "Round 2 game ended during after 4 minutes",
      "WT11": "Round 3 game ended during 00:00-01:59 ",
      "WT12": "Round 3 game ended during 02:00-02:59 ",
      "WT13": "Round 3 game ended during 03:00-03:59 ",
      "WT14": "Round 3 game ended during 04:00-04:59 ",
      "WT15": "Round 3 game ended during after 4 minutes",
      "WT16": "Round 4 game ended during 00:00-01:59 ",
      "WT17": "Round 4 game ended during 02:00-02:59 ",
      "WT18": "Round 4 game ended during 03:00-03:59 ",
      "WT19": "Round 4 game ended during 04:00-04:59 ",
      "WT20": "Round 4 game ended during after 4 minutes",
      "WT21": "Round 5 game ended during 00:00-01:59 ",
      "WT22": "Round 5 game ended during 02:00-02:59 ",
      "WT23": "Round 5 game ended during 03:00-03:59 ",
      "WT24": "Round 5 game ended during 04:00-04:59 ",
      "WT25": "Round 5 game ended during after 4 minutes",
      "WT26": "Finish all Rounds"
    },
    "sort": [
      "WT1",
      "WT2",
      "WT3",
      "WT4",
      "WT5",
      "WT6",
      "WT7",
      "WT8",
      "WT9",
      "WT10",
      "WT11",
      "WT12",
      "WT13",
      "WT14",
      "WT15",
      "WT16",
      "WT17",
      "WT18",
      "WT19",
      "WT20",
      "WT21",
      "WT22",
      "WT23",
      "WT24",
      "WT25",
      "WT26"
    ]
  },
  "WM": {
    "col": 1,
    "text": {
      "WM1": "KO/TKO/Opponent's foul",
      "WM2": "Submission techniques",
      "WM3": "Points",
      "WM4": "Draw"
    },
    "sort": ["WM1", "WM2", "WM3", "WM4"]
  },
  "WDC": {
    "col": 1,
    "text": {
      "WDCA": "KO,TKO,Opponent's foul/Submission techniques",
      "WDCB": "Submission techniques/Points",
      "WDCC": "KO,TKO,Opponent's foul/Points"
    },
    "sort": ["WDCA", "WDCB", "WDCC"]
  },
  'TMW': {
    'col': 3,
    "col188": 1,
    'text': {'TMWH': '{homeTeam}', 'TMWC': '{awayTeam}', 'TMWN': 'Draw'},
    'sort': ['TMWH', 'TMWC', 'TMWN']
  },
  'MBOA': {
    'col': 3,
    "col188": 1,
    'text': {'MBOAH': '{homeTeam}', 'MBOAC': '{awayTeam}', 'MBOAN': 'Draw'},
    'sort': ['MBOAH', 'MBOAC', 'MBOAN']
  },
  "TD": {
    "col": 2,
    "col188": 1,
    "text": {"TDH": "{homeTeam}", "TDC": "{awayTeam}"},
    "sort": ["TDH", "TDC"]
  },
  "TM": {
    "col": 2,
    "col188": 1,
    "text": {"TMH": "{homeTeam}", "TMC": "{awayTeam}"},
    "sort": ["TMH", "TMC"]
  },
  'DA': {
    'col': 1,
    'text': {'DAY': 'Yes'},
    'sort': ['DAY']
  },
  'UDA': {
    'col': 1,
    'text': {'UDAY': 'Yes'},
    'sort': ['UDAY']
  },
  'UDB': {
    'col': 1,
    'text': {'UDBY': 'Yes'},
    'sort': ['UDBY']
  },
  'DMA': {
    'col': 1,
    'text': {'DMAY': 'Yes'},
    'sort': ['DMAY']
  },
  'DMB': {
    'col': 1,
    'text': {'DMBY': 'Yes'},
    'sort': ['DMBY']
  },
  "RM": {
    "col": 2,
    "col188": 1,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  
};
