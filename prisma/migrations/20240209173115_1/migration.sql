/*
  Warnings:

  - You are about to drop the `FAQ` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "FAQ";

-- CreateTable
CREATE TABLE "faq" (
    "id" SERIAL NOT NULL,
    "question" VARCHAR(255) NOT NULL,
    "answer" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT true,
    "created_on" TIMESTAMP(0) NOT NULL,
    "modified_on" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "faq_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "faq_question_key" ON "faq"("question");
