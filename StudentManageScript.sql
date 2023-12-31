GO
/****** Object:  Database [StudentManage]    Script Date: 17/12/2023 8:31:46 PM ******/
CREATE DATABASE [StudentManage]
GO
USE [StudentManage]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17/12/2023 8:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[professor]    Script Date: 17/12/2023 8:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[professor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](30) NOT NULL,
	[middle_name] [nvarchar](30) NULL,
	[last_name] [nvarchar](30) NOT NULL,
	[subject_id] [int] NOT NULL,
 CONSTRAINT [PK_professor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[professor_contact]    Script Date: 17/12/2023 8:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[professor_contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[phone] [nvarchar](11) NULL,
	[email] [nvarchar](max) NULL,
	[address] [nvarchar](150) NULL,
 CONSTRAINT [PK_professor_contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 17/12/2023 8:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](30) NOT NULL,
	[middle_name] [nvarchar](30) NULL,
	[last_name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_contact]    Script Date: 17/12/2023 8:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[phone] [nvarchar](11) NULL,
	[email] [nvarchar](max) NULL,
	[address] [nvarchar](150) NULL,
 CONSTRAINT [PK_student_contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 17/12/2023 8:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](40) NOT NULL,
	[description] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_subject] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject_student]    Script Date: 17/12/2023 8:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject_student](
	[subject_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[student_grade_1] [int] NOT NULL,
	[student_grade_2] [int] NOT NULL,
 CONSTRAINT [subject_student_entity_PK] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC,
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_professor_subject_id]    Script Date: 17/12/2023 8:31:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_professor_subject_id] ON [dbo].[professor]
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_professor_contact_user_id]    Script Date: 17/12/2023 8:31:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_professor_contact_user_id] ON [dbo].[professor_contact]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_student_contact_user_id]    Script Date: 17/12/2023 8:31:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_student_contact_user_id] ON [dbo].[student_contact]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_subject_student_subject_id]    Script Date: 17/12/2023 8:31:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_subject_student_subject_id] ON [dbo].[subject_student]
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[subject_student] ADD  DEFAULT ((0)) FOR [student_grade_2]
GO
ALTER TABLE [dbo].[professor]  WITH CHECK ADD  CONSTRAINT [FK_professor_subject_subject_id] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subject] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[professor] CHECK CONSTRAINT [FK_professor_subject_subject_id]
GO
ALTER TABLE [dbo].[professor_contact]  WITH CHECK ADD  CONSTRAINT [FK_professor_contact_professor_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[professor] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[professor_contact] CHECK CONSTRAINT [FK_professor_contact_professor_user_id]
GO
ALTER TABLE [dbo].[student_contact]  WITH CHECK ADD  CONSTRAINT [FK_student_contact_student_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[student] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[student_contact] CHECK CONSTRAINT [FK_student_contact_student_user_id]
GO
ALTER TABLE [dbo].[subject_student]  WITH CHECK ADD  CONSTRAINT [FK_subject_student_student_student_id] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[subject_student] CHECK CONSTRAINT [FK_subject_student_student_student_id]
GO
ALTER TABLE [dbo].[subject_student]  WITH CHECK ADD  CONSTRAINT [FK_subject_student_subject_subject_id] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subject] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[subject_student] CHECK CONSTRAINT [FK_subject_student_subject_subject_id]
GO
USE [master]
GO
ALTER DATABASE [StudentManage] SET  READ_WRITE 
GO
