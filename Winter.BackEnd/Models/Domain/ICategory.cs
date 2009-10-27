using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Winter.BackEnd.Models.Domain
{
    public interface ICompositeTree
    {
        int CategoryID
        {
            get;
        }
        string CategoryName
        {
            get;
        }
        int? ParentCategoryID
        {
            get;
        }
        IList<ICompositeTree> Categories
        {
            get;
        }
    }
}
