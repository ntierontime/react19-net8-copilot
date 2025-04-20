using System;
using System.Collections.Generic;

namespace AdventureWorksLT2019.DbContext.Models;

public partial class vGetAllCategory
{
    public string ParentProductCategoryName { get; set; } = null!;

    public string? ProductCategoryName { get; set; }

    public int? ProductCategoryID { get; set; }
}
