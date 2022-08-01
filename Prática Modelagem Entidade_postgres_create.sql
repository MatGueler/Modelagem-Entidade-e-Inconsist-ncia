CREATE TABLE "public.Users" (
	"id" serial,
	"name" TEXT NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL UNIQUE,
	CONSTRAINT "Users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"length" integer NOT NULL,
	"categoryId" integer NOT NULL UNIQUE,
	"price" DECIMAL NOT NULL,
	"mainImageId" integer NOT NULL UNIQUE,
	CONSTRAINT "Products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Category" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "Category_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Statement" (
	"id" serial NOT NULL,
	"productId" integer NOT NULL,
	"buyerId" integer NOT NULL,
	"status" TEXT NOT NULL,
	"address" TEXT NOT NULL,
	"total" DECIMAL NOT NULL,
	"dateOpen" DATE NOT NULL,
	"dateClose" DATE NOT NULL,
	CONSTRAINT "Statement_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.pictures" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL UNIQUE,
	"productId" integer NOT NULL,
	"isInitial" BOOLEAN NOT NULL DEFAULT 'false',
	CONSTRAINT "pictures_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Products" ADD CONSTRAINT "Products_fk0" FOREIGN KEY ("categoryId") REFERENCES "Category"("id");
ALTER TABLE "Products" ADD CONSTRAINT "Products_fk1" FOREIGN KEY ("mainImageId") REFERENCES "pictures"("id");


ALTER TABLE "Statement" ADD CONSTRAINT "Statement_fk0" FOREIGN KEY ("productId") REFERENCES "Products"("id");
ALTER TABLE "Statement" ADD CONSTRAINT "Statement_fk1" FOREIGN KEY ("buyerId") REFERENCES "Users"("id");

ALTER TABLE "pictures" ADD CONSTRAINT "pictures_fk0" FOREIGN KEY ("productId") REFERENCES "Products"("id");






