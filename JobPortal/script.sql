CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 7/21/2024 12:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/21/2024 12:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CatId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 7/21/2024 12:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[SId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 7/21/2024 12:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[JobProfileId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 7/21/2024 12:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 7/21/2024 12:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Gender] [int] NULL,
	[JobProfileId] [int] NOT NULL,
	[SkillsId] [int] NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Mobno] [bigint] NOT NULL,
	[Age] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[StateId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobPosts]    Script Date: 7/21/2024 12:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobPosts](
	[JobPostId] [int] IDENTITY(1,1) NOT NULL,
	[JobProfileId] [int] NOT NULL,
	[MinExp] [int] NOT NULL,
	[MaxExp] [int] NOT NULL,
	[MinSal] [int] NOT NULL,
	[MaxSal] [int] NOT NULL,
	[NoOfVac] [int] NOT NULL,
	[NoticePeriod] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_JobPosts] PRIMARY KEY CLUSTERED 
(
	[JobPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobProfile]    Script Date: 7/21/2024 12:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobProfile](
	[JPId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_JobProfile] PRIMARY KEY CLUSTERED 
(
	[JPId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 7/21/2024 12:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[SklId] [int] IDENTITY(1,1) NOT NULL,
	[JPId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED 
(
	[SklId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 7/21/2024 12:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[SId] [int] IDENTITY(1,1) NOT NULL,
	[CId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[SId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240402084137_Init', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240629094420_Dob', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240629095531_DelDob', N'8.0.3')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2a89ec81-25ad-4e4b-b70a-eb97533bd88c', N'gk231652@gmail.com', N'GK231652@GMAIL.COM', N'gk231652@gmail.com', N'GK231652@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEBRDG6P0rze2RFYWnAwhOG/Zz6B6tSje4+xR4NDyleAPPKrCcXBTUVeWVYaRE6JBNQ==', N'CGKJU63UXBQPXOY6AJ6LYGA7CCSLPBXT', N'05a2de1b-f505-4618-a970-e823625ca61d', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e7795f3d-078b-4212-b1d0-df4f98956746', N'gulshankumar.mailid01@gmail.com', N'GULSHANKUMAR.MAILID01@GMAIL.COM', N'gulshankumar.mailid01@gmail.com', N'GULSHANKUMAR.MAILID01@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEA9H0yFfN6AXxIf6eSQnJKfw1ULcw6gOUsQIfL4OCMaw+V8kukyM15P8rIUwt0TOIw==', N'QDUK3JFPOQMS237CJOQ4BCMSXAFV6YS2', N'6a908fbb-0dd0-4289-b08e-09f51c75246a', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (1, 1, N'New Delhi')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (2, 1, N'Mehrauli')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (3, 1, N'Firozabad')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (4, 2, N'Lacknow')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (5, 2, N'Agra')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (6, 2, N'Varanasi')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (7, 3, N'Ludhiana')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (8, 3, N'Amritsar')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (9, 3, N'Mohali')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (10, 4, N'Alampur Zafarabad')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (11, 4, N'Bahedi')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (12, 4, N'Bhadpura')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (13, 5, N'Gomti Nagar')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (14, 5, N'Jankipuram')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (15, 5, N'Indira Nagar')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (16, 6, N'Shahabad')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (17, 6, N'Sawayajpur')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (18, 6, N'Bilgram')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (19, 7, N'Los Angeles')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (20, 7, N'San Francisco')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (21, 7, N'San Diego')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (22, 8, N'Houston')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (23, 8, N'Austin')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (24, 8, N'Dallas')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (25, 9, N'Miami')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (26, 9, N'Orlando')
INSERT [dbo].[Cities] ([CityId], [SId], [Name]) VALUES (27, 9, N'Tampa')
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
Select * From Skills
GO
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([SklId], [JPId], [Name]) VALUES (1, 1, N'Problem-solving')
INSERT [dbo].[Skills] ([SklId], [JPId], [Name]) VALUES (2, 1, N'Databases')
INSERT [dbo].[Skills] ([SklId], [JPId], [Name]) VALUES (3, 1, N'Time management')
INSERT [dbo].[Skills] ([SklId], [JPId], [Name]) VALUES (4, 2, N'Programming languages')
INSERT [dbo].[Skills] ([SklId], [JPId], [Name]) VALUES (5, 2, N'Project management')
INSERT [dbo].[Skills] ([SklId], [JPId], [Name]) VALUES (6, 2, N'Problem solving and debugging')
INSERT [dbo].[Skills] ([SklId], [JPId], [Name]) VALUES (7, 3, N'Web Frameworks')
INSERT [dbo].[Skills] ([SklId], [JPId], [Name]) VALUES (8, 3, N'DevOps')
INSERT [dbo].[Skills] ([SklId], [JPId], [Name]) VALUES (9, 3, N'Continuous Integration')

SET IDENTITY_INSERT [dbo].[Cities] OFF
GO


SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([Id], [Name], [Email], [Password], [Comment], [JobProfileId], [Status]) VALUES (1, N'Gulshan Kumar', N'gulshankumar.mailid01@gmail.com', N'Gulshan@123', N'Thanks', 1, 1)
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CId], [Name]) VALUES (1, N'India')
INSERT [dbo].[Countries] ([CId], [Name]) VALUES (2, N'Shrilanka')
INSERT [dbo].[Countries] ([CId], [Name]) VALUES (3, N'USA')
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[JobPosts] ON 

INSERT [dbo].[JobPosts] ([JobPostId], [JobProfileId], [MinExp], [MaxExp], [MinSal], [MaxSal], [NoOfVac], [NoticePeriod], [Comment], [InsertedDate], [Status]) VALUES (1, 1, 2, 5, 25000, 50000, 5, 15, N'Thanks', CAST(N'2024-04-01T15:40:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[JobPosts] OFF
GO
SET IDENTITY_INSERT [dbo].[JobProfile] ON 

INSERT [dbo].[JobProfile] ([JPId], [Name]) VALUES (1, N'Dotnet')
INSERT [dbo].[JobProfile] ([JPId], [Name]) VALUES (2, N'Php')
INSERT [dbo].[JobProfile] ([JPId], [Name]) VALUES (3, N'Python')
SET IDENTITY_INSERT [dbo].[JobProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[States] ON 

INSERT [dbo].[States] ([SId], [CId], [Name]) VALUES (1, 1, N'Delhi')
INSERT [dbo].[States] ([SId], [CId], [Name]) VALUES (2, 1, N'Uttar Pradeh')
INSERT [dbo].[States] ([SId], [CId], [Name]) VALUES (3, 1, N'Punjab')
INSERT [dbo].[States] ([SId], [CId], [Name]) VALUES (4, 2, N'Colombo')
INSERT [dbo].[States] ([SId], [CId], [Name]) VALUES (5, 2, N'Gampaha')
INSERT [dbo].[States] ([SId], [CId], [Name]) VALUES (6, 2, N'Kalutara')
INSERT [dbo].[States] ([SId], [CId], [Name]) VALUES (7, 3, N'California')
INSERT [dbo].[States] ([SId], [CId], [Name]) VALUES (8, 3, N'Texas')
INSERT [dbo].[States] ([SId], [CId], [Name]) VALUES (9, 3, N'Florida')
SET IDENTITY_INSERT [dbo].[States] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 7/21/2024 12:46:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/21/2024 12:46:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 7/21/2024 12:46:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 7/21/2024 12:46:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 7/21/2024 12:46:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 7/21/2024 12:46:37 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/21/2024 12:46:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [JobPortalCOREDB] SET  READ_WRITE 
GO
