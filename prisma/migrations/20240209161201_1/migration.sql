/*
  Warnings:

  - You are about to drop the column `color_id` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `size_id` on the `product` table. All the data in the column will be lost.
  - You are about to drop the `color` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `size` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "product" DROP CONSTRAINT "product_color_id_fkey";

-- DropForeignKey
ALTER TABLE "product" DROP CONSTRAINT "product_size_id_fkey";

-- AlterTable
ALTER TABLE "product" DROP COLUMN "color_id",
DROP COLUMN "size_id",
ADD COLUMN     "color" TEXT,
ADD COLUMN     "size" TEXT;

-- DropTable
DROP TABLE "color";

-- DropTable
DROP TABLE "size";
