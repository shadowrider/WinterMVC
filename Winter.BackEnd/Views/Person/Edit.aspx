<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Winter.BackEnd.Models.Domain.Person>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Edit</h2>
    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <legend>Fields</legend>
        <p>
            <label for="FirstName">
                FirstName:</label>
            <%= Html.TextBox("FirstName", Model.FirstName) %>
            <%= Html.ValidationMessage("FirstName", "*") %>
        </p>
        <p>
            <label for="SecondName">
                SecondName:</label>
            <%= Html.TextBox("SecondName", Model.SecondName) %>
            <%= Html.ValidationMessage("SecondName", "*") %>
        </p>
        <p>
            <label for="LastName">
                LastName:</label>
            <%= Html.TextBox("LastName", Model.LastName) %>
            <%= Html.ValidationMessage("LastName", "*") %>
        </p>
        <p>
            <label for="Birthdate">
                Birthdate:</label>
            <%= Html.TextBox("Birthdate", String.Format("{0:g}", Model.Birthdate)) %>
            <%= Html.ValidationMessage("Birthdate", "*") %>
        </p>
        <p>
            <label for="Email">
                Email:</label>
            <%= Html.TextBox("Email", Model.Email) %>
            <%= Html.ValidationMessage("Email", "*") %>
        </p>
        <p>
            <label for="UserRole">
                UserRole:</label>
            <%= Html.DropDownList("Roles", (IEnumerable<SelectListItem>)ViewData["Roles"]) %>
            <%= Html.ValidationMessage("UserRole", "*") %>
        </p>
        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>
