using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CandidateSearchFilterInfo
/// </summary>
public class CandidateSearchFilterInfo
{
    public int SearchId { get; set; }

    public int FilterType { get; set; }

    public string FilterText { get; set; }

    public string FilterValue { get; set; }

    public bool IsInclude { get; set; }
}