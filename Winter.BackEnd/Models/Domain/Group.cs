using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Winter.BackEnd.Models.Domain
{
    public partial class Group : ICompositeTree
    {
        #region ICompositeTree Members

        public int CategoryID
        {
            get { return Repository.CurrentDataContext.Departments.LastOrDefault().CategoryID; }
        }

        public int? ParentCategoryID
        {
            get { return Department.CategoryID; }
        }

        #endregion

        #region ICompositeTree Members


        public IList<ICompositeTree> Categories
        {
            get { return new List<ICompositeTree>(); }
        }

        #endregion
    }
}
