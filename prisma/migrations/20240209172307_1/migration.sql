/*
  Warnings:

  - You are about to drop the column `postalCode` on the `address` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `contact` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `contact` table. All the data in the column will be lost.
  - You are about to drop the column `productId` on the `deal` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `grievance` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `grievance` table. All the data in the column will be lost.
  - You are about to drop the column `productId` on the `popular` table. All the data in the column will be lost.
  - You are about to drop the column `productId` on the `review` table. All the data in the column will be lost.
  - You are about to drop the column `productId` on the `wishlist` table. All the data in the column will be lost.
  - Added the required column `postal_code` to the `address` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_on` to the `contact` table without a default value. This is not possible if the table is not empty.
  - Added the required column `product_id` to the `deal` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_on` to the `grievance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `product_id` to the `popular` table without a default value. This is not possible if the table is not empty.
  - Added the required column `product_id` to the `review` table without a default value. This is not possible if the table is not empty.
  - Added the required column `product_id` to the `wishlist` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "deal" DROP CONSTRAINT "deal_productId_fkey";

-- DropForeignKey
ALTER TABLE "popular" DROP CONSTRAINT "popular_productId_fkey";

-- DropForeignKey
ALTER TABLE "review" DROP CONSTRAINT "review_productId_fkey";

-- DropForeignKey
ALTER TABLE "wishlist" DROP CONSTRAINT "wishlist_productId_fkey";

-- AlterTable
ALTER TABLE "address" DROP COLUMN "postalCode",
ADD COLUMN     "postal_code" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "contact" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_on" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_on" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "deal" DROP COLUMN "productId",
ADD COLUMN     "product_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "grievance" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_on" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_on" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "popular" DROP COLUMN "productId",
ADD COLUMN     "product_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "review" DROP COLUMN "productId",
ADD COLUMN     "product_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "wishlist" DROP COLUMN "productId",
ADD COLUMN     "product_id" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "review" ADD CONSTRAINT "review_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wishlist" ADD CONSTRAINT "wishlist_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "popular" ADD CONSTRAINT "popular_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "deal" ADD CONSTRAINT "deal_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
