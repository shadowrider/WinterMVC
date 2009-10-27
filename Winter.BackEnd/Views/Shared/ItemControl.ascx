<%@ Control Language="C#" AutoEventWireup="true" Inherits="Winter.BackEnd.Views.Shared.ItemControl" %>
<%--<%foreach (Winter.BackEnd.Models.Domain.ICategory item in ViewData.Model)
  { %>
<li><span class='folder'>
    <%=item.CategoryName %></span>
    <%if (item.Categories.Count() > 0)
      { %>
    <ul>
        <%= Html.RenderUserControl("~/Views/Shared/ItemControl.ascx",item.Categories) %>
    </ul>
    <%} %>
</li>
<%} %>--%>