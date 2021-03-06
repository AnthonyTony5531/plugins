import 'package:fast_ai/config/play_type_local.dart';
dynamic playTypeConfig = {
  'wf': playTypeLocal,
  'guess': {
    'FT_M': '勝平負',
    'FT_R': "讓球",
    'FT_PD': '比分',
    'FT_T': '總進球',
    'FT_F': '半全場',
    'FT_RF': '半場/全場',
    'BK_M': '勝負',
    'BK_RM': '獲勝者',
    'BK_R': '讓分勝負',
    'BK_RE': '讓分',
    'BK_OU': '大小分',
    'BK_ROU': '總分',
    'BK_EO': '單雙',
    'BK_REO': '單雙',
    'TN_M': '獲勝者',
    'TN_RM': '獲勝者',
    'TN_R': '賽局讓分',
    'TN_RE': '賽局讓分',
    'TN_OU': '總局數',
    'TN_ROU': '總局數',
    'TN_EO': '局數單雙',
    'TN_REO': '局數單雙',
    'FT_W3': '讓球勝平負',
  },

  'rt': {
    'M_MH': '勝',
    'M_MC': '負',
    'M_MN': '平',
    'W3_W3H': '勝',
    'W3_W3C': '負',
    'W3_W3N': '平',
    'RM_RMH': '主隊',
    'RM_RMC': '客隊',
    'RM_RMN': '和局',
    'RE_REH': '主隊',
    'RE_REC': '客隊',
    'R_RH': '主隊',
    'R_RC': '客隊',
    'ROU_ROUC': '大',
    'ROU_ROUH': '小',
    'OU_OUC': '大',
    'OU_OUH': '小',
    'EO_EOO': '單',
    'EO_EOE': '雙',
    'REO_EOO': '單',
    'REO_EOE': '雙',
    'T_T01': '0~1球',
    'T_T23': '2~3球',
    'T_T46': '4~6球',
    'T_OVER': '7+球',
    'F_FHH': '勝/勝',
    'F_FHN': '勝/平',
    'F_FHC': '勝/負',
    'F_FNH': '平/勝',
    'F_FNN': '平/平',
    'F_FNC': '平/負',
    'F_FCH': '負/勝',
    'F_FCN': '負/平',
    'F_FCC': '負/負',
    'FT_M_MH': '勝',
    'FT_M_MC': '負',
    'FT_M_MN': '平',
    'FT_W3_W3H': '勝',
    'FT_W3_W3C': '負',
    'FT_W3_W3N': '平',
    'FT_RM_RMH': '主隊',
    'FT_RM_RMC': '客隊',
    'FT_RM_RMN': '和局',
    'FT_RE_REH': '主隊',
    'FT_RE_REC': '客隊',
    'FT_R_RH': '主隊',
    'FT_R_RC': '客隊',
    'FT_ROU_ROUC': '大',
    'FT_ROU_ROUH': '小',
    'FT_OU_OUC': '大',
    'FT_OU_OUH': '小',
    'FT_HRM_HRMH': '主隊',
    'FT_HRM_HRMC': '客隊',
    'FT_HRM_HRMN': '和局',
    'FT_HRE_HREH': '主隊',
    'FT_HRE_HREC': '客隊',
    'FT_HROU_HROUC': '大',
    'FT_HROU_HROUH': '小',
    'FT_HR_HRH': '主隊',
    'FT_HR_HRC': '客隊',
    'FT_HOU_HOUC': '大',
    'FT_HOU_HOUH': '小',
    'FT_HM_HMH': '主隊',
    'FT_HM_HMN': '和局',
    'FT_HM_HMC': '客隊',
    'FT_EO_EOO': '單',
    'FT_EO_EOE': '雙',
    'FT_F_FHH': '主/主',
    'FT_F_FHN': '主/和',
    'FT_F_FHC': '主/客',
    'FT_F_FNH': '和/主',
    'FT_F_FNN': '和/和',
    'FT_F_FNC': '和/客',
    'FT_F_FCH': '客/主',
    'FT_F_FCN': '客/和',
    'FT_F_FCC': '客/客',
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
    'FT_PD_OVH': '其它',
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
    'BK_M_MH': '勝',
    'BK_M_MC': '負',
    'BK_R_RH': '主勝',
    'BK_R_RC': '客勝',
    'BK_OU_OUH': '大',
    'BK_OU_OUC': '小'
  },

};
