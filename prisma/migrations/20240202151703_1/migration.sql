/*
  Warnings:

  - You are about to drop the column `attendee_id` on the `order` table. All the data in the column will be lost.
  - You are about to drop the column `event_id` on the `order` table. All the data in the column will be lost.
  - You are about to drop the column `vendor_id` on the `order` table. All the data in the column will be lost.
  - You are about to drop the column `event_product_id` on the `order_item` table. All the data in the column will be lost.
  - You are about to drop the `attendee` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `company` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `event` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `event_product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `event_user` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `qr` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `refund_history` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `staff` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `transaction` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `wallet_history` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "attendee" DROP CONSTRAINT "attendee_event_user_id_fkey";

-- DropForeignKey
ALTER TABLE "attendee" DROP CONSTRAINT "attendee_staff_id_fkey";

-- DropForeignKey
ALTER TABLE "company" DROP CONSTRAINT "company_event_id_fkey";

-- DropForeignKey
ALTER TABLE "event" DROP CONSTRAINT "event_host_id_fkey";

-- DropForeignKey
ALTER TABLE "event_product" DROP CONSTRAINT "event_product_category_id_fkey";

-- DropForeignKey
ALTER TABLE "event_product" DROP CONSTRAINT "event_product_color_id_fkey";

-- DropForeignKey
ALTER TABLE "event_product" DROP CONSTRAINT "event_product_event_id_fkey";

-- DropForeignKey
ALTER TABLE "event_product" DROP CONSTRAINT "event_product_liquidquantity_id_fkey";

-- DropForeignKey
ALTER TABLE "event_product" DROP CONSTRAINT "event_product_size_id_fkey";

-- DropForeignKey
ALTER TABLE "event_product" DROP CONSTRAINT "event_product_subcategory_id_fkey";

-- DropForeignKey
ALTER TABLE "event_product" DROP CONSTRAINT "event_product_vendor_id_fkey";

-- DropForeignKey
ALTER TABLE "event_user" DROP CONSTRAINT "event_user_event_id_fkey";

-- DropForeignKey
ALTER TABLE "event_user" DROP CONSTRAINT "event_user_role_id_fkey";

-- DropForeignKey
ALTER TABLE "event_user" DROP CONSTRAINT "event_user_user_id_fkey";

-- DropForeignKey
ALTER TABLE "order" DROP CONSTRAINT "order_attendee_id_fkey";

-- DropForeignKey
ALTER TABLE "order" DROP CONSTRAINT "order_event_id_fkey";

-- DropForeignKey
ALTER TABLE "order" DROP CONSTRAINT "order_vendor_id_fkey";

-- DropForeignKey
ALTER TABLE "order_item" DROP CONSTRAINT "order_item_event_product_id_fkey";

-- DropForeignKey
ALTER TABLE "qr" DROP CONSTRAINT "qr_attendee_id_fkey";

-- DropForeignKey
ALTER TABLE "qr" DROP CONSTRAINT "qr_event_id_fkey";

-- DropForeignKey
ALTER TABLE "refund_history" DROP CONSTRAINT "refund_history_attendee_id_fkey";

-- DropForeignKey
ALTER TABLE "refund_history" DROP CONSTRAINT "refund_history_event_id_fkey";

-- DropForeignKey
ALTER TABLE "refund_history" DROP CONSTRAINT "refund_history_staff_id_fkey";

-- DropForeignKey
ALTER TABLE "staff" DROP CONSTRAINT "staff_event_user_id_fkey";

-- DropForeignKey
ALTER TABLE "transaction" DROP CONSTRAINT "transaction_attendee_id_fkey";

-- DropForeignKey
ALTER TABLE "transaction" DROP CONSTRAINT "transaction_event_id_fkey";

-- DropForeignKey
ALTER TABLE "transaction" DROP CONSTRAINT "transaction_staff_id_fkey";

-- DropForeignKey
ALTER TABLE "wallet_history" DROP CONSTRAINT "wallet_history_user_id_fkey";

-- AlterTable
ALTER TABLE "order" DROP COLUMN "attendee_id",
DROP COLUMN "event_id",
DROP COLUMN "vendor_id";

-- AlterTable
ALTER TABLE "order_item" DROP COLUMN "event_product_id",
ADD COLUMN     "product_id" INTEGER;

-- DropTable
DROP TABLE "attendee";

-- DropTable
DROP TABLE "company";

-- DropTable
DROP TABLE "event";

-- DropTable
DROP TABLE "event_product";

-- DropTable
DROP TABLE "event_user";

-- DropTable
DROP TABLE "qr";

-- DropTable
DROP TABLE "refund_history";

-- DropTable
DROP TABLE "staff";

-- DropTable
DROP TABLE "transaction";

-- DropTable
DROP TABLE "wallet_history";

-- CreateTable
CREATE TABLE "product" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "imageurl" VARCHAR(255) NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "offer_price" DOUBLE PRECISION NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT true,
    "sizes" TEXT NOT NULL,
    "colors" TEXT NOT NULL,
    "lqtys" TEXT NOT NULL,
    "color_id" INTEGER,
    "category_id" INTEGER,
    "subcategory_id" INTEGER,
    "size_id" INTEGER,
    "liquidquantity_id" INTEGER,
    "created_on" TIMESTAMP(0) NOT NULL,
    "modified_on" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "product_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "product_name_key" ON "product"("name");

-- AddForeignKey
ALTER TABLE "order_item" ADD CONSTRAINT "order_item_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_color_id_fkey" FOREIGN KEY ("color_id") REFERENCES "color"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "category"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_subcategory_id_fkey" FOREIGN KEY ("subcategory_id") REFERENCES "subcategory"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_size_id_fkey" FOREIGN KEY ("size_id") REFERENCES "size"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_liquidquantity_id_fkey" FOREIGN KEY ("liquidquantity_id") REFERENCES "liquidquantity"("id") ON DELETE SET NULL ON UPDATE CASCADE;
