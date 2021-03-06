import 'package:fast_ai/config/play_type_local.dart';
dynamic playTypeConfig = {
 'wf': playTypeLocal,
 'guess': {
  'FT_M': '1x2',
  'FT_R': "Point Spread",
  'FT_PD': 'Exact Score',
  'FT_T': 'Total Score',
  'FT_F': 'Half/ Full Court Result',
  'FT_RF': 'In-Play Half/ Full Court Result',
  'BK_M': '1x2',
  'BK_RM': 'In-Play 1x2',
  'BK_R': 'Point Spread',
  'BK_RE': 'In-Play Point Spread',
  'BK_OU': 'Over/ Under',
  'BK_ROU': 'In-Play Over/ Under',
  'BK_EO': 'Odd/ Even',
  'BK_REO': 'In-Play Odd/ Even',
  'TN_M': '1x2',
  'TN_RM': 'In-Play 1x2',
  'TN_R': 'Game Spread',
  'TN_RE': 'In-Play Game Spread',
  'TN_OU': 'Game Total',
  'TN_ROU': 'In-Play Game Total',
  'TN_EO': 'Game Total',
  'TN_REO': 'In-Play Game Total',
  'FT_W3': 'Full Court 1x2 Point Spread',
 },

 'rt': {
  'M_MH': 'Home',
  'M_MC': 'Away',
  'M_MN': 'Draw',
  'W3_W3H': 'Home',
  'W3_W3C': 'Away',
  'W3_W3N': 'Draw',
  'RM_RMH': 'Home',
  'RM_RMC': 'Away',
  'RM_RMN': 'Draw',
  'RE_REH': 'Home',
  'RE_REC': 'Away',
  'R_RH': 'Home',
  'R_RC': 'Away',
  'ROU_ROUC': 'Over',
  'ROU_ROUH': 'Under',
  'OU_OUC': 'Over',
  'OU_OUH': 'Under',
  'EO_EOO': 'Odd',
  'EO_EOE': 'Even',
  'REO_EOO': 'Odd',
  'REO_EOE': 'Even',
  'T_T01': '0~1',
  'T_T23': '2~3',
  'T_T46': '4~6',
  'T_OVER': '7up',
  'F_FHH': 'Home/Home',
  'F_FHN': 'Home/Draw',
  'F_FHC': 'Home/Away',
  'F_FNH': 'Draw/Home',
  'F_FNN': 'Draw/Draw',
  'F_FNC': 'Draw/Away',
  'F_FCH': 'Away/Home',
  'F_FCN': 'Away/Draw',
  'F_FCC': 'Away/Away',
  'FT_M_MH': 'Home',
  'FT_M_MC': 'Away',
  'FT_M_MN': 'Draw',
  'FT_W3_W3H': 'Home',
  'FT_W3_W3C': 'Away',
  'FT_W3_W3N': 'Draw',
  'FT_RM_RMH': 'Home',
  'FT_RM_RMC': 'Away',
  'FT_RM_RMN': 'Draw',
  'FT_RE_REH': 'Home',
  'FT_RE_REC': 'Away',
  'FT_R_RH': 'Home',
  'FT_R_RC': 'Away',
  'FT_ROU_ROUC': 'Over',
  'FT_ROU_ROUH': 'Under',
  'FT_OU_OUC': 'Over',
  'FT_OU_OUH': 'Under',
  'FT_HRM_HRMH': 'Home',
  'FT_HRM_HRMC': 'Away',
  'FT_HRM_HRMN': 'Draw',
  'FT_HRE_HREH': 'Home',
  'FT_HRE_HREC': 'Away',
  'FT_HROU_HROUC': 'Over',
  'FT_HROU_HROUH': 'Under',
  'FT_HR_HRH': 'Home',
  'FT_HR_HRC': 'Away',
  'FT_HOU_HOUC': 'Over',
  'FT_HOU_HOUH': 'Under',
  'FT_HM_HMH': 'Home',
  'FT_HM_HMN': 'Draw',
  'FT_HM_HMC': 'Away',
  'FT_EO_EOO': 'Odd',
  'FT_EO_EOE': 'Even',
  'FT_F_FHH': 'Home/ Home',
  'FT_F_FHN': 'Home/ Draw',
  'FT_F_FHC': 'Home/ Away',
  'FT_F_FNH': 'Draw/ Home',
  'FT_F_FNN': 'Draw/ Draw',
  'FT_F_FNC': 'Draw/ Away',
  'FT_F_FCH': 'Away/ Home',
  'FT_F_FCN': 'Away/ Draw',
  'FT_F_FCC': 'Away/ Away',
  'FT_PD_H1C0': '1:0',
  'FT_PD_H2C0': '2:0',
  'FT_PD_H2C1': '2:1',
  'FT_PD_H2C2': '2:2',
  'FT_PD_H3C0': '3:0',
  'FT_PD_H3C1': '3:1',
  'FT_PD_H3C2': '3:2',
  'FT_PD_H4C0': '4:0',
  'FT_PD_H4C1': '4:1',
  'FT_PD_H4C2': '4:2',
  'FT_PD_H4C3': '4:3',
  'FT_PD_H0C0': '0:0',
  'FT_PD_H1C1': '1:1',
  'FT_PD_H3C3': '3:3',
  'FT_PD_H4C4': '4:4',
  'FT_PD_OVH': 'Others',
  'FT_PD_H0C1': '0:1',
  'FT_PD_H0C2': '0:2',
  'FT_PD_H1C2': '1:2',
  'FT_PD_H0C3': '0:3',
  'FT_PD_H1C3': '1:3',
  'FT_PD_H2C3': '2:3',
  'FT_PD_H0C4': '0:4',
  'FT_PD_H1C4': '1:4',
  'FT_PD_H2C4': '2:4',
  'FT_PD_H3C4': '3:4',
  'BK_M_MH': 'Home',
  'BK_M_MC': 'Away',
  'BK_R_RH': 'Home Team',
  'BK_R_RC': 'Away Team',
  'BK_OU_OUH': 'Over',
  'BK_OU_OUC': 'Under'
 },

};
