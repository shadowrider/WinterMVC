using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Winter.BackEnd.Models.Domain;
using System.Web.Mvc;
using System.Web.UI;
using System.IO;

namespace System.Web.Mvc
{
    public static class TreeRenderHtmlHelper
    {
        public delegate void Func<T>(T value);

        public static void ForEach<T>(this IEnumerable<T> values, Func<T> function)
        {
            foreach (T value in values)
            {
                function(value);
            }
        }

        public static string RenderTree(

            this HtmlHelper htmlHelper,

            IEnumerable<ICompositeTree> rootLocations,

            Func<ICompositeTree, string> locationRenderer)
        {

            return new TreeRenderer(rootLocations, locationRenderer).Render();

        }
        public class TreeRenderer 
        {

            private readonly Func<ICompositeTree, string> locationRenderer;

            private readonly IEnumerable<ICompositeTree> rootLocations;

            private HtmlTextWriter writer;

            public TreeRenderer(

                IEnumerable<ICompositeTree> rootLocations,

                Func<ICompositeTree, string> locationRenderer)
            {

                this.rootLocations = rootLocations;

                this.locationRenderer = locationRenderer;

            }

            public string Render()
            {

                writer = new HtmlTextWriter(new StringWriter());

                RenderLocations(rootLocations);

                return writer.InnerWriter.ToString();

            }

            /// <summary>

            /// Recursively walks the location tree outputting it as hierarchical UL/LI elements

            /// </summary>

            /// <param name="locations"></param>

            private void RenderLocations(IEnumerable<ICompositeTree> locations)
            {

                if (locations == null) return;

                if (locations.Count() == 0) return;

                InUl(() => locations.ForEach(location => InLi(() =>
                {

                    writer.Write(locationRenderer(location));

                    RenderLocations(location.Categories);

                })));

            }

            private void InUl(Action action)
            {

                writer.WriteLine();

                writer.RenderBeginTag(HtmlTextWriterTag.Ul);

                action();

                writer.RenderEndTag();

                writer.WriteLine();

            }

            private void InLi(Action action)
            {

                writer.RenderBeginTag(HtmlTextWriterTag.Li);

                action();

                writer.RenderEndTag();

                writer.WriteLine();

            }

        }


    }

}
