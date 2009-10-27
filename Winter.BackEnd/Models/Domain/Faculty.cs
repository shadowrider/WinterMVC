using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Winter.BackEnd.Models.Domain
{
    public partial class Faculty : ICompositeTree
    {

        #region ICategory Members

        public int CategoryID
        {
            get { return ID + Repository.CurrentDataContext.Universities.Count(); }
        }

        public string CategoryName
        {
            get { return Name; }
        }

        public int? ParentCategoryID
        {
            get { return this.UniversityID; }
        }

        public IList<ICompositeTree> Categories
        {
            get { return Departments.ToArray(); }
        }

        #endregion
    }
}
