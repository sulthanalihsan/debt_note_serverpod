--
-- Class Debt as table debt_tb
--

CREATE TABLE "debt_tb" (
  "id" serial,
  "creditorName" text NOT NULL,
  "debtorName" text NOT NULL,
  "debtNominal" double precision NOT NULL,
  "debtDueDate" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "debt_tb"
  ADD CONSTRAINT debt_tb_pkey PRIMARY KEY (id);


