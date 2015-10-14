using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YG_MVC.Models
{
    public class EmailFriendModel
    {
        public string JobTitle { get; set; }

        public string YourEmail { get; set; }

        public string FriendEmail { get; set; }

        public int JobId { get; set; }

        public string JobReference { get; set; }
    }
}