<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Winter.BackEnd.Models.Domain.Person>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <fieldset>
        <legend>Fields</legend>
        <p>
            FirstName:
            <%= Html.Encode(Model.FirstName) %>
        </p>
        <p>
            SecondName:
            <%= Html.Encode(Model.SecondName) %>
        </p>
        <p>
            LastName:
            <%= Html.Encode(Model.LastName) %>
        </p>
        <p>
            Birthdate:
            <%= Html.Encode(String.Format("{0:g}", Model.Birthdate)) %>
        </p>
        <p>
            UserName:
            <%= Html.Encode(Model.UserName) %>
        </p>
        <p>
            Email:
            <%= Html.Encode(Model.Email) %>
        </p>
        <p>
            Password:
            <%= Html.Encode(Model.Password) %>
        </p>
        <p>
            ConfirmPassword:
            <%= Html.Encode(Model.ConfirmPassword) %>
        </p>
        <p>
            UserRole:
            <%= Html.Encode(Model.UserRole) %>
        </p>
    </fieldset>
    <p>

        <%=Html.ActionLink("Edit", "Edit", new { id=Model.ID }) %> |
        <%=Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

