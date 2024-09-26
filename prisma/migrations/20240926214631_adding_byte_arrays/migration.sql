/*
  Warnings:

  - You are about to drop the column `item1ImageURL` on the `Match` table. All the data in the column will be lost.
  - You are about to drop the column `item2ImageURL` on the `Match` table. All the data in the column will be lost.
  - Added the required column `image1Id` to the `Match` table without a default value. This is not possible if the table is not empty.
  - Added the required column `image2Id` to the `Match` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Match" DROP COLUMN "item1ImageURL",
DROP COLUMN "item2ImageURL",
ADD COLUMN     "image1Id" TEXT NOT NULL,
ADD COLUMN     "image2Id" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "Image" (
    "id" TEXT NOT NULL,
    "img" BYTEA NOT NULL,

    CONSTRAINT "Image_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Match" ADD CONSTRAINT "Match_image1Id_fkey" FOREIGN KEY ("image1Id") REFERENCES "Image"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Match" ADD CONSTRAINT "Match_image2Id_fkey" FOREIGN KEY ("image2Id") REFERENCES "Image"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
