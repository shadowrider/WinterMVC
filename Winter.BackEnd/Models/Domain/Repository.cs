using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace Winter.BackEnd.Models.Domain
{
    public static class Repository
    {
        [ThreadStatic]
        private static WinterDataContext _DataContext;

        public static WinterDataContext CurrentDataContext
        {
            get
            {
                if (_DataContext == null)
                {
                    _DataContext = CreateNewDataContext();
                }

                return _DataContext;
            }
        }

        public static void UpdateCurrentDataContext()
        {
            _DataContext = CreateNewDataContext();
        }

        public static WinterDataContext CreateNewDataContext()
        {
            WinterDataContext context = new WinterDataContext(ConfigurationManager.ConnectionStrings["WinterConnectionString"].ConnectionString);

            return context;
        }
    }
}
