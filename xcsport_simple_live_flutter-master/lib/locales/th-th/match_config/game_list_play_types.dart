
//列表专业版玩法展示
const dynamic laoniaoPlayTypeLang = {
  "FT": [
    {
      "name": "1x2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      "name": "มุม",
      "key": ["rouConner", "ouConner"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      "name": "1H 1x2",
      "key": ["HRM", "HM"],
      "sort": [
        ['HRMH', 'HRMC', 'HRMN'],
        ['HMH', 'HMC', 'HMN']
      ],
    },
    {
      "name": "1H HCP",
      "key": ["HRE", "HR"],
      "sort": [
        ['HREH', 'HREC'],
        ['HRH', 'HRC']
      ]
    },
    {
      "name": "1H TOT",
      "key": ["HROU", "HOU"],
      "sort": [
        ['HROUC', 'HROUH'],
        ['HOUC', 'HOUH']
      ],
    },
  ],
  "BK": [
    //篮球
    {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    // {
    //   "name": "单双",
    //   "key": ["REO", "EO"],
    //   "sort": [
    //     ['REOO', 'REOE'],
    //     ['EOO', 'EOE']
    //   ],
    // },
    //雷达
    // {
    //   "name": "获胜者",
    //   "key": ["RM0", "M0"],
    //   "sort": [
    //     ['RM0H', 'RM0C'],
    //     ['M0H', 'M0C']
    //   ],
    // },
    // {
    //   "name": "总分",
    //   "key": ["ROU0", "OU0"],
    //   "sort": [
    //     ['ROU0H', 'ROU0C'],
    //     ['OU0H', 'OU0C']
    //   ],
    // },

    // {
    //   "name": "上半场获胜",
    //   "key": ["RM1", "M1"],
    //   "sort": [
    //     ['RM1H', 'RM1C'],
    //     ['M1H', 'M1C']
    //   ],
    // },

    // {
    //   "name": "上半场让分",
    //   "key": ["RE1", "R1"],
    //   "sort": [
    //     ['RE1H', 'RE1C'],
    //     ['R1H', 'R1C']
    //   ],
    // },

    // {
    //   "name": "上半场总分",
    //   "key": ["ROU1", "OU1"],
    //   "sort": [
    //     ['ROU1H', 'ROU1C'],
    //     ['OU1H', 'OU1C']
    //   ],
    // },
  ],
  "TN": [
    //网球
    {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
//    {
//      "name": "单双",
//      "key": ["EO", "EO"],
//      "sort": [
//        ['EOO', 'EOE'],
//        ['EOO', 'EOE']
//      ],
//    }
  ],
  "BS": [
    //棒球
    {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
//    {
//      "name": "上半场获胜",
//      "key": ["HRM", "HM"],
//      "sort": [
//        ['HRMH', 'HRMC'],
//        ['HMH', 'HMC']
//      ],
//    },
//    {
//      "name": "上半场让球",
//      "key": ["HRE", "HR"],
//      "sort": [
//        ['HREH', 'HREC'],
//        ['HRH', 'HRC']
//      ]
//    },
//    {
//      "name": "上半场总分",
//      "key": ["HROU", "HOU"],
//      "sort": [
//        ['HROUC', 'HROUH'],
//        ['HOUC', 'HOUH']
//      ],
//    }
  ],
  "OP_DJ": [
    //电竞
    {
      //电竞.电竞没有让球说法，需要改成让分
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  "BK_AFT": [
    //美式足球
    {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  "OP_RU": [
    //橄榄球
    {
      "name": "1x2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
//    {
//      "name": "上半场独赢",
//      "key": ["HRM", "HM"],
//      "sort": [
//        ['HRMH', 'HRMC', 'HRMN'],
//        ['HMH', 'HMC', 'HMN']
//      ],
//    },
//    {
//      "name": "上半场让球",
//      "key": ["HRE", "HR"],
//      "sort": [
//        ['HREH', 'HREC'],
//        ['HRH', 'HRC']
//      ]
//    },
//    {
//      "name": "上半场球队得分",
//      "key": ["HROU", "HOU"],
//      "sort": [
//        ['HROUC', 'HROUH'],
//        ['HOUC', 'HOUH']
//      ],
//    },
  ],
  "OP_IH": [
    //冰球
    {
      "name": "1x2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  "OP_HB": [
    //手球
    {
      "name": "1x2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
//    {
//      "name": "上半场独赢",
//      "key": ["HRM", "HM"],
//      "sort": [
//        ['HRMH', 'HRMC', 'HRMN'],
//        ['HMH', 'HMC', 'HMN']
//      ],
//    },
//    {
//      "name": "上半场让球",
//      "key": ["HRE", "HR"],
//      "sort": [
//        ['HREH', 'HREC'],
//        ['HRH', 'HRC']
//      ]
//    },
//    {
//      "name": "上半场大小",
//      "key": ["HROU", "HOU"],
//      "sort": [
//        ['HROUC', 'HROUH'],
//        ['HOUC', 'HOUH']
//      ],
//    },
  ],
  "OP": [
    //其他
    {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],

  //综合格斗
  "OP_MMA": [
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      "name": "จบทุกรอบในการแข่งขันชกมวย",
      "key": ["RWFD", "WFD"],
      "sort": [
        ['RWFDH', 'RWFDC'],
        ['WFDH', 'WFDC']
      ],
    }
  ],

  //拳击
  "OP_BO": [
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      "name": "จบทุกรอบในการแข่งขันชกมวย",
      "key": ["RWFD", "WFD"],
      "sort": [
        ['RWFDH', 'RWFDC'],
        ['WFDH', 'WFDC']
      ],
    }
  ],

  //乒乓球
  "OP_TN": [
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],

  //飞镖
  "OP_DR": [
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "จำนวนการแข่งขันทั้งหมด",
      "key": ["RSOU", "SOU"],
      "sort": [
        ['RSOUH', 'RSOUC'],
        ['SOUH', 'SOUC']
      ],
    },
    {
      "name": "จำนวนเกมทั้งหมด",
      "key": ["RLOU", "LOU"],
      "sort": [
        ['RLOUH', 'RLOUC'],
        ['LOUH', 'LOUC']
      ],
    },
    {
      "name": "จำนวนแมตช์คี่และคู่",
      "key": ["REO", "EO"],
      "sort": [
        ['REOO', 'REOE'],
        ['EOO', 'EOE']
      ],
    },
  ],

  //沙滩排球
  "OP_BV": [
    {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],

  //板球
  "OP_CK": [
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "ขนาดกลม",
      "key": ["RSOU", "SOU"],
      "sort": [
        ['RSOUH', 'RSOUC'],
        ['SOUH', 'SOUC']
      ],
    },
    {
      "name": "รอบแรกคี่และคู่",
      "key": ["RSEO", "SEO"],
      "sort": [
        ['REOO', 'REOE'],
        ['EOO', 'EOE']
      ],
    },
    {
      "name": "มีรอบสุดมั้ย",
      "key": ["RWSO", "WSO"],
      "sort": [
        ['RWSOH', 'RWSOC'],
        ['WSOH', 'WSOC']
      ],
    },
  ],

  //排球
  "OP_VB": [
    {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],

  //地板球
  "OP_FB": [
    {
      "name": "1X2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],

  //羽毛球
  "OP_BM": [
    {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],

  //斯诺克
  "OP_SN": [
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      "name": "จำนวนรอบคี่และคู่",
      "key": ["REO", "EO"],
      "sort": [
        ['REOO', 'REOE'],
        ['EOO', 'EOE']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    }
  ],

  //曲棍球
  "OP_FH": [
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "1H 1x2",
      "key": ["HRM", "HM"],
      "sort": [
        ['HRMH', 'HRMC', 'HRMN'],
        ['HMH', 'HMC', 'HMN']
      ],
    },
    {
      "name": "1H HCP",
      "key": ["HRE", "HR"],
      "sort": [
        ['HREH', 'HREC'],
        ['HRH', 'HRC']
      ],
    },
    {
      "name": "1H TOT",
      "key": ["HROU", "HOU"],
      "sort": [
        ['HROUH', 'HROUC'],
        ['HOUH', 'HOUC']
      ],
    }
  ],
  //高尔夫
  "OP_GF": [
    {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  //自行车
  "OP_BA": [
    {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  //自行车
  "OP_CY": [
   {
     "name": "HCP",
     "key": ["RE", "R"],
     "sort": [
       ['REH', 'REC'],
       ['RH', 'RC']
     ],
   },
   {
     "name": "TOT",
     "key": ["ROU", "OU"],
     "sort": [
       ['ROUC', 'ROUH'],
       ['OUC', 'OUH']
     ],
   },
     {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
  ],
  //赛车
  "OP_AR": [
    {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  // 金融
  "OP_JR": [
    {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  // 室内足球
  "OP_FU": [
    {
      "name": "1x2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],

};


//列表小白玩法展示
const dynamic xiaobaiPlayTypeLang = {
  "FT": [
    {
      "name": "1x2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMN', 'RMC'],
        ['MH', 'MN', 'MC']
      ],
    },
    // {
    //   "name":"全场让球",
    //   "key":["RE","R"],
    //   "sort" : [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // },
    // {
    //   "name":"全场大小",
    //   "key":["ROU","OU"],
    //   "sort" : [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // }
  ],
  "BK": [
    // {
    //   "name":"总分",
    //   "key":["ROU","OU"],
    //   "sort" : [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name":"单双",
    //   "key":["REO","EO"],
    //   "sort" : [
    //     ['REOO', 'REOE'],
    //     ['EOO', 'EOE']
    //   ],
    // },
    {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },

    //雷达
    {
      "name": "ผู้ชนะ",
      "key": ["RM0", "M0"],
      "sort": [
        ['RM0H', 'RM0C'],
        ['M0H', 'M0C']
      ],
    },
    // {
    //   "name":"总分",
    //   "key":["ROU0","OU0"],
    //   "sort" : [
    //     ['ROU0H', 'ROU0C'],
    //     ['OU0H', 'OU0C']
    //   ],
    // },

    // {
    //   "name":"上半场获胜",
    //   "key":["RM1","M1"],
    //   "sort" : [
    //     ['RM1H', 'RM1C'],
    //     ['M1H', 'M1C']
    //   ],
    // },
  ],
  "TN": [
    {
      //网球
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "局数单双",
    //   "key": ["EO", "EO"],
    //   "sort": [
    //     ['EOO', 'EOE'],
    //     ['EOO', 'EOE']
    //   ],
    // },
    {
      "name": "ผู้ชนะ",
      "key": ["RM0", "M0"],
      "sort": [
        ['RM0H', 'RM0C'],
        ['M0H', 'M0C']
      ],
    },
    // {
    //   "name": "总分",
    //   "key": ["ROU0", "OU0"],
    //   "sort": [
    //     ['ROU0H', 'ROU0C'],
    //     ['OU0H', 'OU0C']
    //   ],
    // },
    
    // {
    //   "name": "上半场让分",
    //   "key": ["RE1", "R1"],
    //   "sort": [
    //     ['RE1H', 'RE1C'],
    //     ['R1H', 'R1C']
    //   ],
    // },
  ],
  "BS": [
    {
      //棒球
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "大小",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // }
  ],
  "OP_DJ": [
    {
      //电竞
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "总局数",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // }
  ],
  "BK_AFT": [
    {
      //美式足球
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "单双",
    //   "key": ["REO", "EO"],
    //   "sort": [
    //     ['REOO', 'REOE'],
    //     ['EOO', 'EOE']
    //   ],
    // }
  ],
  "OP_RU": [
    //橄榄球
    {
      "name": "1X2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMN', 'RMC'],
        ['MH', 'MN', 'MC']
      ],
    },
    // {
    //   "name": "全场大小",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // }
  ],
  "OP_IH": [
    //冰球
    {
      "name": "1X2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    // {
    //   "name": "全场单双",
    //   "key": ["EO", "EO"],
    //   "sort": [
    //     ['EOO', 'EOE'],
    //     ['EOO', 'EOE']
    //   ],
    // }
  ],
  "OP_HB": [
    //手球
    {
      "name": "1X2",
      "key": ["RM", "M"],
      "sort": [
        [
          'RMH',
          'RMN',
          'RMC',
        ],
        ['MH', 'MN', 'MC']
      ],
    },
    // {
    //   "name": "全场单双",
    //   "key": ["EO", "EO"],
    //   "sort": [
    //     ['EOO', 'EOE'],
    //     ['EOO', 'EOE']
    //   ],
    // }
  ],
  "OP": [
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "让分",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // },
    // {
    //   "name": "总分",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // }
  ],

  //综合格斗
  "OP_MMA": [
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "回合总数大小",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "拳赛中完成所有回合",
    //   "key": ["RWFD", "WFD"],
    //   "sort": [
    //     ['RWFDH', 'RWFDC'],
    //     ['WFDH', 'WFDC']
    //   ],
    // }
  ],

  //拳击
  "OP_BO": [
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "回合总数大小",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "拳赛中完成所有回合",
    //   "key": ["RWFD", "WFD"],
    //   "sort": [
    //     ['RWFDH', 'RWFDC'],
    //     ['WFDH', 'WFDC']
    //   ],
    // }
  ],

  //乒乓球
  "OP_TN": [
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "总分",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC' 'OUH']
    //   ],
    // },
    // {
    //   "name": "让分",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // }
  ],

  //飞镖
  "OP_DR": [
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "赛盘让分",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // },
    // {
    //   "name": "赛盘总数",
    //   "key": ["RSOU", "SOU"],
    //   "sort": [
    //     ['RSOUH', 'RSOUC'],
    //     ['SOUH', 'SOUC']
    //   ],
    // },
  ],

  //沙滩排球
  "OP_BV": [
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "总分",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "让分",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // }
  ],

  //板球
  "OP_CK": [
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "首回合大小",
    //   "key": ["RSOU", "SOU"],
    //   "sort": [
    //     ['RSOUC', 'RSOUH'],
    //     ['SOUC', 'SOUH']
    //   ],
    // },
  ],

  //排球
  "OP_VB": [
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "总分",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "让分",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // }
  ],

  //地板球
  "OP_FB": [
    {
      "name": "1X2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "大小",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
  ],

  //羽毛球
  "OP_BM": [
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "总分",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "让分",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // }
  ],

  //斯诺克
  "OP_SN": [
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "局数大小",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "局数单双",
    //   "key": ["REO", "EO"],
    //   "sort": [
    //     ['REOO', 'REOE'],
    //     ['EOO', 'EOE']
    //   ],
    // },
    // {
    //   "name": "局数让分",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // }
  ],

  //曲棍球
  "OP_FH": [
    {
      //其他
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "全场大小",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "全场让分",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // },
  ],
  //高尔夫
  "OP_GF": [
//    {
//      "name": "全场让球",
//      "key": ["RE", "R"],
//      "sort": [
//        ['REH', 'REC'],
//        ['RH', 'RC']
//      ],
//    },
//    {
//      "name": "全场大小",
//      "key": ["ROU", "OU"],
//      "sort": [
//        ['ROUC', 'ROUH'],
//        ['OUC', 'OUH']
//      ],
//    },
    {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
  ],
  //
  "OP_BA": [
    {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "HCP",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "TOT",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  //自行车
  "OP_CY": [
//    {
//      "name": "让分",
//      "key": ["RE", "R"],
//      "sort": [
//        ['REH', 'REC'],
//        ['RH', 'RC']
//      ],
//    },
//    {
//      "name": "大小",
//      "key": ["ROU", "OU"],
//      "sort": [
//        ['ROUC', 'ROUH'],
//        ['OUC', 'OUH']
//      ],
//    },
    {
      "name": "ผู้ชนะ",
      "key": ["M"],
      "sort": [

        ['MH', 'MC']
      ],
    },
  ],
  //赛车
  "OP_AR": [
//    {
//      "name": "让分",
//      "key": ["RE", "R"],
//      "sort": [
//        ['REH', 'REC'],
//        ['RH', 'RC']
//      ],
//    },
//    {
//      "name": "总分",
//      "key": ["ROU", "OU"],
//      "sort": [
//        ['ROUC', 'ROUH'],
//        ['OUC', 'OUH']
//      ],
//    },
    {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
  ],
  // 金融
  "OP_JR": [
    {
      "name": "ผู้ชนะ",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
//    {
//      "name": "HCP",
//      "key": ["RE", "R"],
//      "sort": [
//        ['REH', 'REC'],
//        ['RH', 'RC']
//      ],
//    },
//    {
//      "name": "TOT",
//      "key": ["ROU", "OU"],
//      "sort": [
//        ['ROUC', 'ROUH'],
//        ['OUC', 'OUH']
//      ],
//    },
  ],
  // 室内足球
  "OP_FU": [
    {
      "name": "1x2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
//    {
//      "name": "HCP",
//      "key": ["RE", "R"],
//      "sort": [
//        ['REH', 'REC'],
//        ['RH', 'RC']
//      ],
//    },
//    {
//      "name": "TOT",
//      "key": ["ROU", "OU"],
//      "sort": [
//        ['ROUC', 'ROUH'],
//        ['OUC', 'OUH']
//      ],
//    },
  ],

};
