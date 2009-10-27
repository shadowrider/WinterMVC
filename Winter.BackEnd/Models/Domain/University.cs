using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Winter.BackEnd.Models.Domain
{
    public partial class University : ICompositeTree
    {

        #region ICategory Members

        public int CategoryID
        {
            get { return ID; }
        }

        public string CategoryName
        {
            get { return Name; }
        }

        public int? ParentCategoryID
        {
            get { return null; }
        }

        public IList<ICompositeTree> Categories
        {
            get { return Faculties.ToArray(); }
        }

        #endregion
    }
}
