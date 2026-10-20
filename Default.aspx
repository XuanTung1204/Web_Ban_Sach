<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SieuThiSach.Default" %>
<%@ Register Src="~/UserControls/Sachmoi.ascx" TagPrefix="uc" TagName="Sachmoi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc:Sachmoi ID="Sachmoi1" runat="server" />
</asp:Content>