/*
  Warnings:

  - You are about to drop the column `code` on the `user` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[token]` on the table `user` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "user_code_key";

-- AlterTable
ALTER TABLE "user" DROP COLUMN "code",
ADD COLUMN     "token" VARCHAR(100);

-- CreateIndex
CREATE UNIQUE INDEX "user_token_key" ON "user"("token");
