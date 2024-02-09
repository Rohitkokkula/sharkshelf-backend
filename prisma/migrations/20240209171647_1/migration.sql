/*
  Warnings:

  - You are about to drop the column `userId` on the `address` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `review` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `wishlist` table. All the data in the column will be lost.
  - Added the required column `user_id` to the `address` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `review` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `wishlist` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "address" DROP COLUMN "userId",
ADD COLUMN     "user_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "review" DROP COLUMN "userId",
ADD COLUMN     "user_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "wishlist" DROP COLUMN "userId",
ADD COLUMN     "user_id" INTEGER NOT NULL;
