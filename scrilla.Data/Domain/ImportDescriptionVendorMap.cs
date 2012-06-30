﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace scrilla.Data.Domain
{
	public class ImportDescriptionVendorMap
	{
		public int Id { get; set; }
		public string Description { get; set; }
		public int VendorId { get; set; }

		public virtual Vendor Vendor { get; set; }
	}
}
