/*
  Warnings:

  - You are about to drop the column `imageurl` on the `product` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "product" DROP COLUMN "imageurl",
ADD COLUMN     "brand" VARCHAR(50) NOT NULL DEFAULT 'Sharkshelf',
ADD COLUMN     "images" TEXT[],
ADD COLUMN     "rating" DOUBLE PRECISION,
ADD COLUMN     "stock" INTEGER NOT NULL DEFAULT 0;
