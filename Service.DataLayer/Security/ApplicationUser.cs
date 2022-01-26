using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.DataLayer.Security
{
    public class ApplicationUser : IdentityUser
    {
        public override string UserName { get => base.UserName; set => base.UserName = value; }
        public DateTime CreatedDateTime  { get; set; }
        public DateTime UpdatedDateTime { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public bool? FirstLogin { get; set; }
        public bool? MaxMonthLock { get; set; }
        public bool? MonthLockStatus { get; set; }

        //public string Email { get; set; }
    }
}
