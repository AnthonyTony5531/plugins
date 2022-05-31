const dynamic guessingLaoniaoPlayTypeLang = {
  "FT":[
  {
    "name":"1x2",
    "key":"M",
    "sort" : {
     'MH': 'Home',
     'MN': 'Draw',
     'MC': 'Away',
    }
  },
  {
    "name" : "Point Spread 1x2",
    "key" : "W3",
    "sort" : {
     'W3H': 'Home',
     'W3N': 'Draw',
     'W3C': 'Away',
    }
  },
  {
    "name":"Score",
    "key":"PD",
    "sort_list" : { //列表的排序
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
     'OVH': 'other',
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
    "name" : "Total Score",
    "key" : "T",
    "sort" :{
     'T01': '0~1',
     'T23': '2~3',
     'T46': '4~6',
     'OVER': '7up'
    }
  },
  {
    "name" : "Half/ Full Court Result",
    "key" : "F",
    "sort" : {
     'FHH': 'Home/Home',
     'FHN': 'Home/Draw',
     'FHC': 'Home/Away',
     'FNH': 'Draw/Home',
     'FNN': 'Draw/Draw',
     'FNC': 'Draw/Away',
     'FCH': 'Away/Home',
     'FCN': 'Away/Draw',
     'FCC': 'Away/Away',
     // 'FHH': 'Home/Home',
     // 'FHN': 'Home/Draw',
     // 'FHC': 'Home/Away',
     // 'FNH': 'Draw/Home',
     // 'FNN': 'Draw/Draw',
     // 'FNC': 'Draw/Away',
     // 'FCH': 'Away/Home',
     // 'FCN': 'Away/Draw',
     // 'FCC': 'Away/Away',
    }
  },
  ],
  "BK":[
   {
     "name":"HomeAway",
     "key":"M",
     "sort" : {
      'MH': 'Home',
      'MC': 'Away',
     }
   },
   {
     "name" : "Over/ Under",
     "key" : "OU",
     "sort" : {
      'OUC': 'Over {ratio}',
      'OUH': 'Under {ratio}',
     }
   },{
    "name":"Point Spread Home Away",
    "key":"R",
    "sort" : {
     'RH': 'HomeHome {ratio}',
     'RC': 'AwayHome {ratio}',
    }
   },
  ]
};
