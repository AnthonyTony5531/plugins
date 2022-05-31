
//列表專業版玩法展示
const dynamic laoniaoPlayTypeLang = {
  "FT": [
    {
      "name": "獨贏",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    {
      "name": "讓球",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "大小",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      "name": "角球大小",
      "key": ["rouConner", "ouConner"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      "name": "上半場獨贏",
      "key": ["HRM", "HM"],
      "sort": [
        ['HRMH', 'HRMC', 'HRMN'],
        ['HMH', 'HMC', 'HMN']
      ],
    },
    {
      "name": "上半場讓球",
      "key": ["HRE", "HR"],
      "sort": [
        ['HREH', 'HREC'],
        ['HRH', 'HRC']
      ]
    },
    {
      "name": "上半場大小",
      "key": ["HROU", "HOU"],
      "sort": [
        ['HROUC', 'HROUH'],
        ['HOUC', 'HOUH']
      ],
    },
  ],
  "BK": [
    //籃球
    {
      "name": "獨贏盤",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "讓球",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "總分大小",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    // {
    //   "name": "單雙",
    //   "key": ["REO", "EO"],
    //   "sort": [
    //     ['REOO', 'REOE'],
    //     ['EOO', 'EOE']
    //   ],
    // },
    //雷達
    // {
    //   "name": "獲勝者",
    //   "key": ["RM0", "M0"],
    //   "sort": [
    //     ['RM0H', 'RM0C'],
    //     ['M0H', 'M0C']
    //   ],
    // },
    // {
    //   "name": "總分",
    //   "key": ["ROU0", "OU0"],
    //   "sort": [
    //     ['ROU0H', 'ROU0C'],
    //     ['OU0H', 'OU0C']
    //   ],
    // },

    // {
    //   "name": "上半場獲勝",
    //   "key": ["RM1", "M1"],
    //   "sort": [
    //     ['RM1H', 'RM1C'],
    //     ['M1H', 'M1C']
    //   ],
    // },

    // {
    //   "name": "上半場讓分",
    //   "key": ["RE1", "R1"],
    //   "sort": [
    //     ['RE1H', 'RE1C'],
    //     ['R1H', 'R1C']
    //   ],
    // },

    // {
    //   "name": "上半場總分",
    //   "key": ["ROU1", "OU1"],
    //   "sort": [
    //     ['ROU1H', 'ROU1C'],
    //     ['OU1H', 'OU1C']
    //   ],
    // },
  ],
  "TN": [
    //網球
    {
      "name": "獨贏盤",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "讓局",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "總局大小",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
//    {
//      "name": "單雙",
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
      "name": "獨贏盤",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "讓球",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "總得分",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
//    {
//      "name": "上半場獲勝",
//      "key": ["HRM", "HM"],
//      "sort": [
//        ['HRMH', 'HRMC'],
//        ['HMH', 'HMC']
//      ],
//    },
//    {
//      "name": "上半場讓球",
//      "key": ["HRE", "HR"],
//      "sort": [
//        ['HREH', 'HREC'],
//        ['HRH', 'HRC']
//      ]
//    },
//    {
//      "name": "上半場總分",
//      "key": ["HROU", "HOU"],
//      "sort": [
//        ['HROUC', 'HROUH'],
//        ['HOUC', 'HOUH']
//      ],
//    }
  ],
  "OP_DJ": [
    //電競
    {
      //電競.電競沒有讓球說法，需要改成讓分
      "name": "獨贏盤",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "讓分",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "大小",
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
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "讓分",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "總分",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  "OP_RU": [
    //橄欖球
    {
      "name": "獨贏",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    {
      "name": "讓球",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "球隊得分",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
//    {
//      "name": "上半場獨贏",
//      "key": ["HRM", "HM"],
//      "sort": [
//        ['HRMH', 'HRMC', 'HRMN'],
//        ['HMH', 'HMC', 'HMN']
//      ],
//    },
//    {
//      "name": "上半場讓球",
//      "key": ["HRE", "HR"],
//      "sort": [
//        ['HREH', 'HREC'],
//        ['HRH', 'HRC']
//      ]
//    },
//    {
//      "name": "上半場球隊得分",
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
      "name": "獨贏",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    {
      "name": "讓球",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "大小",
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
      "name": "獨贏",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    {
      "name": "讓球",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "大小",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
//    {
//      "name": "上半場獨贏",
//      "key": ["HRM", "HM"],
//      "sort": [
//        ['HRMH', 'HRMC', 'HRMN'],
//        ['HMH', 'HMC', 'HMN']
//      ],
//    },
//    {
//      "name": "上半場讓球",
//      "key": ["HRE", "HR"],
//      "sort": [
//        ['HREH', 'HREC'],
//        ['HRH', 'HRC']
//      ]
//    },
//    {
//      "name": "上半場大小",
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
      "name": "獲勝",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "讓分",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "總分",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],

  //綜合格鬥
  "OP_MMA": [
    {
      //其他
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "回合總數大小",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      "name": "拳賽中完成所有回合",
      "key": ["RWFD", "WFD"],
      "sort": [
        ['RWFDH', 'RWFDC'],
        ['WFDH', 'WFDC']
      ],
    }
  ],

  //拳擊
  "OP_BO": [
    {
      //其他
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "回合總數大小",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      "name": "拳賽中完成所有回合",
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
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "讓分",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "總分",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],

  //飛鏢
  "OP_DR": [
    {
      //其他
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "賽盤讓分",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "賽盤總數",
      "key": ["RSOU", "SOU"],
      "sort": [
        ['RSOUH', 'RSOUC'],
        ['SOUH', 'SOUC']
      ],
    },
    {
      "name": "賽局總數",
      "key": ["RLOU", "LOU"],
      "sort": [
        ['RLOUH', 'RLOUC'],
        ['LOUH', 'LOUC']
      ],
    },
    {
      "name": "賽盤數單雙",
      "key": ["REO", "EO"],
      "sort": [
        ['REOO', 'REOE'],
        ['EOO', 'EOE']
      ],
    },
  ],

  //沙灘排球
  "OP_BV": [
    {
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "讓分",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "總分",
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
      "name": "獲勝者(包含超級輪階段)",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "首回合大小",
      "key": ["RSOU", "SOU"],
      "sort": [
        ['RSOUH', 'RSOUC'],
        ['SOUH', 'SOUC']
      ],
    },
    {
      "name": "首回合單雙",
      "key": ["RSEO", "SEO"],
      "sort": [
        ['REOO', 'REOE'],
        ['EOO', 'EOE']
      ],
    },
    {
      "name": "是否有超級輪",
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
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "讓分",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "總分",
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
      "name": "讓球",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "大小",
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
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "讓分",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "總分",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],

  //斯諾克
  "OP_SN": [
    {
      //其他
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "局數大小",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      "name": "局數單雙",
      "key": ["REO", "EO"],
      "sort": [
        ['REOO', 'REOE'],
        ['EOO', 'EOE']
      ],
    },
    {
      "name": "局數讓分",
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
      "name": "全場讓分",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "全場大小",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      //其他
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "上半場獲勝者",
      "key": ["HRM", "HM"],
      "sort": [
        ['HRMH', 'HRMC', 'HRMN'],
        ['HMH', 'HMC', 'HMN']
      ],
    },
    {
      "name": "上半場讓分",
      "key": ["HRE", "HR"],
      "sort": [
        ['HREH', 'HREC'],
        ['HRH', 'HRC']
      ],
    },
    {
      "name": "上半場大小",
      "key": ["HROU", "HOU"],
      "sort": [
        ['HROUH', 'HROUC'],
        ['HOUH', 'HOUC']
      ],
    }
  ],
  //高爾夫
  "OP_GF": [
    {
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "全場讓球",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "全場大小",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  //
  "OP_BA": [
    {
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "讓分",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "大小",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  //自行車
  "OP_CY": [
    {
      "name": "讓分",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "大小",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
    {
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
  ],
  //賽車
  "OP_AR": [
    {
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "讓分",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "總分",
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
      "name": "獨贏",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    {
      "name": "讓球",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "大小",
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
      "name": "讓球",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "大小",
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
      "name": "全場勝平負",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMN', 'RMC'],
        ['MH', 'MN', 'MC']
      ],
    },
    // {
    //   "name":"全場讓球",
    //   "key":["RE","R"],
    //   "sort" : [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // },
    // {
    //   "name":"全場大小",
    //   "key":["ROU","OU"],
    //   "sort" : [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // }
  ],
  "BK": [
    // {
    //   "name":"總分",
    //   "key":["ROU","OU"],
    //   "sort" : [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name":"單雙",
    //   "key":["REO","EO"],
    //   "sort" : [
    //     ['REOO', 'REOE'],
    //     ['EOO', 'EOE']
    //   ],
    // },
    {
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },

    //雷達
    {
      "name": "獲勝者",
      "key": ["RM0", "M0"],
      "sort": [
        ['RM0H', 'RM0C'],
        ['M0H', 'M0C']
      ],
    },
    // {
    //   "name":"總分",
    //   "key":["ROU0","OU0"],
    //   "sort" : [
    //     ['ROU0H', 'ROU0C'],
    //     ['OU0H', 'OU0C']
    //   ],
    // },

    // {
    //   "name":"上半場獲勝",
    //   "key":["RM1","M1"],
    //   "sort" : [
    //     ['RM1H', 'RM1C'],
    //     ['M1H', 'M1C']
    //   ],
    // },
  ],
  "TN": [
    {
      //網球
      "name": "獲勝",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "局數單雙",
    //   "key": ["EO", "EO"],
    //   "sort": [
    //     ['EOO', 'EOE'],
    //     ['EOO', 'EOE']
    //   ],
    // },
    {
      "name": "獲勝者",
      "key": ["RM0", "M0"],
      "sort": [
        ['RM0H', 'RM0C'],
        ['M0H', 'M0C']
      ],
    },
    // {
    //   "name": "總分",
    //   "key": ["ROU0", "OU0"],
    //   "sort": [
    //     ['ROU0H', 'ROU0C'],
    //     ['OU0H', 'OU0C']
    //   ],
    // },

    // {
    //   "name": "上半場讓分",
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
      "name": "獲勝者",
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
      //電競
      "name": "獲勝",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "總局數",
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
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "單雙",
    //   "key": ["REO", "EO"],
    //   "sort": [
    //     ['REOO', 'REOE'],
    //     ['EOO', 'EOE']
    //   ],
    // }
  ],
  "OP_RU": [
    //橄欖球
    {
      "name": "全場1X2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMN', 'RMC'],
        ['MH', 'MN', 'MC']
      ],
    },
    // {
    //   "name": "全場大小",
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
      "name": "全場1X2",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
    // {
    //   "name": "全場單雙",
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
      "name": "全場1X2",
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
    //   "name": "全場單雙",
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
      "name": "獲勝",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "讓分",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // },
    // {
    //   "name": "總分",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // }
  ],

  //綜合格鬥
  "OP_MMA": [
    {
      //其他
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "回合總數大小",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "拳賽中完成所有回合",
    //   "key": ["RWFD", "WFD"],
    //   "sort": [
    //     ['RWFDH', 'RWFDC'],
    //     ['WFDH', 'WFDC']
    //   ],
    // }
  ],

  //拳擊
  "OP_BO": [
    {
      //其他
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "回合總數大小",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "拳賽中完成所有回合",
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
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "總分",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC' 'OUH']
    //   ],
    // },
    // {
    //   "name": "讓分",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // }
  ],

  //飛鏢
  "OP_DR": [
    {
      //其他
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "賽盤讓分",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // },
    // {
    //   "name": "賽盤總數",
    //   "key": ["RSOU", "SOU"],
    //   "sort": [
    //     ['RSOUH', 'RSOUC'],
    //     ['SOUH', 'SOUC']
    //   ],
    // },
  ],

  //沙灘排球
  "OP_BV": [
    {
      //其他
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "總分",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "讓分",
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
      "name": "獲勝者(包含超級輪階段)",
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
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "總分",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "讓分",
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
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "總分",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "讓分",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // }
  ],

  //斯諾克
  "OP_SN": [
    {
      //其他
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "局數大小",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "局數單雙",
    //   "key": ["REO", "EO"],
    //   "sort": [
    //     ['REOO', 'REOE'],
    //     ['EOO', 'EOE']
    //   ],
    // },
    // {
    //   "name": "局數讓分",
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
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    // {
    //   "name": "全場大小",
    //   "key": ["ROU", "OU"],
    //   "sort": [
    //     ['ROUC', 'ROUH'],
    //     ['OUC', 'OUH']
    //   ],
    // },
    // {
    //   "name": "全場讓分",
    //   "key": ["RE", "R"],
    //   "sort": [
    //     ['REH', 'REC'],
    //     ['RH', 'RC']
    //   ],
    // },
  ],
  //高爾夫
  "OP_GF": [
//    {
//      "name": "全場讓球",
//      "key": ["RE", "R"],
//      "sort": [
//        ['REH', 'REC'],
//        ['RH', 'RC']
//      ],
//    },
//    {
//      "name": "全場大小",
//      "key": ["ROU", "OU"],
//      "sort": [
//        ['ROUC', 'ROUH'],
//        ['OUC', 'OUH']
//      ],
//    },
    {
      "name": "獲勝者",
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
      "name": "獲勝者",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC'],
        ['MH', 'MC']
      ],
    },
    {
      "name": "讓分",
      "key": ["RE", "R"],
      "sort": [
        ['REH', 'REC'],
        ['RH', 'RC']
      ],
    },
    {
      "name": "大小",
      "key": ["ROU", "OU"],
      "sort": [
        ['ROUC', 'ROUH'],
        ['OUC', 'OUH']
      ],
    },
  ],
  //自行車
  "OP_CY": [
//    {
//      "name": "讓分",
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
      "name": "獲勝者",
      "key": ["M"],
      "sort": [

        ['MH', 'MC']
      ],
    },
  ],
  //賽車
  "OP_AR": [
//    {
//      "name": "讓分",
//      "key": ["RE", "R"],
//      "sort": [
//        ['REH', 'REC'],
//        ['RH', 'RC']
//      ],
//    },
//    {
//      "name": "總分",
//      "key": ["ROU", "OU"],
//      "sort": [
//        ['ROUC', 'ROUH'],
//        ['OUC', 'OUH']
//      ],
//    },
    {
      "name": "獲勝者",
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
      "name": "獨贏",
      "key": ["RM", "M"],
      "sort": [
        ['RMH', 'RMC', 'RMN'],
        ['MH', 'MC', 'MN']
      ],
    },
//    {
//      "name": "讓球",
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
//      "name": "讓球",
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
  ],

};
