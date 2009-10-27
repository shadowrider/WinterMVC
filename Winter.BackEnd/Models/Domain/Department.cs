using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Winter.BackEnd.Models.Domain
{
    public partial class Department : ICompositeTree
    {

        #region ICategory Members

        public int CategoryID
        {
            get
            {
                return ID + Repository.CurrentDataContext.Universities.Last().ID +
                    Repository.CurrentDataContext.Faculties.Last().ID;
            }
        }

        public string CategoryName
        {
            get { return Name; }
        }

        public int? ParentCategoryID
        {
            get { return Faculty.CategoryID; }
        }

        public IList<ICompositeTree> Categories
        {
            get { return null; }
        }

        #endregion
    }
}
