using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Winter.BackEnd.Models.PersonBuilder;
using System.Text;

namespace Winter.BackEnd.Models.Domain
{
    public partial class Person
    {

        #region fields

        private string userRole;
        private aspnet_User user;

        #endregion

        #region properties

        public aspnet_User User
        {
            get
            {
                return user ?? this.aspnet_Users.SingleOrDefault(u => u.PersonID == ID);
            }
        }

        public string UserName
        {
            get
            {
                return this.aspnet_Users.SingleOrDefault(u => u.PersonID == ID).UserName;
            }
        }
        public string Email { get; set; }
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }
        public string UserRole
        {
            get
            {

                return userRole != null ? "Anonymous" : userRole;//Roles.ToString();
            }
            set
            {
                userRole = value;
            }
        }
        #endregion

        public void Construct(PersonBuilder.PersonBuilder personBuilder)
        {
            personBuilder.BuildPersonDetails();
            personBuilder.BuildUserRole();
            personBuilder.BuildPersonType();
            personBuilder.BuildPersonRelationShips();
        }

    }
}
