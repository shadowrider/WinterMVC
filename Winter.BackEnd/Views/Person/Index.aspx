<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Winter.BackEnd.Models.Domain.Person>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
       {%>
    <h2>
        List</h2>
    <table>
        <tr>
            <td>
                UserName
            </td>
            <td>
                FullName
            </td>
            <td>
                Role
            </td>
        </tr>
        <%foreach (Winter.BackEnd.Models.Domain.Person person in Model)
          { %>
        <tr>
            <td>
                <span>
                    <%= Html.ActionLink(person.UserName, "Details", new { id = person.ID })%>
                </span>
            </td>
            <td>
                <span>
                    <%= string.Format("{0} {1} {2}", person.LastName, person.FirstName, person.SecondName)%>
                </span>
            </td>
            <td>
                <span>
                    <%= Html.Encode(person.UserRole) %>
                </span>
            </td>
        </tr>
        <%} %>
    </table>
    <%} %>
</asp:Content>
