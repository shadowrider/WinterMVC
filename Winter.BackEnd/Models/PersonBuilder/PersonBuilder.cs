using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Winter.BackEnd.Models.Domain;

namespace Winter.BackEnd.Models.PersonBuilder
{
    public abstract class PersonBuilder
    {
        protected Person person;

        public Person Person
        {
            get
            {
                return person;
            }
        }

        public abstract void BuildPersonDetails();
        public abstract void BuildUserRole();
        public abstract void BuildPersonType();
        public abstract void BuildPersonRelationShips();
    }
}
