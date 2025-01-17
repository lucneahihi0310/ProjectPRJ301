USE [Project_PRJ]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 4/25/2024 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[account_id] [int] NULL,
	[product_id] [int] NULL,
	[ammount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/25/2024 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/25/2024 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[account_name] [nvarchar](max) NULL,
	[password] [varchar](255) NULL,
	[customer_name] [nvarchar](max) NULL,
	[phone] [varchar](10) NULL,
	[address] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/25/2024 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [date] NULL,
	[account_id] [int] NULL,
	[total] [int] NULL,
	[status] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 4/25/2024 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/25/2024 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](max) NULL,
	[list_price] [int] NULL,
	[category_id] [int] NULL,
	[img] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/25/2024 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'Electronics')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (2, N'Clothing')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (3, N'Books')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (4, N'Furniture')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (5, N'Toys')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (7, N'Sports')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id]) VALUES (1, N'Updated Customer', N'new_password', N'John Doe', N'9876543210', N'456 Elm St', N'updatedcustomer@example.com', 2)
GO
INSERT [dbo].[Customers] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id]) VALUES (2, N'2', N'pass2', N'Jane Smith', N'9876543210', N'456 Elm St', N'jane.smith@example.com', 2)
GO
INSERT [dbo].[Customers] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id]) VALUES (3, N'user3', N'pass3', N'Bob Johnson', N'5551234567', N'789 Oak St', N'bob.johnson@example.com', 2)
GO
INSERT [dbo].[Customers] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id]) VALUES (4, N'user4', N'pass4', N'Mary Brown', N'4449876543', N'321 Birch St', N'mary.brown@example.com', 2)
GO
INSERT [dbo].[Customers] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id]) VALUES (5, N'user5', N'pass5', N'Alice White', N'6665554321', N'654 Pine St', N'alice.white@example.com', 2)
GO
INSERT [dbo].[Customers] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id]) VALUES (6, N'user6', N'pass6', N'David Wilson', N'7777777777', N'890 Cedar St', N'david.wilson@example.com', 2)
GO
INSERT [dbo].[Customers] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id]) VALUES (7, N'user7', N'pass7', N'Sara Lee', N'8881234567', N'432 Spruce St', N'sara.lee@example.com', 2)
GO
INSERT [dbo].[Customers] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id]) VALUES (8, N'user8', N'pass8', N'Tom Green', N'2223334444', N'765 Maple St', N'tom.green@example.com', 2)
GO
INSERT [dbo].[Customers] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id]) VALUES (9, N'user9', N'pass9', N'Linda Harris', N'1112223333', N'543 Cherry St', N'linda.harris@example.com', 2)
GO
INSERT [dbo].[Customers] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id]) VALUES (10, N'user10', N'pass10', N'Mike Turner', N'5556667777', N'876 Apple St', N'mike.turner@example.com', 2)
GO
INSERT [dbo].[Customers] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id]) VALUES (11, N'new_account', N'new_password', N'New Customer', N'123456789', N'123 Main St', N'new@email.com', NULL)
GO
INSERT [dbo].[Customers] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id]) VALUES (12, N'admin1', N'123', N'Duong Van Luc', N'0862497002', N'Nam Dinh', N'itsukasindou@gmail.com', 1)
GO
INSERT [dbo].[Customers] ([account_id], [account_name], [password], [customer_name], [phone], [address], [email], [role_id]) VALUES (13, N'luc', N'123', N'duong van luc', N'12345678', N'hhhdhdjjdjd', N'gygascjsah@gmail.com', NULL)
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total], [status]) VALUES (19, CAST(N'2023-10-25' AS Date), 12, 40, N'Shipping')
GO
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total], [status]) VALUES (20, CAST(N'2023-10-25' AS Date), 1, 30, N'Shipping')
GO
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total], [status]) VALUES (21, CAST(N'2023-10-26' AS Date), 12, 30, N'Shipping')
GO
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total], [status]) VALUES (22, CAST(N'2023-10-28' AS Date), 12, 30, N'Failing')
GO
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total], [status]) VALUES (23, CAST(N'2023-11-06' AS Date), 12, 70, N'Shipping')
GO
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total], [status]) VALUES (24, CAST(N'2023-11-06' AS Date), 12, 20, NULL)
GO
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total], [status]) VALUES (25, CAST(N'2023-11-07' AS Date), 13, 7, N'Received the goods')
GO
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total], [status]) VALUES (26, CAST(N'2023-11-07' AS Date), 13, 10, NULL)
GO
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total], [status]) VALUES (27, CAST(N'2023-11-07' AS Date), 13, 20, NULL)
GO
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total], [status]) VALUES (28, CAST(N'2023-11-10' AS Date), 13, 1, NULL)
GO
INSERT [dbo].[Order] ([order_id], [order_date], [account_id], [total], [status]) VALUES (29, CAST(N'2023-11-10' AS Date), 13, 30, NULL)
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (19, 37, 2, 100)
GO
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (20, 43, 3, 10)
GO
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (21, 40, 1, 10)
GO
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (21, 43, 2, 10)
GO
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (22, 40, 1, 10)
GO
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (22, 43, 2, 10)
GO
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (23, 38, 1, 100)
GO
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (24, 40, 1, 10)
GO
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (24, 43, 1, 10)
GO
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (25, 43, 1, 10)
GO
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (26, 40, 1, 10)
GO
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (27, 39, 1, 20)
GO
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (28, 50, 1, 1)
GO
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [quantity], [price]) VALUES (29, 49, 1, 30)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img], [Description]) VALUES (37, N'New Product', 10, 1, N'12102831812_988005209.jpg', N'A new product')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img], [Description]) VALUES (38, N'Combo Máy giặt lồng ngang LG AI DD™ 9kg (trắng) FV1409S4W và Máy sấy LG DUAL Inverter Heat Pump™ 9kg (trắng) DVHP09W | WODR0909W', 100, 1, N'250_2481_dz.jpg', N'Máy sấy DUAL Inverter Heat Pump™ Cho hiệu suất đồng đều, chăm sóc bền vững Sống theo tiêu chuẩn mới về tiết kiệm điện năng, sử dụng tiện lợi và sấy đồ bảo vệ sức khỏe.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img], [Description]) VALUES (39, N'Áo Thun Vải Cotton Cổ Tròn Dài Tay', 20, 1, N'44bb4e50-9227-1b02-a9e9-00195d57315d.jpg', N'Được làm từ 100% cotton mềm mại nhưng bền bỉ. Thiết kế dáng rộng dễ dàng tạo kiểu.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img], [Description]) VALUES (40, N'Mũ Bucket Chống UV (Chống Nắng)', 10, 1, N'mochanstore.com-MU-BUCKET-VANH-RONG-TRON-CHONG-NANG-CHONG-TIA-UV-CHAT-COI-PHOI-DU-THOI-TRANG-HANA-GLOBALO.jpg', N'Thiết kế đơn giản phù hợp với bất kì phong cách nào. Tính năng chống UV và công nghệ DRY khô nhanh giúp bạn khô thoáng cả ngày. UPF50+.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img], [Description]) VALUES (43, N'gấu bông', 10, 1, N'heo-om-binh-sua-2-2277.jpg', N'Gấu Bông Khủng Long Hóa Ếch Xanh, Gối Ôm Cho Bé  Chất Liệu Cao Cấp, Mềm Mại Dài 52Cm')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img], [Description]) VALUES (49, N' BASAS RAW - LOW TOP - RUSTIC', 30, 1, N'4f1bb041268b3c2a52ff8faed1b0fb4a.jpg_720x720q80.jpg', N'Phiên bản tối giản mới sử dụng chất liệu Canvas RAW với phần bề mặt được tiết chế tối đa các bước xử lý sau dệt, đem đến một cảm nhận thô ráp, dễ dàng cảm nhận nét bền bỉ, dày dặn đặc trưng nguyên bản chỉ từ ánh nhìn diện mạo. Với những điểm nhấn thay đổi trong thiết kế cùng với vài chọn lựa chi tiết khác hơn từ trong ra ngoài, Basas RAW mang trên mình sứ mệnh chào sân phiên bản /rập mới/ và cũng là nơi bắt đầu cho những nâng cấp này xuất hiện rộng rãi hơn trong tương lai. Như một tấm ảnh RAW với đầy đủ cảm xúc tự nhiên, hãy tự do ngẫu hứng nó theo cách của bạn.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img], [Description]) VALUES (50, N'Thu Phương', 1, 7, N'mochanstore.com-MU-BUCKET-VANH-RONG-TRON-CHONG-NANG-CHONG-TIA-UV-CHAT-COI-PHOI-DU-THOI-TRANG-HANA-GLOBALO.jpg', N'nặng 50kg cao 1m43')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [list_price], [category_id], [img], [Description]) VALUES (52, N'ffff', 45, 3, N'12102831812_988005209.jpg', N'hhhhhh')
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Customers] ([account_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Customers] ([account_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
