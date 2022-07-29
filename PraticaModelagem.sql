CREATE DATABASE "drivenbank_database";


CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL
);


CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"stateId" INTEGER NOT NULL REFERENCES "states"("id")
);


CREATE TABLE "customers" (
	"id" SERIAL PRIMARY KEY,
	"fullName" TEXT NOT NULL,
	"cpf" text UNIQUE NOT NULL,
	"email" text UNIQUE not null,
	"password" text NOT NULL
);


CREATE TABLE "customerPhones" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT null references "customers"("id"),
	"number" text NOT NULL,
	"type" text not null
);


CREATE TABLE "customerAddresses" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT null references "customers"("id"),
	"street" text not null,
	"number" INTEGER NOT NULL,
	"complement" text,
	"postalCode" text not null,
	"cityId" INTEGER not null references "cities"("id")
);

CREATE TABLE "bankAccount" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT null references "customers"("id"),
	"accountNumber" INTEGER unique NOT NULL,
	"agency" INTEGER not null,
	"openDate" timestamp not null default NOW(),
	"closeDate" timestamp
);


CREATE TABLE "transactions" (
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT null references "bankAccount"("id"),
	"amount" DOUBLE PRECISION NOT NULL,
	"type" text not null,
	"time" timestamp not null default NOW(),
	"description" text,
	"cancelled" text
);

CREATE TABLE "creditCards" (
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT null references "bankAccount"("id"),
	"name" text NOT NULL,
	"number" BIGINT unique not null,
	"securityCode" INTEGER not null,
	"expirationMonth" text not null,
	"expirationYear" INTEGER not null,
	"password" text not null,
	"limit" BIGINT not null
);






