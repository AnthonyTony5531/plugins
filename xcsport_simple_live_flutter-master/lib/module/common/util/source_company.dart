
class SourceCompanyUtil{
  static SourceCompany getSCFromGidm(String gidm) {
    if (gidm?.toLowerCase()?.startsWith('ib_') ?? false) {
      return SourceCompany.IBO;
    } else if (gidm?.toLowerCase()?.startsWith('sd_') ?? false) {
      return SourceCompany.SD;
    } else if (gidm?.toLowerCase()?.startsWith('ic_') ?? false) {
      return SourceCompany.BTI;
    } else {
      return SourceCompany.IBO;
    }
  }
}

enum SourceCompany { SD, IBO, BTI }