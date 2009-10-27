<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Winter.BackEnd.Models.Domain.Person>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Register</h2>
    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <legend>Fields</legend>
        <p>
            <label for="UserName">
                UserName:</label>
            <%= Html.TextBox("UserName")%>
            <%= Html.ValidationMessage("UserName", "*")%>
        </p>
        <p>
            <label for="Email">
                Email:</label>
            <%= Html.TextBox("Email")%>
            <%= Html.ValidationMessage("Email", "*")%>
        </p>
        <p>
            <label for="Password">
                Password:</label>
            <%= Html.Password("Password")%>
            <%= Html.ValidationMessage("Password", "*")%>
        </p>
        <p>
            <label for="ConfirmPassword">
                ConfirmPassword:</label>
            <%= Html.Password("ConfirmPassword")%>
            <%= Html.ValidationMessage("ConfirmPassword", "*")%>
        </p>
        <p>
            <label for="UserRole">
                UserRole:</label>
            <%= Html.ListBox("UserRole")%>
        </p>
        <p>
            <label for="FirstName">
                FirstName:</label>
            <%= Html.TextBox("FirstName") %>
            <%= Html.ValidationMessage("FirstName", "*") %>
        </p>
        <p>
            <label for="SecondName">
                SecondName:</label>
            <%= Html.TextBox("SecondName") %>
            <%= Html.ValidationMessage("SecondName", "*") %>
        </p>
        <p>
            <label for="LastName">
                LastName:</label>
            <%= Html.TextBox("LastName") %>
            <%= Html.ValidationMessage("LastName", "*") %>
        </p>
        <p>
            <label for="Birthdate">
                Birthdate:</label>
            <%= Html.TextBox("Birthdate") %>
            <%= Html.ValidationMessage("Birthdate", "*") %>
        </p>
        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
    <% } %>
</asp:Content>
