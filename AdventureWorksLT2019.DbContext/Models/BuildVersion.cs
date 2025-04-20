﻿using System;
using System.Collections.Generic;

namespace AdventureWorksLT2019.MSSqlDbContext.Models;

/// <summary>
/// Current version number of the AdventureWorksLT 2012 sample database. 
/// </summary>
public partial class BuildVersion
{
    /// <summary>
    /// Primary key for BuildVersion records.
    /// </summary>
    public byte SystemInformationID { get; set; }

    /// <summary>
    /// Version number of the database in 9.yy.mm.dd.00 format.
    /// </summary>
    public string Database_Version { get; set; } = null!;

    /// <summary>
    /// Date and time the record was last updated.
    /// </summary>
    public DateTime VersionDate { get; set; }

    /// <summary>
    /// Date and time the record was last updated.
    /// </summary>
    public DateTime ModifiedDate { get; set; }
}
