const dynamic guessingLaoniaoPlayTypeLang = {
    "FT":[
    {
        "name":"胜平负",
        "key":"M",
        "sort" : {
          'MH': '胜',
          'MN': '平',
          'MC': '负',
        }
    },
    {
        "name" : "让球胜平负",
        "key" : "W3",
        "sort" : {
          'W3H': '胜',
          'W3N': '平',
          'W3C': '负',
        }
    },
    {
        "name":"比分",
        "key":"PD",
        "sort_list" : {  //列表的排序
          'H1C0': '1:0',
          'H2C0': '2:0',
          'H2C1': '2:1',
          'H0C0': '0:0',
          'H1C1': '1:1',
          'H2C2': '2:2',
          'H0C1': '0:1',
          'H0C2': '0:2',
          'H1C2': '1:2',
        },
        "sort" : {
          'H1C0': '1:0',
          'H2C0': '2:0',
          'H2C1': '2:1',
          'H3C0': '3:0',
          'H3C1': '3:1',
          'H3C2': '3:2',
          'H4C0': '4:0',
          'H4C1': '4:1',
          'H4C2': '4:2',
          'H4C3': '4:3',
          'H0C0': '0:0',
          'H1C1': '1:1',
          'H2C2': '2:2',
          'H3C3': '3:3',
          'H4C4': '4:4',
          'OVH': '其它',
          'H0C1': '0:1',
          'H0C2': '0:2',
          'H1C2': '1:2',
          'H0C3': '0:3',
          'H1C3': '1:3',
          'H2C3': '2:3',
          'H0C4': '0:4',
          'H1C4': '1:4',
          'H2C4': '2:4',
          'H3C4': '3:4',
        }
    },{
        "name" : "总进球数",
        "key"  : "T",
        "sort" :{
          'T01': '0~1球',
          'T23': '2~3球',
          'T46': '4~6球',
          'OVER': '7+球'
        }
    },
    {
        "name" : "半全场",
        "key" : "F",
        "sort" : {
          'FHH': '胜/胜',
          'FHN': '胜/平',
          'FHC': '胜/负',
          'FNH': '平/胜',
          'FNN': '平/平',
          'FNC': '平/负',
          'FCH': '负/胜',
          'FCN': '负/平',
          'FCC': '负/负',
          // 'FHH': '主/主',
          // 'FHN': '主/和',
          // 'FHC': '主/客',
          // 'FNH': '和/主',
          // 'FNN': '和/和',
          // 'FNC': '和/客',
          // 'FCH': '客/主',
          // 'FCN': '客/和',
          // 'FCC': '客/客',
        }
    },
    ],
    "BK":[
      {
          "name":"胜负",
          "key":"M",
          "sort" : {
            'MH': '胜',
            'MC': '负',
          }
      },
      {
          "name" : "大小分",
          "key" : "OU",
          "sort" : {
            'OUC': '大 {ratio}',
            'OUH': '小 {ratio}',
          }
      },{
        "name":"让分胜负",
        "key":"R",
        "sort" : {
          'RH': '主胜 {ratio}',
          'RC': '客胜 {ratio}',
        }
      },
    ]
};

