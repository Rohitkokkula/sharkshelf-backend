/*
  Warnings:

  - You are about to drop the `menu` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `submenu` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "submenu" DROP CONSTRAINT "submenu_menuId_fkey";

-- DropTable
DROP TABLE "menu";

-- DropTable
DROP TABLE "submenu";
