using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CPSeed
{
   public class recruitments
    {
        public int RecruitmentID { get; set; }
        public string Title { get; set; }
        public string position { get; set; }
        public string contents { get; set; }

        public DateTime? CreateDate { get; set; }
        public int Quantity { get; set; }
        public string workplace { get; set; }
        public DateTime? ExpirationDate { get; set; }
    }
}