-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 24, 2024 at 09:03 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `EmployeeDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `AspNetRoleClaims`
--

CREATE TABLE `AspNetRoleClaims` (
  `Id` int(11) NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AspNetRoles`
--

CREATE TABLE `AspNetRoles` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `AspNetRoles`
--

INSERT INTO `AspNetRoles` (`Id`, `Name`, `NormalizedName`, `ConcurrencyStamp`) VALUES
('ac605355-9fd4-4ba5-8ee8-9e36ab463431', 'TestRole', 'TESTROLE', NULL),
('cde5f1db-bc0b-4f8a-8a42-cdfc2f472a56', 'Admin', 'ADMIN', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `AspNetUserClaims`
--

CREATE TABLE `AspNetUserClaims` (
  `Id` int(11) NOT NULL,
  `UserId` varchar(255) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `AspNetUserClaims`
--

INSERT INTO `AspNetUserClaims` (`Id`, `UserId`, `ClaimType`, `ClaimValue`) VALUES
(179, 'f01e48dc-84cd-4b82-a0d4-a97d37303f21', 'Edit Role', 'true'),
(190, '384b7b75-0ae0-4a53-bff8-08e4ea42dafe', 'Create Role', 'true'),
(192, '384b7b75-0ae0-4a53-bff8-08e4ea42dafe', 'Delete Role', 'true'),
(193, '384b7b75-0ae0-4a53-bff8-08e4ea42dafe', 'Edit Role', 'false'),
(211, '8e498896-09f0-4c8c-847b-2eac04ff2557', 'Delete Role', 'false'),
(214, '8e498896-09f0-4c8c-847b-2eac04ff2557', 'Create Role', 'false'),
(215, '8e498896-09f0-4c8c-847b-2eac04ff2557', 'Edit Role', 'false'),
(216, '6fdf9acc-3815-4b0e-8e45-42caad06d636', 'Create Role', 'true'),
(218, '6fdf9acc-3815-4b0e-8e45-42caad06d636', 'Edit Role', 'false'),
(219, '6fdf9acc-3815-4b0e-8e45-42caad06d636', 'Delete Role', 'false'),
(220, 'db37392c-fc45-479b-b373-63b5dbd84664', 'Create Role', 'false'),
(221, 'db37392c-fc45-479b-b373-63b5dbd84664', 'Edit Role', 'false'),
(222, 'db37392c-fc45-479b-b373-63b5dbd84664', 'Delete Role', 'false'),
(224, '1ddaa01f-db81-4261-b14b-d24f0ff0b6fb', 'Edit Role', 'false'),
(225, '1ddaa01f-db81-4261-b14b-d24f0ff0b6fb', 'Delete Role', 'false'),
(230, 'a99aad9d-99a2-45d4-a834-94bb95cbfa73', 'Delete Role', 'false'),
(231, 'a99aad9d-99a2-45d4-a834-94bb95cbfa73', 'Edit Role', 'true'),
(232, 'a99aad9d-99a2-45d4-a834-94bb95cbfa73', 'Create Role', 'false'),
(233, 'f01e48dc-84cd-4b82-a0d4-a97d37303f21', 'Create Role', 'false'),
(234, 'f01e48dc-84cd-4b82-a0d4-a97d37303f21', 'Delete Role', 'false'),
(235, '1ddaa01f-db81-4261-b14b-d24f0ff0b6fb', 'Create Role', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `AspNetUserLogins`
--

CREATE TABLE `AspNetUserLogins` (
  `LoginProvider` varchar(255) NOT NULL,
  `ProviderKey` varchar(255) NOT NULL,
  `ProviderDisplayName` longtext DEFAULT NULL,
  `UserId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AspNetUserRoles`
--

CREATE TABLE `AspNetUserRoles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `AspNetUserRoles`
--

INSERT INTO `AspNetUserRoles` (`UserId`, `RoleId`) VALUES
('1ddaa01f-db81-4261-b14b-d24f0ff0b6fb', 'cde5f1db-bc0b-4f8a-8a42-cdfc2f472a56'),
('384b7b75-0ae0-4a53-bff8-08e4ea42dafe', 'ac605355-9fd4-4ba5-8ee8-9e36ab463431'),
('384b7b75-0ae0-4a53-bff8-08e4ea42dafe', 'cde5f1db-bc0b-4f8a-8a42-cdfc2f472a56'),
('6fdf9acc-3815-4b0e-8e45-42caad06d636', 'ac605355-9fd4-4ba5-8ee8-9e36ab463431'),
('6fdf9acc-3815-4b0e-8e45-42caad06d636', 'cde5f1db-bc0b-4f8a-8a42-cdfc2f472a56'),
('8e498896-09f0-4c8c-847b-2eac04ff2557', 'cde5f1db-bc0b-4f8a-8a42-cdfc2f472a56'),
('f01e48dc-84cd-4b82-a0d4-a97d37303f21', 'cde5f1db-bc0b-4f8a-8a42-cdfc2f472a56');

-- --------------------------------------------------------

--
-- Table structure for table `AspNetUsers`
--

CREATE TABLE `AspNetUsers` (
  `Id` varchar(255) NOT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext DEFAULT NULL,
  `SecurityStamp` longtext DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL,
  `PhoneNumber` longtext DEFAULT NULL,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `City` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `AspNetUsers`
--

INSERT INTO `AspNetUsers` (`Id`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`, `City`) VALUES
('1ddaa01f-db81-4261-b14b-d24f0ff0b6fb', 'riorio1@rio.com', 'RIORIO1@RIO.COM', 'riorio1@rio.com', 'RIORIO1@RIO.COM', 0, 'AQAAAAIAAYagAAAAEO9VdeqDO+61NKVy3f9oeB0Ahg4v1We1vEpMa51VWr0aCuCsDVF/K2zCbMBXCBBfgw==', 'H7D457SXPGVV2ACNTINKLJRPSILTSSIB', 'cc72bd0f-59d1-4d62-b59d-0983ebf8cfc1', NULL, 0, 0, NULL, 1, 0, 'Palembang'),
('384b7b75-0ae0-4a53-bff8-08e4ea42dafe', 'Rio', 'RIO', 'rio2@rio2.com', 'RIO2@RIO2.COM', 0, 'AQAAAAIAAYagAAAAEAA2wrEb/jDyz3aRH+lW3FRxjAwgfm3wgjPbg0MnsVn2jlubj+oM9sTT2A1ylHZd4A==', 'CVWM6USMVSAB6GD6BN6PIASC5D675CBI', '70f63f18-4ae4-45c9-9c64-02a3d5681b2e', NULL, 0, 0, NULL, 1, 0, 'Palembang'),
('6fdf9acc-3815-4b0e-8e45-42caad06d636', 'rio1@rio.com', 'RIO1@RIO.COM', 'rio1@rio.com', 'RIO1@RIO.COM', 0, 'AQAAAAIAAYagAAAAEOtU0wejQkCpPJ+c8PAMHfMtQ0Jx8AhDsllNSsL74kPzw1MCF1yQ0Ge6Ru3+Xd6VnQ==', '5YKYWCVZRJTVVK37RL5OJNVJW432MHEI', '75dd4ea6-69cc-49e1-8232-98ecd6ef960a', NULL, 0, 0, NULL, 1, 0, NULL),
('8e498896-09f0-4c8c-847b-2eac04ff2557', 'rio12345@rio.com', 'RIO12345@RIO.COM', 'rio12345@rio.com', 'RIO12345@RIO.COM', 0, 'AQAAAAIAAYagAAAAEK/9qfwlrhOeQ+gXCrcYKUn8APJeT+NnlmgzlJ2n6p8MIxAyZ9wFuylO78MMF6jrsg==', 'CYHFXJHGVHK4TAHAQEJGVDR7Y2YVE3PN', 'e77c08df-739f-41c7-a377-9417411e1d8b', NULL, 0, 0, NULL, 1, 0, 'Pontianak'),
('a99aad9d-99a2-45d4-a834-94bb95cbfa73', 'riokennedy@rio.com', 'RIOKENNEDY@RIO.COM', 'riokennedy@rio.com', 'RIOKENNEDY@RIO.COM', 0, 'AQAAAAIAAYagAAAAEMtjmsc+oD60MhM0i1AaN7M/716FLEMhKAuP3rfD7v04jJx1tDSb71bbJM2+z2Q9vQ==', '3VTHNRLRNSIM77W5JM5ALHDT3UIEI6M3', '76f03c26-48c3-445b-ada3-4b2714d5a389', NULL, 0, 0, NULL, 1, 0, 'Palembang'),
('db37392c-fc45-479b-b373-63b5dbd84664', 'riorio@rio.com', 'RIORIO@RIO.COM', 'riorio@rio.com', 'RIORIO@RIO.COM', 0, 'AQAAAAIAAYagAAAAEDEQne83SqcvhCC82pWRRI805rEztdOwiAZ3FlYuVGomVRMWYywxPgobHtEFgzomIA==', 'VCZLMDGJYQROG7DXH47WWNO4JQM67RXL', '9526687a-0540-4e04-90e9-1088af7ec14e', NULL, 0, 0, NULL, 1, 0, 'Palembang'),
('f01e48dc-84cd-4b82-a0d4-a97d37303f21', 'rio3@rio.com', 'RIO3@RIO.COM', 'rio3@rio.com', 'RIO3@RIO.COM', 0, 'AQAAAAIAAYagAAAAED3Y5b4TQRG2fnBS8aE2ChpWCVYsRISVIMoe0OCIGmCMlc7cnmMTsMHMYCz6EN3a/A==', '4TN2NDHOMAZUUDBANDM32GOMYV6RG2DU', '363bcd7c-e813-4e38-b86f-b5424975f216', NULL, 0, 0, NULL, 1, 0, 'Palembang');

-- --------------------------------------------------------

--
-- Table structure for table `AspNetUserTokens`
--

CREATE TABLE `AspNetUserTokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Employees`
--

CREATE TABLE `Employees` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` longtext NOT NULL,
  `Department` int(11) NOT NULL,
  `PhotoPath` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Employees`
--

INSERT INTO `Employees` (`Id`, `Name`, `Email`, `Department`, `PhotoPath`) VALUES
(1, 'Mary', 'mary@pragimtech.com', 2, NULL),
(2, 'John', 'john@pragimtech.com', 1, '74dd08c6-34be-46ec-a9fb-f1cb5f13e5e6_noimage.jpg'),
(3, 'Rio', 'rio@rio.com', 2, '4ec5bc29-ff80-4cd2-9cf2-e34103bd7430_IMG20230120193029.jpg'),
(4, 'Rio Kennedy', 'riokennedy@riokennedy.com', 1, '7677d750-fbf2-4da3-9916-f8bd7d111e35_IMG20230120193029.jpg'),
(5, 'Rio2', 'rio2@rio2.com', 1, '1400fe16-924b-48c9-b719-9425c7d9e475_IMG20230120193029.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `__EFMigrationsHistory`
--

CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `__EFMigrationsHistory`
--

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES
('20240728171152_InitialMigration', '7.0.20'),
('20240730132555_SeedEmployeesTable', '7.0.20'),
('20240730133053_AlterEmployeesSeedData', '7.0.20'),
('20240730133458_AlterEmployeesSeedData', '7.0.20'),
('20240730144012_UpdatePhotopath', '7.0.20'),
('20240814134516_AddingIdentity', '7.0.20'),
('20240826133026_Extend_IdentityUser', '7.0.20'),
('20241002132102_EditCascade', '7.0.20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AspNetRoleClaims`
--
ALTER TABLE `AspNetRoleClaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`);

--
-- Indexes for table `AspNetRoles`
--
ALTER TABLE `AspNetRoles`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `RoleNameIndex` (`NormalizedName`);

--
-- Indexes for table `AspNetUserClaims`
--
ALTER TABLE `AspNetUserClaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetUserClaims_UserId` (`UserId`);

--
-- Indexes for table `AspNetUserLogins`
--
ALTER TABLE `AspNetUserLogins`
  ADD PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  ADD KEY `IX_AspNetUserLogins_UserId` (`UserId`);

--
-- Indexes for table `AspNetUserRoles`
--
ALTER TABLE `AspNetUserRoles`
  ADD PRIMARY KEY (`UserId`,`RoleId`),
  ADD KEY `IX_AspNetUserRoles_RoleId` (`RoleId`);

--
-- Indexes for table `AspNetUsers`
--
ALTER TABLE `AspNetUsers`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  ADD KEY `EmailIndex` (`NormalizedEmail`);

--
-- Indexes for table `AspNetUserTokens`
--
ALTER TABLE `AspNetUserTokens`
  ADD PRIMARY KEY (`UserId`,`LoginProvider`,`Name`);

--
-- Indexes for table `Employees`
--
ALTER TABLE `Employees`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `__EFMigrationsHistory`
--
ALTER TABLE `__EFMigrationsHistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AspNetRoleClaims`
--
ALTER TABLE `AspNetRoleClaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `AspNetUserClaims`
--
ALTER TABLE `AspNetUserClaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT for table `Employees`
--
ALTER TABLE `Employees`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AspNetRoleClaims`
--
ALTER TABLE `AspNetRoleClaims`
  ADD CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`);

--
-- Constraints for table `AspNetUserClaims`
--
ALTER TABLE `AspNetUserClaims`
  ADD CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`);

--
-- Constraints for table `AspNetUserLogins`
--
ALTER TABLE `AspNetUserLogins`
  ADD CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`);

--
-- Constraints for table `AspNetUserRoles`
--
ALTER TABLE `AspNetUserRoles`
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`),
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`);

--
-- Constraints for table `AspNetUserTokens`
--
ALTER TABLE `AspNetUserTokens`
  ADD CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
