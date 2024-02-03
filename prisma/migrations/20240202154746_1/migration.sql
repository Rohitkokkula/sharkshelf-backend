/*
  Warnings:

  - You are about to drop the column `colors` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `liquidquantity_id` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `lqtys` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `sizes` on the `product` table. All the data in the column will be lost.
  - You are about to drop the `liquidquantity` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `role` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "order" DROP CONSTRAINT "order_user_id_fkey";

-- DropForeignKey
ALTER TABLE "product" DROP CONSTRAINT "product_liquidquantity_id_fkey";

-- DropForeignKey
ALTER TABLE "user" DROP CONSTRAINT "user_role_id_fkey";

-- AlterTable
ALTER TABLE "product" DROP COLUMN "colors",
DROP COLUMN "liquidquantity_id",
DROP COLUMN "lqtys",
DROP COLUMN "sizes";

-- DropTable
DROP TABLE "liquidquantity";

-- DropTable
DROP TABLE "role";

-- DropTable
DROP TABLE "user";

-- CreateTable
CREATE TABLE "cart" (
    "id" SERIAL NOT NULL,
    "quantity" INTEGER NOT NULL,
    "product_id" INTEGER,
    "user_id" INTEGER,
    "created_on" TIMESTAMP(0) NOT NULL,
    "modified_on" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "cart_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "cart" ADD CONSTRAINT "cart_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id") ON DELETE SET NULL ON UPDATE CASCADE;
