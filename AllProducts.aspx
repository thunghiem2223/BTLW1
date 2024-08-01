<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllProducts.aspx.cs" Inherits="BTL.AllProducts" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>Quần áo nam</title>
    <style>
        /* CSS để tạo layout cho sidebar */
        .content {
            display: flex;
        }

        .sidebar {
            width: 250px; /* Độ rộng của sidebar */
            background-color: #f0f0f0; /* Màu nền của sidebar */
            padding: 20px; /* Khoảng cách từ nội dung vào biên của sidebar */
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1); /* Hiệu ứng bóng đổ */
            margin-top: 40px;
            margin-left: 10px;
        }

        .content-main {
            flex: 1;
            padding: 20px;
        }

        .sidebar h3 {
            margin-top: 0;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

            .sidebar ul li {
                margin: 10px 0;
            }

                .sidebar ul li a {
                    text-decoration: none;
                    color: #333;
                }

                    .sidebar ul li a:hover {
                        color: #007BFF;
                    }

        .sidebar input, .sidebar select {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            box-sizing: border-box;
        }

        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px 0;
        }

            .pagination button, .pagination div span {
                margin: 0 5px;
                padding: 10px 15px;
                text-decoration: none;
                background-color: #f1f1f1;
                color: #333;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

                .pagination button:hover, .pagination div span:hover, .pagination div span.active {
                    background-color: #333;
                    color: #fff;
                }

        .active {
            display: inline !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <div class="content">
        <div class="sidebar">
            <!-- Nội dung của sidebar -->
            <h3>Tìm kiếm sản phẩm</h3>
            <input type="text" id="product-name" placeholder="Nhập tên sản phẩm" />

            <h3>Khoảng giá</h3>
            <input type="number" id="min-price" placeholder="Giá thấp nhất" />
            <input type="number" id="max-price" placeholder="Giá cao nhất" />

            <input type="button" id="btn-filter" style="background-color: rgb(224, 239, 20);" value="Áp dụng" />
        </div>
        <div class="content-main">
            <div class="content-part">
                <div class="content-top">
                    <div class="content-list">
                        <div class="product-row" id="all_products" runat="server">
                            <!-- Nội dung danh sách sản phẩm  -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="pagination">
        <div id="page-numbers"></div>
    </div>
    <script>
        document.getElementById('btn-filter').addEventListener('click', function () {
            const productName = document.getElementById('product-name').value.toLowerCase(); // thành chữ thường
            const minPrice = parseFloat(document.getElementById('min-price').value);
            const maxPrice = parseFloat(document.getElementById('max-price').value);

            const products = document.querySelectorAll('.product-row .product');

            products.forEach(product => {
                const name = product.querySelector('.product-name').innerText.toLowerCase();
                const price = parseFloat(product.querySelector('.product-price').innerText.replace('$', ''));

                let matches = true;

                if (productName && !name.includes(productName)) {
                    matches = false;
                }
                if (!isNaN(minPrice) && price < minPrice) {
                    matches = false;
                }
                if (!isNaN(maxPrice) && price > maxPrice) {
                    matches = false;
                }

                if (matches) {
                    product.style.display = '';
                } else {
                    product.style.display = 'none';
                }
            });
        });

      
    </script>
    <script>
        let currentPage = 1;
        const itemsPerPage = 8; // Số sản phẩm hiển thị trên mỗi trang
        const products = document.querySelectorAll('.product');

        function displayPage(page) {
            currentPage = page;
            const start = (page - 1) * itemsPerPage;
            const end = page * itemsPerPage;

            products.forEach((product, index) => {
                product.style.display = (index >= start && index < end) ? 'block' : 'none';
            });

            updatePagination();
        }

        function updatePagination() {
            const pageCount = Math.ceil(products.length / itemsPerPage);
            const pageNumbers = document.getElementById('page-numbers');
            pageNumbers.innerHTML = '';

            for (let i = 1; i <= pageCount; i++) {
                const span = document.createElement('span');
                span.textContent = i;
                span.className = (i === currentPage) ? 'active' : '';
                span.onclick = () => displayPage(i);
                pageNumbers.appendChild(span);
            }
        }

        // Hiển thị trang đầu tiên khi trang web được tải
        displayPage(1);
    </script>
</asp:Content>
