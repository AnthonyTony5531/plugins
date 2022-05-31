//排球
const dynamic op_vbRadioTypes = {
  "M": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "CS": {
    "col": 2,
    "text": {
      "CS3C2": "3:2",
      "CS2C3": "2:3",
      "CS1C3": "1:3",
      "CS0C3": "0:3",
      "CS3C0": "3:0",
      "CS3C1": "3:1",
      "CS4C0": "4:0",
      "CS4C1": "4:1",
      "CS4C2": "4:2",
      "CS4C3": "4:3",
      "CS3C4": "3:4",
      "CS2C4": "2:4",
      "CS1C4": "1:4",
      "CS0C4": "0:4"
    },
    "sort": [
      "CS3C2",
      "CS2C3",
      "CS1C3",
      "CS0C3",
      "CS3C0",
      "CS3C1",
      "CS4C0",
      "CS4C1",
      "CS4C2",
      "CS4C3",
      "CS3C4",
      "CS2C4",
      "CS1C4",
      "CS0C4"
    ]
  },
  "RS": {
    "col": 2,
    "text": {"RSH": "{homeTeam} {ratio}", "RSC": "{awayTeam} {ratio}"},
    "sort": ["RSH", "RSC"]
  },
  
  "SMN": {
    "col": 2,
    "text": {"SMNH": "{homeTeam}", "SMNC": "{awayTeam}"},
    "sort": ["SMNH", "SMNC"]
  },
  "SR": {
    "col": 2,
    "text": {"SRH": "{homeTeam} {ratio}", "SRC": "{awayTeam} {ratio}"},
    "sort": ["SRH", "SRC"]
  },
  "SOU": {
    "col": 2,
    "text": {"SOUO": "สูง {ratio}", "SOUU": "ต่ำ {ratio}"},
    "sort": ["SOUO", "SOUU"]
  },
  "SEO": {
    "col": 2,
    "text": {"SEOO": "คี่", "SEOE": "คู่"},
    "sort": ["SEOO", "SEOE"]
  },
  "SRP": {
    "col": 2,
    "text": {"SRPH": "{homeTeam}", "SRPC": "{awayTeam}"},
    "sort": ["SRPH", "SRPC"]
  },
  "M1": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "R1": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OU1": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "M2": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "R2": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OU2": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "M3": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "R3": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OU3": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "M4": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "R4": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OU4": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "M5": {
    "col": 2,
    "text": {"MH": "{homeTeam}", "MC": "{awayTeam}"},
    "sort": ["MH", "MC"]
  },
  "R5": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "OU5": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "PR": {
    "col": 2,
    "text": {"RH": "{homeTeam} {ratio}", "RC": "{awayTeam} {ratio}"},
    "sort": ["RH", "RC"]
  },
  "POU": {
    "col": 2,
    "text": {"OUC": "สูง {ratio}", "OUH": "ต่ำ {ratio}"},
    "sort": ["OUC", "OUH"]
  },
  "RM": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  
  "RM1": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE1": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU1": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "REO1": {
    "col": 2,
    "text": {"REOO": "คี่", "REOE": "คู่"},
    "sort": ["REOO", "REOE"]
  },
  "RM2": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE2": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU2": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "REO2": {
    "col": 2,
    "text": {"REOO": "คี่", "REOE": "คู่"},
    "sort": ["REOO", "REOE"]
  },
  "RM3": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE3": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU3": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "REO3": {
    "col": 2,
    "text": {"REOO": "คี่", "REOE": "คู่"},
    "sort": ["REOO", "REOE"]
  },
  "RM4": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE4": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU4": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "REO4": {
    "col": 2,
    "text": {"REOO": "คี่", "REOE": "คู่"},
    "sort": ["REOO", "REOE"]
  },
  "RM5": {
    "col": 2,
    "text": {"RMH": "{homeTeam}", "RMC": "{awayTeam}"},
    "sort": ["RMH", "RMC"]
  },
  "RE5": {
    "col": 2,
    "text": {"REH": "{homeTeam} {ratio}", "REC": "{awayTeam} {ratio}"},
    "sort": ["REH", "REC"]
  },
  "ROU5": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "REO5": {
    "col": 2,
    "text": {"REOO": "คี่", "REOE": "คู่"},
    "sort": ["REOO", "REOE"]
  },
  "RPOU": {
    "col": 2,
    "text": {"ROUC": "สูง {ratio}", "ROUH": "ต่ำ {ratio}"},
    "sort": ["ROUC", "ROUH"]
  },
  "AHPT": {
    "col": 2,
    "text": {"AHPTH": "{homeTeam} {ratio}", "AHPTC": "{awayTeam} {ratio}"},
    "sort": ["AHPTH", "AHPTC"]
  },
  "OUPT": {
    "col": 2,
    "text": {"OUPTO": "สูง {ratio}", "OUPTU": "ต่ำ {ratio}"},
    "sort": ["OUPTO", "OUPTU"]
  },
  "ROUPT": {
    "col": 2,
    "text": {"ROUPTO": "สูง {ratio}", "ROUPTU": "ต่ำ {ratio}"},
    "sort": ["ROUPTO", "ROUPTU"]
  },
  "EO1": {
    "col": 2,
    "text": {"EOO": "คี่", "EOE": "คู่"},
    "sort": ["EOO", "EOE"]
  },
  "EO2": {
    "col": 2,
    "text": {"EOO": "คี่", "EOE": "คู่"},
    "sort": ["EOO", "EOE"]
  },
  "EO3": {
    "col": 2,
    "text": {"EOO": "คี่", "EOE": "คู่"},
    "sort": ["EOO", "EOE"]
  },
  "EO4": {
    "col": 2,
    "text": {"EOO": "คี่", "EOE": "คู่"},
    "sort": ["EOO", "EOE"]
  },
  "EO5": {
    "col": 2,
    "text": {"EOO": "คี่", "EOE": "คู่"},
    "sort": ["EOO", "EOE"]
  },
};
