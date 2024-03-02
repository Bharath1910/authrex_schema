-- CreateEnum
CREATE TYPE "Methods" AS ENUM ('USERNAME_PASSWORD', 'PGP');

-- CreateTable
CREATE TABLE "Owner" (
    "id" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "pgp_key" TEXT,

    CONSTRAINT "Owner_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "pgp_key" TEXT,
    "app_id" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "App" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "api_key" TEXT NOT NULL,
    "redirect_url" TEXT NOT NULL,
    "methods" "Methods" NOT NULL,

    CONSTRAINT "App_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Owner_username_key" ON "Owner"("username");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_app_id_key" ON "User"("username", "app_id");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_app_id_fkey" FOREIGN KEY ("app_id") REFERENCES "App"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "App" ADD CONSTRAINT "App_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Owner"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
