﻿using System;

namespace YG_Business
{
    public class Member
    {
        public int MemberId { get; set; }
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string EmailId { get; set; }

        public string PhoneNo { get; set; }

        public string Password { get; set; }

        public bool isActive { get; set; }

        public DateTime CreatedOn { get; set; }
    }

    public class Login
    {
        public string EmailId { get; set; }
        public string Password { get; set; }
    }
}