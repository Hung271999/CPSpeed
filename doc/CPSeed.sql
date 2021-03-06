USE [CPSeed]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateUser] [nvarchar](256) NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateUser] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_CategoryPost] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] NOT NULL,
	[Title] [ntext] NULL,
	[contents] [ntext] NULL,
	[icons] [nvarchar](30) NULL,
	[Status] [bit] NULL,
	[url] [nvarchar](250) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contactus]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contactus](
	[ContactusID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [ntext] NULL,
	[contents] [ntext] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUser] [nvarchar](256) NULL,
 CONSTRAINT [PK_Contactus] PRIMARY KEY CLUSTERED 
(
	[ContactusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [nvarchar](20) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Note] [nvarchar](250) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[MST] [nvarchar](50) NULL,
	[PrefixBillNo] [nvarchar](50) NULL,
	[IsDebt] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [nvarchar](256) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateUser] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](20) NULL,
	[LastName] [nvarchar](20) NULL,
	[FullName] [nvarchar](150) NULL,
	[BirthDay] [datetime] NULL,
	[StartWorkDate] [datetime] NULL,
	[IDNo] [nvarchar](20) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Address] [nvarchar](200) NULL,
	[Email] [nvarchar](50) NULL,
	[PositionName] [nvarchar](50) NULL,
	[ManagerID] [nvarchar](20) NULL,
	[BasicSalary] [money] NULL,
	[IsDeleted] [bit] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [nvarchar](256) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateUser] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ImagesID] [int] NOT NULL,
	[url] [nvarchar](50) NULL,
	[ProductID] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ImagesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[ProductID] [nvarchar](20) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[UnitID] [nvarchar](20) NULL,
	[BuyPrice] [money] NULL,
	[SellPrice] [money] NULL,
	[Quantity] [decimal](18, 0) NULL,
	[QuantityOrder] [decimal](18, 0) NULL,
	[IsDeleted] [bit] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [nvarchar](256) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateUser] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Inventory_2] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryHistory]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryHistory](
	[InvoiceNo] [nvarchar](20) NOT NULL,
	[StoreID] [int] NOT NULL,
	[InventoryID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[ProductID] [nvarchar](20) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[InOutKBN] [int] NOT NULL,
	[UnitID] [nvarchar](20) NULL,
	[UnitName] [nvarchar](50) NULL,
	[Quantity] [decimal](18, 0) NULL,
	[QuantityOffer] [decimal](18, 0) NULL,
	[QuantityOfferUnit] [nvarchar](20) NULL,
	[BuyPrice] [money] NULL,
	[SellPrice] [money] NULL,
	[AmountBuy] [money] NULL,
	[AmountSell] [money] NULL,
	[IsDeleted] [bit] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [nvarchar](256) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateUser] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_InventoryHistory_1] PRIMARY KEY CLUSTERED 
(
	[InvoiceNo] ASC,
	[InventoryID] ASC,
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceNo] [nvarchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[InOutKbn] [int] NULL,
	[StoreID] [int] NOT NULL,
	[Amount] [money] NULL,
	[Discount] [float] NULL,
	[TotalAmount] [money] NULL,
	[CustomerID] [nvarchar](20) NULL,
	[CustomerName] [nvarchar](50) NULL,
	[EmployeeID] [nvarchar](20) NULL,
	[EmployeeName] [nvarchar](150) NULL,
	[Note] [nvarchar](250) NULL,
	[IsDeleted] [bit] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [nvarchar](256) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateUser] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewDetail]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewDetail](
	[NewDetailID] [int] NOT NULL,
	[Title] [ntext] NULL,
	[Summary] [ntext] NULL,
	[NewsID] [int] NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[PublicDate] [datetime] NULL,
	[CreateUser] [nvarchar](256) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUser] [nvarchar](256) NULL,
	[image] [nvarchar](50) NULL,
	[Priority] [int] NULL,
	[contents] [ntext] NULL,
 CONSTRAINT [PK_NewDetail] PRIMARY KEY CLUSTERED 
(
	[NewDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] NOT NULL,
	[Title] [ntext] NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateUser] [nvarchar](256) NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateUser] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NULL,
	[Paid] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[ReceivedDate] [datetime] NULL,
	[CreateUser] [nvarchar](256) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUser] [nvarchar](256) NULL,
	[Priority] [int] NULL,
	[Total] [float] NULL,
	[Email] [nvarchar](256) NULL,
	[Address] [nvarchar](256) NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Oder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[SellPrice] [money] NULL,
	[ProductID] [nvarchar](20) NULL,
 CONSTRAINT [PK_OrderDetailID] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [int] NOT NULL,
	[Title] [ntext] NULL,
	[Summary] [ntext] NULL,
	[contents] [ntext] NULL,
	[CategoryID] [int] NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[PublicDate] [datetime] NULL,
	[CreateUser] [nvarchar](256) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUser] [nvarchar](256) NULL,
	[image] [nvarchar](50) NULL,
	[Priority] [int] NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [nvarchar](20) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[UnitID] [nvarchar](20) NULL,
	[UnitName] [nvarchar](50) NULL,
	[ProductTypeID] [int] NULL,
	[ProviderID] [nvarchar](20) NULL,
	[ProviderName] [nvarchar](50) NULL,
	[BuyPriceCurrent] [money] NULL,
	[BuyPricePrevious] [money] NULL,
	[BuyPriceAverage] [money] NULL,
	[SellPrice] [money] NULL,
	[ExportBuy] [int] NULL,
	[ExportOffer] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [nvarchar](256) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateUser] [nvarchar](256) NOT NULL,
	[image] [nvarchar](50) NULL,
	[description] [ntext] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeID] [int] NOT NULL,
	[ProductTypeName] [nvarchar](250) NULL,
	[TaxPercent] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [nvarchar](256) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateUser] [nvarchar](256) NOT NULL,
	[image] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductUnit]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductUnit](
	[ProductID] [nvarchar](20) NOT NULL,
	[UnitID1] [nvarchar](20) NOT NULL,
	[UnitIDMin] [nvarchar](20) NOT NULL,
	[Quantity] [decimal](18, 0) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [nvarchar](256) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateUser] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_ProductUnit] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[UnitID1] ASC,
	[UnitIDMin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[PromotionID] [int] NOT NULL,
	[InOutKBN] [int] NOT NULL,
	[ProductID] [nvarchar](20) NOT NULL,
	[UnitID] [nvarchar](20) NOT NULL,
	[QuantityOfferUnit] [nvarchar](20) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[QuantityBuy] [int] NULL,
	[QuantityOffer] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreateUser] [nvarchar](256) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateUser] [nvarchar](256) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Promotion_1] PRIMARY KEY CLUSTERED 
(
	[PromotionID] ASC,
	[InOutKBN] ASC,
	[ProductID] ASC,
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ProviderID] [nvarchar](20) NOT NULL,
	[ProviderName] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Mobile] [nvarchar](250) NULL,
	[IsDeleted] [bit] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [nvarchar](256) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateUser] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[SlideID] [int] NOT NULL,
	[url] [nvarchar](250) NULL,
	[contents] [nvarchar](max) NULL,
	[image] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[PublicDate] [datetime] NULL,
	[CreateUser] [nvarchar](256) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUser] [nvarchar](256) NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[SlideID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[StoreID] [int] NOT NULL,
	[StoreName] [nvarchar](200) NULL,
	[CompanyName] [nvarchar](250) NULL,
	[MST] [nvarchar](50) NULL,
	[Address] [nvarchar](150) NULL,
	[Email] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [nvarchar](256) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateUser] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 16/03/2021 16:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[UnitID] [nvarchar](20) NOT NULL,
	[UnitName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [nvarchar](256) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateUser] [nvarchar](256) NOT NULL,
	[Priority] [int] NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1', N'hung2712271999@gmail', 0, N'ACM4WmeQyqQ8HPenK6noeRRDwZ89EHpZhl2wZE99p4LRbM86riaRzYS/aSHV2DGu4A==', N'cd7b86bc-2fb5-4c27-bbb7-e1545551c3cc', NULL, 0, 0, NULL, 1, 0, N'hung2712271999@gmail')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a3e20a6a-d556-4cb9-bd3e-c0ce4939eaa9', N'hung29@gmail.com', 0, N'AAf3+QOdyWIxic4QS4MK0QKyjLmFbWaPRGHsE4ToNnIon5g3qJnF4LmtgvvCs850lQ==', N'33fb6dac-278d-4718-a5ee-2f2e6b5a489b', NULL, 0, 0, NULL, 1, 0, N'hung29@gmail.com')
GO
INSERT [dbo].[Category] ([CategoryID], [Title], [Status], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser]) VALUES (1, N'Tầm nhìn- Sứ mệnh', 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999')
INSERT [dbo].[Category] ([CategoryID], [Title], [Status], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser]) VALUES (2, N'Công nghệ', 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999')
INSERT [dbo].[Category] ([CategoryID], [Title], [Status], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser]) VALUES (3, N'Tuyển dụng', 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999')
GO
INSERT [dbo].[Contact] ([ContactID], [Title], [contents], [icons], [Status], [url]) VALUES (1, N' Địa chỉ: ', N'Số 1 Lương Định Của, Phương Mai, Đống Đa, Hà Nội', N'fas fa-map-marker-alt', 1, NULL)
INSERT [dbo].[Contact] ([ContactID], [Title], [contents], [icons], [Status], [url]) VALUES (2, N'Điện thoại:', N' (024)-38523294', N'fas fa-phone-square', 1, NULL)
INSERT [dbo].[Contact] ([ContactID], [Title], [contents], [icons], [Status], [url]) VALUES (3, N'Email:', N'nsc@vinaseed.com.vn', N'fas fa-envelope', 1, N'https://mail.google.com/mail/u/0/?fs=1&tf=cm&source=mailto&to=nsc@vinaseed.com.vn')
GO
SET IDENTITY_INSERT [dbo].[Contactus] ON 

INSERT [dbo].[Contactus] ([ContactusID], [Email], [contents], [CreateDate], [CreateUser]) VALUES (14, N'ada', N'', CAST(N'2021-03-05T10:57:32.197' AS DateTime), N'a')
INSERT [dbo].[Contactus] ([ContactusID], [Email], [contents], [CreateDate], [CreateUser]) VALUES (15, N'ada', N'<p>adad</p>', CAST(N'2021-03-05T11:00:49.933' AS DateTime), N'dad')
INSERT [dbo].[Contactus] ([ContactusID], [Email], [contents], [CreateDate], [CreateUser]) VALUES (16, N'hung271999@gmail.com', N'<p>dad</p>', CAST(N'2021-03-05T11:14:30.503' AS DateTime), N'Trần Quốc Hùng')
INSERT [dbo].[Contactus] ([ContactusID], [Email], [contents], [CreateDate], [CreateUser]) VALUES (17, N'hung271999@gmail.com', N'<table style="border-collapse: collapse; width: 100%; height: 92px;" border="1">
<tbody>
<tr style="height: 26px;">
<td style="width: 14.5227%; height: 26px;">adadad</td>
<td style="width: 14.5227%; height: 26px;">&nbsp;</td>
<td style="width: 14.5227%; height: 26px;">&nbsp;</td>
<td style="width: 14.5227%; height: 26px;">&nbsp;</td>
<td style="width: 14.5227%; height: 26px;">&nbsp;</td>
<td style="width: 14.5227%; height: 26px;">&nbsp;</td>
</tr>
<tr style="height: 22px;">
<td style="width: 14.5227%; height: 22px;">adad</td>
<td style="width: 14.5227%; height: 22px;">&nbsp;</td>
<td style="width: 14.5227%; height: 22px;">&nbsp;</td>
<td style="width: 14.5227%; height: 22px;">&nbsp;</td>
<td style="width: 14.5227%; height: 22px;">&nbsp;</td>
<td style="width: 14.5227%; height: 22px;">&nbsp;</td>
</tr>
<tr style="height: 22px;">
<td style="width: 14.5227%; height: 22px;">&nbsp;</td>
<td style="width: 14.5227%; height: 22px;">&nbsp;</td>
<td style="width: 14.5227%; height: 22px;">&nbsp;</td>
<td style="width: 14.5227%; height: 22px;">&nbsp;</td>
<td style="width: 14.5227%; height: 22px;">&nbsp;</td>
<td style="width: 14.5227%; height: 22px;">&nbsp;</td>
</tr>
<tr style="height: 22px;">
<td style="width: 14.5227%; height: 22px;">&nbsp;</td>
<td style="width: 14.5227%; height: 22px;">&nbsp;</td>
<td style="width: 14.5227%; height: 22px;">&nbsp;</td>
<td style="width: 14.5227%; height: 22px;">&nbsp;</td>
<td style="width: 14.5227%; height: 22px;">&nbsp;</td>
<td style="width: 14.5227%; height: 22px;">&nbsp;</td>
</tr>
</tbody>
</table>', CAST(N'2021-03-07T14:25:17.217' AS DateTime), N'Trần Quốc Hùng')
INSERT [dbo].[Contactus] ([ContactusID], [Email], [contents], [CreateDate], [CreateUser]) VALUES (18, N'hung271999@gmail.com', N'<p>thắng ngu</p>', CAST(N'2021-03-16T15:19:56.603' AS DateTime), N'Trần Quốc Hùng')
SET IDENTITY_INSERT [dbo].[Contactus] OFF
GO
INSERT [dbo].[Images] ([ImagesID], [url], [ProductID]) VALUES (1, N'img-pro-03.jpg', N'1')
INSERT [dbo].[Images] ([ImagesID], [url], [ProductID]) VALUES (2, N'img-pro-04.jpg', N'1')
INSERT [dbo].[Images] ([ImagesID], [url], [ProductID]) VALUES (3, N'img-pro-01.jpg', N'1')
INSERT [dbo].[Images] ([ImagesID], [url], [ProductID]) VALUES (4, N'img-pro-04.jpg', N'1')
INSERT [dbo].[Images] ([ImagesID], [url], [ProductID]) VALUES (5, N'img-pro-01.jpg', N'1')
GO
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (1, N'Tin mới trong ngày', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', 2, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'abc.jpg', 0, N'')
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (2, N'Tin hay', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', 1, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'cc.jpg', 0, N'adad')
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (3, N'Sự kiện 1', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', 2, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'best.jpg', 0, NULL)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (4, N'Thủ tướng', N'Thủ tướng đã gé thăm công ty ', 2, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'best.jpg', 0, NULL)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (5, N'Chúc mừng', N'Chúc mừng công ty CP Spped Vn đã thành công', 1, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'aa.jpg', 0, NULL)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (6, N'Lễ Khánh thành', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', 2, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'abc.jpg', 0, NULL)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (7, N'Nhập 60 tấn gạo', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', 2, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'aa.jpg', 0, NULL)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (8, N'Nhập 60 tấn gạo', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', 3, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'abc.jpg', 0, NULL)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (9, N'Công ty hạt giống xuất sắc nhất India  đã có mặt tại Việt Nam', N'', 1, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'new1.jpg', 1, NULL)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (10, N'Hoàn thành nhà máy sản xuất cấy giống lớn nhất ', N'Trung tâm được đầu tư trên diện tích 5ha, với dây chuyền chế biến hiện đại của Nhật Bản. Công suất chế biến hạt giống 30 tấn/giờ, chế biến gạo đóng gói tự động 30 tấn/giờ, tổng vốn đầu tư giai đoạn 1 là 350 tỷ đồng.', 1, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'cpsed..jpg', 1, NULL)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (11, N'Xuất gạo', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', 1, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'abc.jpg', 0, NULL)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (12, N'Nhập 60 tấn gạo', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', 1, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'abc.jpg', 0, NULL)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (13, N'Chúc mừng sự kiện', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', 2, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'best.jpg', 0, NULL)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (14, N'Thăm hỏi sức khỏe', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', 3, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'aa.jpg', 0, NULL)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (15, N'Nhập 60 tấn gạo', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', 2, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'abc.jpg', 0, NULL)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (16, N'Nhập 60 tấn gạo', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', 2, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'best.jpg', 0, NULL)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (17, N'Nhập 60 tấn gạo', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', 3, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'abc.jpg', 0, NULL)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority], [contents]) VALUES (18, N'Nhập 60 tấn gạo', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', 3, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'abc.jpg', 0, NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [Status], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser]) VALUES (1, N'Tin tức', 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999')
INSERT [dbo].[News] ([NewsID], [Title], [Status], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser]) VALUES (2, N'Sự kiện', 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999')
INSERT [dbo].[News] ([NewsID], [Title], [Status], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser]) VALUES (3, N'Thư viện', 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (1, 0, 0, CAST(N'2021-03-11T10:56:18.907' AS DateTime), CAST(N'2021-03-11T10:56:18.907' AS DateTime), N'hung', NULL, N'hung', 1, 2, N'hung271999', N'hung271999', NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (2, 0, 0, CAST(N'2021-03-11T11:01:35.890' AS DateTime), CAST(N'2021-03-11T11:01:35.890' AS DateTime), N'hung2712271999@gmail', CAST(N'2021-03-11T11:01:35.890' AS DateTime), N'hung2712271999@gmail', 1, 2, N'hung271999', N'hung271999', NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (3, 0, 0, CAST(N'2021-03-11T11:03:09.637' AS DateTime), CAST(N'2021-03-11T11:03:09.637' AS DateTime), N'hung2712271999@gmail', CAST(N'2021-03-11T11:03:09.637' AS DateTime), N'hung2712271999@gmail', 1, 2, N'hung271999', N'hung271999', NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (4, 0, 0, CAST(N'2021-03-11T11:04:40.380' AS DateTime), CAST(N'2021-03-11T11:04:40.380' AS DateTime), N'hung2712271999@gmail', CAST(N'2021-03-11T11:04:40.380' AS DateTime), N'hung2712271999@gmail', 0, 0, N'hung271999', N'hung271999', NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (5, 0, 0, CAST(N'2021-03-11T11:04:56.843' AS DateTime), CAST(N'2021-03-11T11:04:56.843' AS DateTime), N'hung2712271999@gmail', CAST(N'2021-03-11T11:04:56.843' AS DateTime), N'hung2712271999@gmail', 1, 2, N'hung271999', N'hung271999', NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (6, 0, 0, CAST(N'2021-03-11T11:06:49.973' AS DateTime), CAST(N'2021-03-11T11:06:49.973' AS DateTime), N'hung2712271999@gmail', CAST(N'2021-03-11T11:06:49.973' AS DateTime), N'hung2712271999@gmail', 1, 2, N'hung271999', N'hung271999', NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (7, 0, 0, CAST(N'2021-03-11T11:10:37.827' AS DateTime), CAST(N'2021-03-11T11:10:37.827' AS DateTime), N'hung2712271999@gmail', CAST(N'2021-03-11T11:10:37.827' AS DateTime), N'hung2712271999@gmail', 1, 2, N'hung271999', N'hung271999', NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (8, 0, 0, CAST(N'2021-03-11T11:11:36.223' AS DateTime), CAST(N'2021-03-11T11:11:36.223' AS DateTime), N'hung2712271999@gmail', CAST(N'2021-03-11T11:11:36.223' AS DateTime), N'hung2712271999@gmail', 1, 2, N'hung271999', N'hung271999', NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (9, 0, 0, CAST(N'2021-03-11T11:13:45.363' AS DateTime), CAST(N'2021-03-11T11:13:45.363' AS DateTime), N'hung2712271999@gmail', CAST(N'2021-03-11T11:13:45.363' AS DateTime), N'hung2712271999@gmail', 1, 2, N'hung271999', N'hung271999', NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (10, 0, 0, CAST(N'2021-03-11T11:20:10.860' AS DateTime), CAST(N'2021-03-11T11:20:10.860' AS DateTime), N'', CAST(N'2021-03-11T11:20:10.860' AS DateTime), N'', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (11, 0, 0, CAST(N'2021-03-11T11:34:14.093' AS DateTime), CAST(N'2021-03-11T11:34:14.093' AS DateTime), N'', CAST(N'2021-03-11T11:34:14.093' AS DateTime), N'', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (12, 0, 0, CAST(N'2021-03-11T11:34:37.257' AS DateTime), CAST(N'2021-03-11T11:34:37.257' AS DateTime), N'', CAST(N'2021-03-11T11:34:37.257' AS DateTime), N'', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (13, 0, 0, CAST(N'2021-03-11T11:36:31.110' AS DateTime), CAST(N'2021-03-11T11:36:31.110' AS DateTime), N'', CAST(N'2021-03-11T11:36:31.110' AS DateTime), N'', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (14, 0, 0, CAST(N'2021-03-11T11:44:28.090' AS DateTime), CAST(N'2021-03-11T11:44:28.090' AS DateTime), N'', CAST(N'2021-03-11T11:44:28.090' AS DateTime), N'', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (15, 0, 0, CAST(N'2021-03-11T11:46:37.660' AS DateTime), CAST(N'2021-03-11T11:46:37.660' AS DateTime), N'', CAST(N'2021-03-11T11:46:37.660' AS DateTime), N'', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (16, 0, 0, CAST(N'2021-03-11T11:47:56.840' AS DateTime), CAST(N'2021-03-11T11:47:56.840' AS DateTime), N'', CAST(N'2021-03-11T11:47:56.840' AS DateTime), N'', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (17, 0, 0, CAST(N'2021-03-11T11:48:09.407' AS DateTime), CAST(N'2021-03-11T11:48:09.407' AS DateTime), N'', CAST(N'2021-03-11T11:48:09.407' AS DateTime), N'', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (18, 0, 0, CAST(N'2021-03-11T11:48:50.823' AS DateTime), CAST(N'2021-03-11T11:48:50.823' AS DateTime), N'', CAST(N'2021-03-11T11:48:50.823' AS DateTime), N'', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (19, 0, 0, CAST(N'2021-03-11T11:49:14.007' AS DateTime), CAST(N'2021-03-11T11:49:14.007' AS DateTime), N'', CAST(N'2021-03-11T11:49:14.007' AS DateTime), N'', 3, 7, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (20, 0, 0, CAST(N'2021-03-11T11:49:38.500' AS DateTime), CAST(N'2021-03-11T11:49:38.500' AS DateTime), N'', CAST(N'2021-03-11T11:49:38.500' AS DateTime), N'', 4, 9, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (21, 0, 0, CAST(N'2021-03-11T11:51:42.293' AS DateTime), CAST(N'2021-03-11T11:51:42.293' AS DateTime), N'', CAST(N'2021-03-11T11:51:42.293' AS DateTime), N'', 5, 11, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (22, 0, 0, CAST(N'2021-03-11T11:55:05.450' AS DateTime), CAST(N'2021-03-11T11:55:05.450' AS DateTime), N'', CAST(N'2021-03-11T11:55:05.450' AS DateTime), N'', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (23, 0, 0, CAST(N'2021-03-11T11:55:54.820' AS DateTime), CAST(N'2021-03-11T11:55:54.820' AS DateTime), N'', CAST(N'2021-03-11T11:55:54.820' AS DateTime), N'', 2, 4, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (24, 0, 0, CAST(N'2021-03-11T11:56:48.847' AS DateTime), CAST(N'2021-03-11T11:56:48.847' AS DateTime), N'', CAST(N'2021-03-11T11:56:48.847' AS DateTime), N'', 3, 6, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (25, 0, 0, CAST(N'2021-03-11T12:13:45.280' AS DateTime), CAST(N'2021-03-11T12:13:45.280' AS DateTime), N'TrầnHùng', CAST(N'2021-03-11T12:13:45.280' AS DateTime), N'TrầnHùng', 1, 2, N'hung271999@gmail.com', N'568 Lê Văn Việt Phường Long Thạnh Mỹ TP.HCM', N'0396392414')
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (26, 0, 0, CAST(N'2021-03-11T12:14:48.800' AS DateTime), CAST(N'2021-03-11T12:14:48.800' AS DateTime), N'TrầnHùng', CAST(N'2021-03-11T12:14:48.800' AS DateTime), N'TrầnHùng', 2, 4, N'hung271999@gmail.com', N'568 Lê Văn Việt Phường Long Thạnh Mỹ TP.HCM', N'0396392414')
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (27, 0, 0, CAST(N'2021-03-11T12:15:24.347' AS DateTime), CAST(N'2021-03-11T12:15:24.347' AS DateTime), N'TrầnHùng', CAST(N'2021-03-11T12:15:24.347' AS DateTime), N'TrầnHùng', 2, 4, N'hung271999@gmail.com', N'568 Lê Văn Việt Phường Long Thạnh Mỹ TP.HCM', N'0396392414')
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (28, 0, 0, CAST(N'2021-03-11T12:15:40.483' AS DateTime), CAST(N'2021-03-11T12:15:40.483' AS DateTime), N'TrầnHùng', CAST(N'2021-03-11T12:15:40.483' AS DateTime), N'TrầnHùng', 2, 4, N'hung271999@gmail.com', N'568 Lê Văn Việt Phường Long Thạnh Mỹ TP.HCM', N'0396392414')
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (29, 0, 0, CAST(N'2021-03-11T12:15:51.583' AS DateTime), CAST(N'2021-03-11T12:15:51.583' AS DateTime), N'TrầnHùng', CAST(N'2021-03-11T12:15:51.583' AS DateTime), N'TrầnHùng', 2, 4, N'hung271999@gmail.com', N'568 Lê Văn Việt Phường Long Thạnh Mỹ TP.HCM', N'0396392414')
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (30, 0, 0, CAST(N'2021-03-11T12:16:48.240' AS DateTime), CAST(N'2021-03-11T12:16:48.240' AS DateTime), N'TrầnHùng', CAST(N'2021-03-11T12:16:48.240' AS DateTime), N'TrầnHùng', 1, 2, N'hung271999@gmail.com', N'568 Lê Văn Việt Phường Long Thạnh Mỹ TP.HCM', N'0396392414')
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (31, 0, 0, CAST(N'2021-03-16T11:32:00.003' AS DateTime), CAST(N'2021-03-16T11:32:00.003' AS DateTime), N'TrầnHùng', CAST(N'2021-03-16T11:32:00.003' AS DateTime), N'TrầnHùng', 1, 2, N'hung271999@gmail.com', N'568 Lê Văn Việt Phường Long Thạnh Mỹ TP.HCM', N'0396392414')
INSERT [dbo].[Order] ([OrderID], [Status], [Paid], [CreateDate], [ReceivedDate], [CreateUser], [UpdateDate], [UpdateUser], [Priority], [Total], [Email], [Address], [Phone]) VALUES (32, 0, 0, CAST(N'2021-03-16T15:37:28.347' AS DateTime), CAST(N'2021-03-16T15:37:28.347' AS DateTime), N'TrầnHùng', CAST(N'2021-03-16T15:37:28.347' AS DateTime), N'TrầnHùng', 1, 2, N'hung271999@gmail.com', N'568 Lê Văn Việt Phường Long Thạnh Mỹ TP.HCM', N'0396392414')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (1, 9, 1, 2.0000, N'10')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (2, 10, 1, 2.0000, N'10')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (3, 11, 1, 2.0000, N'11')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (4, 12, 1, 2.0000, N'10')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (5, 13, 1, 2.0000, N'11')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (6, 14, 1, 2.0000, N'10')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (7, 15, 1, 2.0000, N'11')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (8, 16, 1, 2.0000, N'11')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (9, 17, 1, 2.0000, N'11')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (10, 18, 1, 2.0000, N'11')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (11, 19, 2, 2.0000, N'11')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (12, 19, 1, 3.0000, N'12')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (13, 20, 3, 2.0000, N'11')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (14, 20, 1, 3.0000, N'12')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (15, 21, 4, 2.0000, N'11')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (16, 21, 1, 3.0000, N'12')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (17, 22, 1, 2.0000, N'10')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (18, 23, 1, 2.0000, N'10')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (19, 23, 1, 2.0000, N'11')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (20, 24, 1, 2.0000, N'10')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (21, 24, 2, 2.0000, N'11')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (22, 25, 1, 2.0000, N'10')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (23, 26, 1, 2.0000, N'10')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (24, 26, 1, 2.0000, N'11')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (25, 27, 1, 2.0000, N'10')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (26, 27, 1, 2.0000, N'11')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (27, 28, 1, 2.0000, N'10')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (28, 28, 1, 2.0000, N'11')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (29, 29, 1, 2.0000, N'10')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (30, 29, 1, 2.0000, N'11')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (31, 30, 1, 2.0000, N'11')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (32, 31, 1, 2.0000, N'10')
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [Quantity], [SellPrice], [ProductID]) VALUES (33, 32, 1, 2.0000, N'11')
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (1, N'TẦM NHÌN', N'Chúng tôi là Nhà lãnh đạo Kinh doanh Hạt giống về Ngô và Các loại cây trồng khác ở Nam Á thông qua Đổi mới, Chất lượng và Dịch vụ Xuất sắc của Nhóm Tiềm năng để Đáp ứng Nhu cầu của Khách hàng và Tối đa hóa Tính bền vững.', N'Chúng tôi là Nhà lãnh đạo Kinh doanh Hạt giống về Ngô và Các loại cây trồng khác ở Nam Á thông qua Đổi mới, Chất lượng và Dịch vụ Xuất sắc của Nhóm Tiềm năng để Đáp ứng Nhu cầu của Khách hàng và Tối đa hóa Tính bền vững.', 1, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'icon-our-2-637104842339843318.png', 1)
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (2, N'SỨ MỆNH', N'Sứ mệnh của CP Seeds (Ấn Độ) là cung cấp cho nông dân dịch vụ toàn diện thông qua phân tích chi tiết cây trồng, các giải pháp tùy chỉnh và ứng dụng chính xác bằng cách áp dụng khoa học, đổi mới và công nghệ. ', N'Bằng tất cả tình cảm và trách nhiệm của mình với cuộc sống con người và xã hội, Vinaseed cam kết mang đến các giải pháp phát triển nông nghiệp bền vững, nhằm thực hiện giấc mơ cải thiện thu nhập và điều kiện sống của nông dân Việt Nam.

', 1, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'icon-our-2-637104842339843318.png', 1)
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (3, N'GIÁ TRỊ CỐT LÕI', N'Chúng tập trung vào cam kết của chúng tôi nhằm phát triển bền vững và phát triển doanh nghiệp của chúng tôi với tinh thần và sự chính trực. ', N'Năng động – Sáng tạo – Chuyên nghiệp', 1, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'icon-our-3-637104842340624603.png', 1)
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (4, N'QUẢN TRỊ SẢN XUẤT NÔNG NGHIỆP THÔNG MINH 4.0', N' Nguyên tắc Ba Lợi ích là cốt lõi trong cách tiếp cận kinh doanh của chúng tôi.Chúng tôi tin chắc rằng chúng tôi có khả năng tạo ra sự thịnh vượng ở ba cấp độ: Thứ nhất cho các quốc gia nơi chúng tôi hoạt động, thứ hai cho các cộng đồng mà chúng tôi tham gia và thứ ba cho công ty của chúng tôi và người dân của nó.&nbsp;Nguyên tắc này hướng dẫn sự phát triển của chúng tôi và sau đó, các hành động của CP Group và người dân của chúng tôi, ở Thái Lan và ở tất cả các quốc gia mà chúng tôi hoạt động, không chỉ đóng góp vào sự phát triển của doanh nghiệp chúng tôi mà còn của toàn xã hội.                                    ', N' Nguyên tắc Ba Lợi ích là cốt lõi trong cách tiếp cận kinh doanh của chúng tôi.Chúng tôi tin chắc rằng chúng tôi có khả năng tạo ra sự thịnh vượng ở ba cấp độ: Thứ nhất cho các quốc gia nơi chúng tôi hoạt động, thứ hai cho các cộng đồng mà chúng tôi tham gia và thứ ba cho công ty của chúng tôi và người dân của nó.&nbsp;Nguyên tắc này hướng dẫn sự phát triển của chúng tôi và sau đó, các hành động của CP Group và người dân của chúng tôi, ở Thái Lan và ở tất cả các quốc gia mà chúng tôi hoạt động, không chỉ đóng góp vào sự phát triển của doanh nghiệp chúng tôi mà còn của toàn xã hội.                                    ', 2, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2-home-cong-nghe-637198921068236084.jpg', 0)
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (5, N'NGHIÊN CỨU, CHỌN TẠO, SẢN XUẤT KINH DOANH GIỐNG CÂY TRỒNG', N'QUẢN TRỊ SẢN XUẤT NÔNG NGHIỆP THÔNG MINH 4.0', N'CP Seed tập trung nghiên cứu, phát triển các dòng sản phẩm năng suất, chất lượng vượt trội, có khả năng thích ứng với biến đổi khí hậu toàn cầu, tiếp cận xu thế của thế giới về chuẩn sản phẩm an toàn và chất lượng', 2, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung.jpg', 0)
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (6, N'Tại sao chọn CP.Seed', N'QUẢN TRỊ SẢN XUẤT NÔNG NGHIỆP THÔNG MINH 4.0', N'Vinaseed tập trung nghiên cứu, phát triển các dòng sản phẩm năng suất, chất lượng vượt trội, có khả năng thích ứng với biến đổi khí hậu toàn cầu, tiếp cận xu thế của thế giới về chuẩn sản phẩm an toàn và chất lượng', 3, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'vinaseed-icon-27-637198739904712262.png', 0)
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (7, N'Mức lương', N'QUẢN TRỊ SẢN XUẤT NÔNG NGHIỆP THÔNG MINH 4.0', N'Vinaseed tập trung nghiên cứu, phát triển các dòng sản phẩm năng suất, chất lượng vượt trội, có khả năng thích ứng với biến đổi khí hậu toàn cầu, tiếp cận xu thế của thế giới về chuẩn sản phẩm an toàn và chất lượng', 3, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'vinaseed-icon-26-637198739904868520.png', 0)
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (8, N'Quy trình tuyển dụng', N'QUẢN TRỊ SẢN XUẤT NÔNG NGHIỆP THÔNG MINH 4.0', N'Vinaseed tập trung nghiên cứu, phát triển các dòng sản phẩm năng suất, chất lượng vượt trội, có khả năng thích ứng với biến đổi khí hậu toàn cầu, tiếp cận xu thế của thế giới về chuẩn sản phẩm an toàn và chất lượng', 3, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'vinaseed-icon-26-637198739904868520.png', 0)
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (9, N'Nộp hồ sơ ', N'QUẢN TRỊ SẢN XUẤT NÔNG NGHIỆP THÔNG MINH 4.0', N'Vinaseed tập trung nghiên cứu, phát triển các dòng sản phẩm năng suất, chất lượng vượt trội, có khả năng thích ứng với biến đổi khí hậu toàn cầu, tiếp cận xu thế của thế giới về chuẩn sản phẩm an toàn và chất lượng', 3, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'vinaseed-icon-26-637198739904868520.png', 0)
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (10, N'QUẢN TRỊ SẢN XUẤT NÔNG NGHIỆP THÔNG MINH 4.0', N' Nguyên tắc Ba Lợi ích là cốt lõi trong cách tiếp cận kinh doanh của chúng tôi.Chúng tôi tin chắc rằng chúng tôi có khả năng tạo ra sự thịnh vượng ở ba cấp độ: Thứ nhất cho các quốc gia nơi chúng tôi hoạt động, thứ hai cho các cộng đồng mà chúng tôi tham gia và thứ ba cho công ty của chúng tôi và người dân của nó.&nbsp;Nguyên tắc này hướng dẫn sự phát triển của chúng tôi và sau đó, các hành động của CP Group và người dân của chúng tôi, ở Thái Lan và ở tất cả các quốc gia mà chúng tôi hoạt động, không chỉ đóng góp vào sự phát triển của doanh nghiệp chúng tôi mà còn của toàn xã hội.                                    ', N' Nguyên tắc Ba Lợi ích là cốt lõi trong cách tiếp cận kinh doanh của chúng tôi.Chúng tôi tin chắc rằng chúng tôi có khả năng tạo ra sự thịnh vượng ở ba cấp độ: Thứ nhất cho các quốc gia nơi chúng tôi hoạt động, thứ hai cho các cộng đồng mà chúng tôi tham gia và thứ ba cho công ty của chúng tôi và người dân của nó.&nbsp;Nguyên tắc này hướng dẫn sự phát triển của chúng tôi và sau đó, các hành động của CP Group và người dân của chúng tôi, ở Thái Lan và ở tất cả các quốc gia mà chúng tôi hoạt động, không chỉ đóng góp vào sự phát triển của doanh nghiệp chúng tôi mà còn của toàn xã hội.                                    ', 2, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'1', N'Ngô lai CP 989', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 1.0000, 1, 1, 0, CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'hung', N'1.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'10', N'Ngô lai CP 508', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 2.0000, 1, 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'2.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'11', N'Ngô lai CP 333', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 2.0000, 1, 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'3.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'12', N'Ngô lai CP 805', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 3.0000, 1, 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'4.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'13', N'Ngô lai CP 555', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 4.0000, 1, 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'14.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'14', N'Ngô lai CP 666', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 5.0000, 1, 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'6.png', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'15', N'Ngô lai CP 222', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 1.0000, 1, 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'7.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'16', N'Ngô lai CP 999', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 6.0000, 1, 1, 0, CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'8.jpg', N'đáo hạn sớn')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'17', N'Ngô lai CP 444', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 7.0000, 1, 1, 0, CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'1.jpg', N'đáo hạn sớn')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'18', N'Phân bón CP B468', N'21', N'21', 2, N'1', N'2', 500.0000, 600.0000, 0.0000, 8.0000, 2, 1, 0, CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'9.jpg', N'đáo hạn sớn')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'2', N'Phân bón CP B4625', N'21', N'21', 2, N'1', N'2', 500.0000, 600.0000, 0.0000, 9.0000, 2, 1, 0, CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'10.jpg', N'đáo hạn sớn')
GO
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [TaxPercent], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image]) VALUES (1, N'ngo', 121, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'2021-02-01 00:00:00.000', N'a.jpg')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [TaxPercent], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image]) VALUES (2, N'Phân bón', 121, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'2021-02-01 00:00:00.000', N'd.jpg')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [TaxPercent], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image]) VALUES (3, N'Rau', 121, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'2021-02-01 00:00:00.000', N'f.jpg')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [TaxPercent], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image]) VALUES (4, N'Bông hoa', 121, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'2021-02-01 00:00:00.000', N'b.jpg')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [TaxPercent], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image]) VALUES (5, N'Sắn', 121, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'2021-02-01 00:00:00.000', N'e.jpg')
GO
INSERT [dbo].[Slide] ([SlideID], [url], [contents], [image], [Status], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser]) VALUES (1, N'https://handsomeroot.blogspot.com/2015/10/share-csdl-quan-ly-shop-online.html', N'', N'banner2.jpg', 1, CAST(N'2021-02-23T00:00:00.000' AS DateTime), CAST(N'2021-02-23T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-23T00:00:00.000' AS DateTime), N'hung')
INSERT [dbo].[Slide] ([SlideID], [url], [contents], [image], [Status], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser]) VALUES (2, N'https://handsomeroot.blogspot.com/2015/10/share-csdl-quan-ly-shop-online.html', N'', N'banner1.jpg', 1, CAST(N'2021-02-23T00:00:00.000' AS DateTime), CAST(N'2021-02-23T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-23T00:00:00.000' AS DateTime), N'hung')
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
