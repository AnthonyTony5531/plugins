  // Võ tự do MMA

const dynamic op_mmaRadioTypes = {

  'M': {
    'col': 2,
    'text': {'MH': '{homeTeam}', 'MC': '{awayTeam}'},
    'sort': ['MH', 'MC']
  },
  'MN': {
    'col': 2,
    'text': {'MNH': '{homeTeam}', 'MNC': '{awayTeam}'},
    'sort': ['MNH', 'MNC']
  },
  'WME': {
    'col': 2,
    'text': {
      'WMHK': '{homeTeam} Chiến thắng bằng Knock out',
      'WMHS': '{homeTeam} Chiến thắng bằng trang phục',
      'WMHD': '{homeTeam} Chiến thắng bằng phán quyết',
      'WMN': 'Hòa',
      'WMCK': '{awayTeam} Chiến thắng bằng Knock out',
      'WMCS': '{awayTeam} Chiến thắng bằng trang phục',
      'WMCD': '{awayTeam} Chiến thắng bằng phán quyết'
    },
    'sort': ['WMHK', 'WMHS', 'WMHD', 'WMN', 'WMCK', 'WMCS', 'WMCD']
  },
  'WFD': {
    'col': 2,
    'text': {'WFDY': 'Có', 'WFDN': 'Không'},
    'sort': ['WFDY', 'WFDN']
  },
  'WER': {
    'col': 3,
    'text': {
      'WER3H1': '{homeTeam} Vòng 1',
      'WER3H2': '{homeTeam} Vòng 2',
      'WER3H3': '{homeTeam} Vòng 3',
      'WER3HD': '{homeTeam} Phán quyết thắng',
      'WER3N': 'Hòa',
      'WER3C1': '{awayTeam} Vòng 1',
      'WER3C2': '{awayTeam} Vòng 2',
      'WER3C3': '{awayTeam} Vòng 3',
      'WER3CD': '{awayTeam} Phán quyết thắng',
      'WER5H1': '{homeTeam} Vòng 1',
      'WER5H2': '{homeTeam} Vòng 2',
      'WER5H3': '{homeTeam} Vòng 3',
      'WER5H4': '{homeTeam} Vòng 4',
      'WER5H5': '{homeTeam} Vòng 5',
      'WER5HD': '{homeTeam} Phán quyết thắng',
      'WER5N': 'Hòa',
      'WER5C1': '{awayTeam} Vòng 1',
      'WER5C2': '{awayTeam} Vòng 2',
      'WER5C3': '{awayTeam} Vòng 3',
      'WER5C4': '{awayTeam} Vòng 4',
      'WER5C5': '{awayTeam} Vòng 5',
      'WER5CD': '{awayTeam} Phán quyết thắng'
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
    'text': {
      'WVHK': 'Đội chủ nhà thắng bằng Knock out, kỹ thuật Knock out, truất quyền thi đấu hoặc đối phương đầu hàng',
      'WVHD': 'Đội chủ nhà thắng bằng phán quyết',
      'WVCK': 'Đội khách thắng bằng Knock out, kỹ thuật Knock out, truất quyền thi đấu hoặc đối phương đầu hàng',
      'WVCD': 'Đội khách thắng bằng phán quyết',
      'WVN': 'Trận hòa hoặc kỹ thuật hòa',
    },
    'sort': ['WVHK', 'WVHD', 'WVCK', 'WVCD', 'WVN']
  },
  'WERB': {
    'col': 2,
    'text': {
      'WERBH1': 'Đội chủ nhà giành chiến thắng trong Vòng 1 bằng Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc',
      'WERBH2': 'Đội chủ nhà giành chiến thắng trong Vòng 2 bằng Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc',
      'WERBH3': 'Đội chủ nhà giành chiến thắng trong Vòng 3 bằng Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc',
      'WERBC1': 'Đội khách giành chiến thắng trong Vòng 1 bằng Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc',
      'WERBC2': 'Đội khách giành chiến thắng trong Vòng 2 bằng Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc',
      'WERBC3': 'Đội khách giành chiến thắng trong Vòng 3 bằng Knock out, kỹ thuật Knock out hoặc đối phương bỏ cuộc',
      'WERBN':'Trận hòa hoặc kỹ thuật hòa'
    },
    'sort': ['WERBH1', 'WERBH2', 'WERBH3', 'WERBC1', 'WERBC2','WERBC3','WERBN']
  },

};
