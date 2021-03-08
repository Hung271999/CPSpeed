USE [CPSeed]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[Contactus]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[Images]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[Inventory]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[InventoryHistory]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[Invoice]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[NewDetail]    Script Date: 08/03/2021 16:38:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewDetail](
	[NewDetailID] [int] NOT NULL,
	[Title] [ntext] NULL,
	[Summary] [ntext] NULL,
	[contents] [ntext] NULL,
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
 CONSTRAINT [PK_NewDetail] PRIMARY KEY CLUSTERED 
(
	[NewDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[Posts]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[ProductType]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[ProductUnit]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[Promotion]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[Provider]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[Slide]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[Store]    Script Date: 08/03/2021 16:38:10 ******/
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
/****** Object:  Table [dbo].[Unit]    Script Date: 08/03/2021 16:38:10 ******/
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
SET IDENTITY_INSERT [dbo].[Contactus] OFF
GO
INSERT [dbo].[Images] ([ImagesID], [url], [ProductID]) VALUES (1, N'img-pro-03.jpg', N'1')
INSERT [dbo].[Images] ([ImagesID], [url], [ProductID]) VALUES (2, N'img-pro-04.jpg', N'1')
INSERT [dbo].[Images] ([ImagesID], [url], [ProductID]) VALUES (3, N'img-pro-01.jpg', N'1')
INSERT [dbo].[Images] ([ImagesID], [url], [ProductID]) VALUES (4, N'img-pro-04.jpg', N'1')
INSERT [dbo].[Images] ([ImagesID], [url], [ProductID]) VALUES (5, N'img-pro-01.jpg', N'1')
GO
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [contents], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (1, N'Tin mới trong ngày', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', N'Vinaseed ph?n d?u tr? thành T?p doàn cung c?p các gi?i pháp phát tri?n nông nghi?p b?n v?ng hàng d?u Vi?t Nam, th?c hi?n gi?c mo c?i thi?n thu nh?p và di?u ki?n s?ng c?a nông dân Vi?t Nam.', 1, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'2231.jpg', 0)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [contents], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (2, N'Tin hay', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', N'Vinaseed ph?n d?u tr? thành T?p doàn cung c?p các gi?i pháp phát tri?n nông nghi?p b?n v?ng hàng d?u Vi?t Nam, th?c hi?n gi?c mo c?i thi?n thu nh?p và di?u ki?n s?ng c?a nông dân Vi?t Nam.', 1, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'2231.jpg', 0)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [contents], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (3, N'Sự kiện 1', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', N'Vinaseed ph?n d?u tr? thành T?p doàn cung c?p các gi?i pháp phát tri?n nông nghi?p b?n v?ng hàng d?u Vi?t Nam, th?c hi?n gi?c mo c?i thi?n thu nh?p và di?u ki?n s?ng c?a nông dân Vi?t Nam.', 1, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'2231.jpg', 0)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [contents], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (4, N'Tin mới trong ngày thủ tướng', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', N'Vinaseed ph?n d?u tr? thành T?p doàn cung c?p các gi?i pháp phát tri?n nông nghi?p b?n v?ng hàng d?u Vi?t Nam, th?c hi?n gi?c mo c?i thi?n thu nh?p và di?u ki?n s?ng c?a nông dân Vi?t Nam.', 2, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'2231.jpg', 0)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [contents], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (5, N'THƯ CHÚC MỪNG NĂM MỚI CỦA CHỦ TỊCH HĐQT TẬP ĐOÀN', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', N'Vinaseed ph?n d?u tr? thành T?p doàn cung c?p các gi?i pháp phát tri?n nông nghi?p b?n v?ng hàng d?u Vi?t Nam, th?c hi?n gi?c mo c?i thi?n thu nh?p và di?u ki?n s?ng c?a nông dân Vi?t Nam.', 2, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'2231.jpg', 1)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [contents], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (6, N'LỄ KHÁNH THÀNH TRUNG TÂM CÔNG NGHIỆP CHẾ BIẾN HẠT GIỐNG VÀ NÔNG SẢN HIỆN ĐẠI BẬC NHẤT', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', N'Vinaseed ph?n d?u tr? thành T?p doàn cung c?p các gi?i pháp phát tri?n nông nghi?p b?n v?ng hàng d?u Vi?t Nam, th?c hi?n gi?c mo c?i thi?n thu nh?p và di?u ki?n s?ng c?a nông dân Vi?t Nam.', 3, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'2231.jpg', 1)
INSERT [dbo].[NewDetail] ([NewDetailID], [Title], [Summary], [contents], [NewsID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (7, N'Tin hay2', N'60 tấn gạo Việt Nam đầu tiên được nhập khẩu vào Anh theo UKVFTA', N'Vinaseed ph?n d?u tr? thành T?p doàn cung c?p các gi?i pháp phát tri?n nông nghi?p b?n v?ng hàng d?u Vi?t Nam, th?c hi?n gi?c mo c?i thi?n thu nh?p và di?u ki?n s?ng c?a nông dân Vi?t Nam.', 3, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'2231.jpg', 1)
GO
INSERT [dbo].[News] ([NewsID], [Title], [Status], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser]) VALUES (1, N'Tin tức', 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999')
INSERT [dbo].[News] ([NewsID], [Title], [Status], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser]) VALUES (2, N'Sự kiện', 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999')
INSERT [dbo].[News] ([NewsID], [Title], [Status], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser]) VALUES (3, N'Thư viện', 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung2719999')
GO
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (1, N'TẦM NHÌN', N'naseed phấn đấu trở thành Tập đoàn cung cấp các giải pháp phát triển nông nghiệp bền vững hàng đầu Việt Nam', N'Vinaseed ph?n d?u tr? thành T?p doàn cung c?p các gi?i pháp phát tri?n nông nghi?p b?n v?ng hàng d?u Vi?t Nam, th?c hi?n gi?c mo c?i thi?n thu nh?p và di?u ki?n s?ng c?a nông dân Vi?t Nam.', 1, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'icon-our-2-637104842339843318.png', 1)
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (2, N'SỨ MỆNH', N'Bằng tất cả tình cảm và trách nhiệm của mình với cuộc sống con người và xã hội, Vinaseed cam kết mang đến các giải pháp phát triển nông nghiệp bền vững, nhằm thực hiện giấc mơ cải thiện thu nhập và điều kiện sống của nông dân Việt Nam.

', N'Bằng tất cả tình cảm và trách nhiệm của mình với cuộc sống con người và xã hội, Vinaseed cam kết mang đến các giải pháp phát triển nông nghiệp bền vững, nhằm thực hiện giấc mơ cải thiện thu nhập và điều kiện sống của nông dân Việt Nam.

', 1, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'icon-our-2-637104842339843318.png', 1)
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (3, N'GIÁ TRỊ CỐT LÕI', N'Năng động – Sáng tạo – Chuyên nghiệp', N'Năng động – Sáng tạo – Chuyên nghiệp', 1, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'icon-our-3-637104842340624603.png', 1)
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (4, N'QUẢN TRỊ SẢN XUẤT NÔNG NGHIỆP THÔNG MINH 4.0', N'QUẢN TRỊ SẢN XUẤT NÔNG NGHIỆP THÔNG MINH 4.0', N'Xây dựng phương thức quản trị sản xuất nông nghiệp tiên tiến,  ứng dụng các giải pháp canh tác bền vững tiết kiệm tài nguyên, có truy xuất nguồn gốc, sử dụng các chế phẩm và thuốc BVTV có nguồn gốc sinh học thế hệ mới góp phần giảm hiệu ứng nhà kính, giảm tồn dư hóa chất và hàm lượng Nitorat trong sản phẩm, thực hiện cơ giới hóa trong sản xuất và chế biến.  Hỗ trợ các doanh nghiệp vừa và nhỏ, các HTX, hộ nông dân tham gia chuỗi liên kết sản xuất nông sản của Vinaseed để hình thành các vùng sản xuất nông nghiệp tập trung quy mô lớn, góp phần đem lại thu nhập ổn định cho người nông dân.', 2, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2-home-cong-nghe-637198921068236084.jpg', 0)
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (5, N'NGHIÊN CỨU, CHỌN TẠO, SẢN XUẤT KINH DOANH GIỐNG CÂY TRỒNG', N'QUẢN TRỊ SẢN XUẤT NÔNG NGHIỆP THÔNG MINH 4.0', N'Vinaseed tập trung nghiên cứu, phát triển các dòng sản phẩm năng suất, chất lượng vượt trội, có khả năng thích ứng với biến đổi khí hậu toàn cầu, tiếp cận xu thế của thế giới về chuẩn sản phẩm an toàn và chất lượng', 2, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2.png', 0)
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (6, N'Tại sao chọn CP.Seed', N'QUẢN TRỊ SẢN XUẤT NÔNG NGHIỆP THÔNG MINH 4.0', N'Vinaseed tập trung nghiên cứu, phát triển các dòng sản phẩm năng suất, chất lượng vượt trội, có khả năng thích ứng với biến đổi khí hậu toàn cầu, tiếp cận xu thế của thế giới về chuẩn sản phẩm an toàn và chất lượng', 3, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'vinaseed-icon-27-637198739904712262.png', 0)
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (7, N'Mức lương', N'QUẢN TRỊ SẢN XUẤT NÔNG NGHIỆP THÔNG MINH 4.0', N'Vinaseed tập trung nghiên cứu, phát triển các dòng sản phẩm năng suất, chất lượng vượt trội, có khả năng thích ứng với biến đổi khí hậu toàn cầu, tiếp cận xu thế của thế giới về chuẩn sản phẩm an toàn và chất lượng', 3, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'vinaseed-icon-26-637198739904868520.png', 0)
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (8, N'Quy trình tuyển dụng', N'QUẢN TRỊ SẢN XUẤT NÔNG NGHIỆP THÔNG MINH 4.0', N'Vinaseed tập trung nghiên cứu, phát triển các dòng sản phẩm năng suất, chất lượng vượt trội, có khả năng thích ứng với biến đổi khí hậu toàn cầu, tiếp cận xu thế của thế giới về chuẩn sản phẩm an toàn và chất lượng', 3, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'vinaseed-icon-26-637198739904868520.png', 0)
INSERT [dbo].[Posts] ([PostID], [Title], [Summary], [contents], [CategoryID], [Status], [IsDeleted], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [Priority]) VALUES (9, N'Nộp hồ sơ ', N'QUẢN TRỊ SẢN XUẤT NÔNG NGHIỆP THÔNG MINH 4.0', N'Vinaseed tập trung nghiên cứu, phát triển các dòng sản phẩm năng suất, chất lượng vượt trội, có khả năng thích ứng với biến đổi khí hậu toàn cầu, tiếp cận xu thế của thế giới về chuẩn sản phẩm an toàn và chất lượng', 3, 1, NULL, CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'2021-02-01 00:00:00.000', CAST(N'2021-02-01T00:00:00.000' AS DateTime), NULL, N'vinaseed-icon-26-637198739904868520.png', 0)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'1', N'hung', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 1.0000, 1, 1, 0, CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'hung', N'img-pro-02.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'10', N'Ngô lai 6', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 2.0000, 1, 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'img-pro-02.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'11', N'Ngô lai 6', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 2.0000, 1, 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'img-pro-02.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'12', N'Ngô lai 6', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 3.0000, 1, 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'img-pro-02.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'13', N'Ngô lai 6', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 4.0000, 1, 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'img-pro-02.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'14', N'Ngô lai 6', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 5.0000, 1, 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'img-pro-02.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'15', N'Ngô lai 6', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 1.0000, 1, 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'img-pro-02.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'16', N'Ngô lai CP508', N'21', N'21', 2, N'1', N'2', 500.0000, 600.0000, 0.0000, 6.0000, 1, 1, 0, CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'img-pro-03.jpg', N'đáo hạn sớn')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'17', N'Ngô lai CP508', N'21', N'21', 2, N'1', N'2', 500.0000, 600.0000, 0.0000, 7.0000, 1, 1, 0, CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'img-pro-03.jpg', N'đáo hạn sớn')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'18', N'Ngô lai CP508', N'21', N'21', 2, N'1', N'2', 500.0000, 600.0000, 0.0000, 8.0000, 1, 1, 0, CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'img-pro-03.jpg', N'đáo hạn sớn')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'2', N'Ngô lai CP508', N'21', N'21', 2, N'1', N'2', 500.0000, 600.0000, 0.0000, 9.0000, 1, 1, 0, CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'img-pro-03.jpg', N'đáo hạn sớn')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'3', N'Ngô lai CP555', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 10.0000, 1, 1, 0, CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'hung', N'img-pro-01.jpg', N'Khả năng thích ứng rộng')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'4', N'Ngô lai 1', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 11.0000, 1, 1, 0, CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'hung', N'img-pro-04.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'5', N'Ngô lai 2', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 12.0000, 1, 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-03-08T00:00:00.000' AS DateTime), N'hung', N'img-pro-01.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'6', N'Ngô lai 3', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 13.0000, 1, 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'img-pro-02.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'7', N'Ngô lai 4', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 14.0000, 1, 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'img-pro-03.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'8', N'Ngô lai 5', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 15.0000, 1, 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'img-pro-04.jpg', N'Năng suất cao')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitID], [UnitName], [ProductTypeID], [ProviderID], [ProviderName], [BuyPriceCurrent], [BuyPricePrevious], [BuyPriceAverage], [SellPrice], [ExportBuy], [ExportOffer], [IsDeleted], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image], [description]) VALUES (N'9', N'Ngô lai 6', N'21', N'21', 1, N'1', N'2', 500.0000, 600.0000, 0.0000, 16.0000, 1, 1, 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', N'img-pro-02.jpg', N'Năng suất cao')
GO
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [TaxPercent], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image]) VALUES (1, N'Vật tư và dịch vụ nông nghiệp', 121, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'2021-02-01 00:00:00.000', N'img-pro-01.jpg')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [TaxPercent], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image]) VALUES (2, N'Nông sản an toàn', 121, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'2021-02-01 00:00:00.000', N'img-pro-02.jpg')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [TaxPercent], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image]) VALUES (3, N'Giống cây trồng', 121, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'2021-02-01 00:00:00.000', N'img-pro-03.jpg')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [TaxPercent], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image]) VALUES (4, N'Thức ăn sạch', 121, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'2021-02-01 00:00:00.000', N'img-pro-04.jpg')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [TaxPercent], [CreateDate], [CreateUser], [UpdateDate], [UpdateUser], [image]) VALUES (5, N'Gà sạch', 121, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'2021-02-01 00:00:00.000', N'img-pro-02.jpg')
GO
INSERT [dbo].[Slide] ([SlideID], [url], [contents], [image], [Status], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser]) VALUES (1, N'https://handsomeroot.blogspot.com/2015/10/share-csdl-quan-ly-shop-online.html', N'', N'SLICE_SMALL_BANNER_6.jpg', 1, CAST(N'2021-02-23T00:00:00.000' AS DateTime), CAST(N'2021-02-23T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-23T00:00:00.000' AS DateTime), N'hung')
INSERT [dbo].[Slide] ([SlideID], [url], [contents], [image], [Status], [CreateDate], [PublicDate], [CreateUser], [UpdateDate], [UpdateUser]) VALUES (2, N'https://handsomeroot.blogspot.com/2015/10/share-csdl-quan-ly-shop-online.html', N'', N'SLICE_SMALL_BANNER_4.jpg', 1, CAST(N'2021-02-23T00:00:00.000' AS DateTime), CAST(N'2021-02-23T00:00:00.000' AS DateTime), N'hung', CAST(N'2021-02-23T00:00:00.000' AS DateTime), N'hung')
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
