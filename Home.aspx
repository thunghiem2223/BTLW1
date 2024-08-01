<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BTL.Home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="CSS/home.css" />
    <link rel="stylesheet" href="CSS/style.css" />
    <title>Trang chủ</title>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <div class="content">
        <div class="poster">
            <div class="container">
                <img src="../Image/banner.jpg" alt="Poster" class="poster-img" />
            </div>
        </div>
        <div class="content-part">
            <div class="content-top">
                <div class="content-title">
                    <h1 class="content-tag hover-red">Sản phẩm mới</h1>
                </div>
                <div class="content-list">
                    <div class="product-row" id="new_product" runat="server">
                    </div>
                </div>
            </div>
            <div class="product-poster"></div>
        </div>
    </div>

</asp:Content>


