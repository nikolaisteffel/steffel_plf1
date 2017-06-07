--------------------------------------------------------
--  File created - Wednesday-June-07-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table STEFFEL_PRODUCT
--------------------------------------------------------

  CREATE TABLE "NIKOLAISTEFFEL"."STEFFEL_PRODUCT" 
   (	"PRODUCT_ID" NUMBER(*,0), 
	"PRODUCT_NAME" VARCHAR2(20 BYTE), 
	"BUY_PRICE" NUMBER(6,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into NIKOLAISTEFFEL.STEFFEL_PRODUCT
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index SYS_C0034035
--------------------------------------------------------

  CREATE UNIQUE INDEX "NIKOLAISTEFFEL"."SYS_C0034035" ON "NIKOLAISTEFFEL"."STEFFEL_PRODUCT" ("PRODUCT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger STEFFEL_CHECK_REMOVE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "NIKOLAISTEFFEL"."STEFFEL_CHECK_REMOVE" 
BEFORE DELETE 
ON STEFFEL_PRODUCT
FOR EACH ROW
DECLARE

BEGIN

	IF (:old.stock > 0) THEN
    		raise_application_error (-20999, 'The stock ' || :old.stock || 'cant be more than zero when dropping!');
            ELSE
  	END IF;

END steffel_check_remove;
/
ALTER TRIGGER "NIKOLAISTEFFEL"."STEFFEL_CHECK_REMOVE" ENABLE;
--------------------------------------------------------
--  Constraints for Table STEFFEL_PRODUCT
--------------------------------------------------------

  ALTER TABLE "NIKOLAISTEFFEL"."STEFFEL_PRODUCT" ADD PRIMARY KEY ("PRODUCT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "NIKOLAISTEFFEL"."STEFFEL_PRODUCT" MODIFY ("PRODUCT_ID" NOT NULL ENABLE);
