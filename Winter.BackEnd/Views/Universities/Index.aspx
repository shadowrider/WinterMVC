<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Winter.BackEnd.Models.Domain.ICompositeTree>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">

        $(function() {

            $("#treeview ul").treeview();

        });

    </script>

    <h2>
        University</h2>
    <ul id="treeview" class="filetree">
        <%= Html.RenderTree(ViewData.Model.Categories, thing => thing.Name)%>
    </ul>
</asp:Content>
