USE [Final_18114037_Restaurant]
GO
/****** Object:  Table [dbo].[account]    Script Date: 6/20/2022 12:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id_account] [int] IDENTITY(1,1) NOT NULL,
	[e_mail] [varchar](128) NOT NULL,
	[login] [varchar](64) NOT NULL,
	[password] [varchar](64) NOT NULL,
	[name] [varchar](128) NOT NULL,
	[surname] [varchar](128) NOT NULL,
	[account_creation_date] [date] NULL,
	[phone_number] [varchar](11) NULL,
	[role] [varchar](64) NULL,
	[CreateDate_18114037] [datetime] NULL,
	[ModifiedDate_18114037] [datetime] NULL,
 CONSTRAINT [account_PK] PRIMARY KEY CLUSTERED 
(
	[id_account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client]    Script Date: 6/20/2022 12:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[id_client] [int] IDENTITY(1,1) NOT NULL,
	[points] [int] NOT NULL,
	[address] [varchar](256) NULL,
	[account_id_account] [int] NOT NULL,
	[CreateDate_18114037] [datetime] NULL,
	[ModifiedDate_18114037] [datetime] NULL,
 CONSTRAINT [client_PK] PRIMARY KEY CLUSTERED 
(
	[id_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dishes]    Script Date: 6/20/2022 12:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dishes](
	[order_id_order] [int] NOT NULL,
	[food_id_food] [int] NOT NULL,
	[historical_cost] [int] NULL,
	[historical_price] [int] NULL,
	[amount] [int] NULL,
	[CreateDate_18114037] [datetime] NULL,
	[ModifiedDate_18114037] [datetime] NULL,
 CONSTRAINT [dishes_PK] PRIMARY KEY CLUSTERED 
(
	[order_id_order] ASC,
	[food_id_food] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[food]    Script Date: 6/20/2022 12:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food](
	[id_food] [int] IDENTITY(1,1) NOT NULL,
	[price] [int] NOT NULL,
	[cost] [int] NOT NULL,
	[isAvailable] [bit] NOT NULL,
	[type] [varchar](64) NOT NULL,
	[size] [int] NULL,
	[points] [int] NULL,
	[CreateDate_18114037] [datetime] NULL,
	[ModifiedDate_18114037] [datetime] NULL,
 CONSTRAINT [food_PK] PRIMARY KEY CLUSTERED 
(
	[id_food] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[journal]    Script Date: 6/20/2022 12:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[journal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[table_change] [varchar](128) NOT NULL,
	[fn_18114037] [datetime] NULL,
	[operation] [varchar](128) NULL,
 CONSTRAINT [journal_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manager]    Script Date: 6/20/2022 12:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manager](
	[id_manager] [int] IDENTITY(1,1) NOT NULL,
	[salary_netto] [int] NULL,
	[salary_brutto] [int] NULL,
	[account_id_account] [int] NOT NULL,
	[CreateDate_18114037] [datetime] NULL,
	[ModifiedDate_18114037] [datetime] NULL,
 CONSTRAINT [manager_PK] PRIMARY KEY CLUSTERED 
(
	[id_manager] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manager_assignment]    Script Date: 6/20/2022 12:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manager_assignment](
	[manager_id_manager] [int] NOT NULL,
	[restaurant_id_restaurant] [int] NOT NULL,
	[assignment_role] [varchar](128) NULL,
	[CreateDate_18114037] [datetime] NULL,
	[ModifiedDate_18114037] [datetime] NULL,
 CONSTRAINT [manager_assignment_PK] PRIMARY KEY CLUSTERED 
(
	[manager_id_manager] ASC,
	[restaurant_id_restaurant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 6/20/2022 12:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id_order] [int] IDENTITY(1,1) NOT NULL,
	[delivery_adress] [varchar](128) NOT NULL,
	[DATE] [date] NOT NULL,
	[status] [char](1) NULL,
	[phone_number] [varchar](11) NULL,
	[additional_information ] [varchar](1024) NULL,
	[name] [varchar](128) NULL,
	[surname] [varchar](128) NULL,
	[client_id_client] [int] NULL,
	[restaurant_id_restaurant] [int] NULL,
	[CreateDate_18114037] [datetime] NULL,
	[ModifiedDate_18114037] [datetime] NULL,
 CONSTRAINT [order_PK] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservation]    Script Date: 6/20/2022 12:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservation](
	[id_reservation] [int] IDENTITY(1,1) NOT NULL,
	[DATE] [date] NOT NULL,
	[start_of_reservation] [time](7) NOT NULL,
	[end_of_reservation] [time](7) NOT NULL,
	[name] [varchar](128) NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[manager_id_manager] [int] NULL,
	[client_id_client] [int] NULL,
	[table_id_table] [int] NOT NULL,
	[table_restaurant_id_restaurant] [int] NULL,
	[CreateDate_18114037] [datetime] NULL,
	[ModifiedDate_18114037] [datetime] NULL,
 CONSTRAINT [reservation_PK] PRIMARY KEY CLUSTERED 
(
	[id_reservation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[restaurant]    Script Date: 6/20/2022 12:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurant](
	[id_restaurant] [int] IDENTITY(1,1) NOT NULL,
	[address] [varchar](256) NOT NULL,
	[phone_number] [varchar](11) NULL,
	[e_mail] [varchar](128) NULL,
	[CreateDate_18114037] [datetime] NULL,
	[ModifiedDate_18114037] [datetime] NULL,
 CONSTRAINT [restaurant_PK] PRIMARY KEY CLUSTERED 
(
	[id_restaurant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[table]    Script Date: 6/20/2022 12:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table](
	[id_table] [int] IDENTITY(1,1) NOT NULL,
	[capacity] [int] NULL,
	[restaurant_id_restaurant] [int] NOT NULL,
	[CreateDate_18114037] [datetime] NULL,
	[ModifiedDate_18114037] [datetime] NULL,
 CONSTRAINT [table_PK] PRIMARY KEY CLUSTERED 
(
	[id_table] ASC,
	[restaurant_id_restaurant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT (getdate()) FOR [CreateDate_18114037]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT (getdate()) FOR [ModifiedDate_18114037]
GO
ALTER TABLE [dbo].[client] ADD  DEFAULT (getdate()) FOR [CreateDate_18114037]
GO
ALTER TABLE [dbo].[client] ADD  DEFAULT (getdate()) FOR [ModifiedDate_18114037]
GO
ALTER TABLE [dbo].[dishes] ADD  DEFAULT (getdate()) FOR [CreateDate_18114037]
GO
ALTER TABLE [dbo].[dishes] ADD  DEFAULT (getdate()) FOR [ModifiedDate_18114037]
GO
ALTER TABLE [dbo].[food] ADD  DEFAULT (getdate()) FOR [CreateDate_18114037]
GO
ALTER TABLE [dbo].[food] ADD  DEFAULT (getdate()) FOR [ModifiedDate_18114037]
GO
ALTER TABLE [dbo].[journal] ADD  DEFAULT (getdate()) FOR [fn_18114037]
GO
ALTER TABLE [dbo].[manager] ADD  DEFAULT (getdate()) FOR [CreateDate_18114037]
GO
ALTER TABLE [dbo].[manager] ADD  DEFAULT (getdate()) FOR [ModifiedDate_18114037]
GO
ALTER TABLE [dbo].[manager_assignment] ADD  DEFAULT (getdate()) FOR [CreateDate_18114037]
GO
ALTER TABLE [dbo].[manager_assignment] ADD  DEFAULT (getdate()) FOR [ModifiedDate_18114037]
GO
ALTER TABLE [dbo].[order] ADD  DEFAULT (getdate()) FOR [CreateDate_18114037]
GO
ALTER TABLE [dbo].[order] ADD  DEFAULT (getdate()) FOR [ModifiedDate_18114037]
GO
ALTER TABLE [dbo].[reservation] ADD  DEFAULT (getdate()) FOR [CreateDate_18114037]
GO
ALTER TABLE [dbo].[reservation] ADD  DEFAULT (getdate()) FOR [ModifiedDate_18114037]
GO
ALTER TABLE [dbo].[restaurant] ADD  DEFAULT (getdate()) FOR [CreateDate_18114037]
GO
ALTER TABLE [dbo].[restaurant] ADD  DEFAULT (getdate()) FOR [ModifiedDate_18114037]
GO
ALTER TABLE [dbo].[table] ADD  DEFAULT (getdate()) FOR [CreateDate_18114037]
GO
ALTER TABLE [dbo].[table] ADD  DEFAULT (getdate()) FOR [ModifiedDate_18114037]
GO
ALTER TABLE [dbo].[client]  WITH CHECK ADD  CONSTRAINT [client_account_FK] FOREIGN KEY([account_id_account])
REFERENCES [dbo].[account] ([id_account])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[client] CHECK CONSTRAINT [client_account_FK]
GO
ALTER TABLE [dbo].[dishes]  WITH CHECK ADD  CONSTRAINT [FK_ASS_4] FOREIGN KEY([food_id_food])
REFERENCES [dbo].[food] ([id_food])
GO
ALTER TABLE [dbo].[dishes] CHECK CONSTRAINT [FK_ASS_4]
GO
ALTER TABLE [dbo].[manager]  WITH CHECK ADD  CONSTRAINT [manager_account_FK] FOREIGN KEY([account_id_account])
REFERENCES [dbo].[account] ([id_account])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[manager] CHECK CONSTRAINT [manager_account_FK]
GO
ALTER TABLE [dbo].[manager_assignment]  WITH CHECK ADD  CONSTRAINT [FK_ASS_7] FOREIGN KEY([manager_id_manager])
REFERENCES [dbo].[manager] ([id_manager])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[manager_assignment] CHECK CONSTRAINT [FK_ASS_7]
GO
ALTER TABLE [dbo].[manager_assignment]  WITH CHECK ADD  CONSTRAINT [FK_ASS_8] FOREIGN KEY([restaurant_id_restaurant])
REFERENCES [dbo].[restaurant] ([id_restaurant])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[manager_assignment] CHECK CONSTRAINT [FK_ASS_8]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [order_client_FK] FOREIGN KEY([client_id_client])
REFERENCES [dbo].[client] ([id_client])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [order_client_FK]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [order_restaurant_FK] FOREIGN KEY([restaurant_id_restaurant])
REFERENCES [dbo].[restaurant] ([id_restaurant])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [order_restaurant_FK]
GO
ALTER TABLE [dbo].[reservation]  WITH CHECK ADD  CONSTRAINT [reservation_client_FK] FOREIGN KEY([client_id_client])
REFERENCES [dbo].[client] ([id_client])
GO
ALTER TABLE [dbo].[reservation] CHECK CONSTRAINT [reservation_client_FK]
GO
ALTER TABLE [dbo].[reservation]  WITH CHECK ADD  CONSTRAINT [reservation_manager_FK] FOREIGN KEY([manager_id_manager])
REFERENCES [dbo].[manager] ([id_manager])
GO
ALTER TABLE [dbo].[reservation] CHECK CONSTRAINT [reservation_manager_FK]
GO
ALTER TABLE [dbo].[reservation]  WITH CHECK ADD  CONSTRAINT [reservation_table_FK] FOREIGN KEY([table_id_table], [table_restaurant_id_restaurant])
REFERENCES [dbo].[table] ([id_table], [restaurant_id_restaurant])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[reservation] CHECK CONSTRAINT [reservation_table_FK]
GO
ALTER TABLE [dbo].[table]  WITH CHECK ADD  CONSTRAINT [table_restaurant_FK] FOREIGN KEY([restaurant_id_restaurant])
REFERENCES [dbo].[restaurant] ([id_restaurant])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[table] CHECK CONSTRAINT [table_restaurant_FK]
GO
