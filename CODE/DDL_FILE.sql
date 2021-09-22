-- Generated by Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   at:        2021-08-27 21:03:03 ICT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE consumable (
    ivt_id                      INTEGER NOT NULL,
    csa_quantity                INTEGER,
    unit_of_measurement_unit_id INTEGER NOT NULL
);

ALTER TABLE consumable ADD CONSTRAINT consumable_pk PRIMARY KEY ( ivt_id );

CREATE TABLE external (
    vst_session_id     INTEGER NOT NULL,
    ext_reference_name VARCHAR2(45 CHAR),
    ext_reference_id   VARCHAR2(45 CHAR),
    ext_address        VARCHAR2(45 CHAR) NOT NULL
);

ALTER TABLE external ADD CONSTRAINT external_pk PRIMARY KEY ( vst_session_id );

CREATE TABLE internal (
    vst_session_id INTEGER NOT NULL,
    int_status     VARCHAR2(45 CHAR) NOT NULL
);

ALTER TABLE internal ADD CONSTRAINT internal_pk PRIMARY KEY ( vst_session_id );

CREATE TABLE inventory (
    ivt_id                      INTEGER NOT NULL,
    ivt_name                    VARCHAR2(45 CHAR) NOT NULL,
    ivt_description             VARCHAR2(45 CHAR),
    "LAB._ASSISTANT_student_id" INTEGER
);

ALTER TABLE inventory ADD CONSTRAINT inventory_pk PRIMARY KEY ( ivt_id );

CREATE TABLE "LAB._ASSISTANT" (
    student_id INTEGER NOT NULL,
    first_name VARCHAR2(45 CHAR),
    last_name  VARCHAR2(45 CHAR) NOT NULL,
    job        VARCHAR2(45 CHAR) NOT NULL
);

ALTER TABLE "LAB._ASSISTANT" ADD CONSTRAINT "LAB._ASSISTANT_PK" PRIMARY KEY ( student_id );

CREATE TABLE tool (
    ivt_id              INTEGER NOT NULL,
    tol_rent_rate_daily INTEGER NOT NULL,
    tol_insured_value   INTEGER NOT NULL
);

ALTER TABLE tool ADD CONSTRAINT tool_pk PRIMARY KEY ( ivt_id );

CREATE TABLE tool_rent (
    date_rent                   DATE NOT NULL,
    date_returned               DATE NOT NULL,
    rent_cost                   INTEGER,
    condition                   VARCHAR2(45 CHAR) NOT NULL,
    tool_ivt_id                 INTEGER NOT NULL,
    visitation_vst_session_id   INTEGER NOT NULL,
    "LAB._ASSISTANT_student_id" INTEGER NOT NULL
);

ALTER TABLE tool_rent ADD CONSTRAINT tool_rent_pk PRIMARY KEY ( date_rent,
                                                                tool_ivt_id );

CREATE TABLE unit_of_measurement (
    unit_id     INTEGER NOT NULL,
    description VARCHAR2(45 CHAR),
    unit_name   VARCHAR2(10 CHAR)
);

ALTER TABLE unit_of_measurement ADD CONSTRAINT uom_pk PRIMARY KEY ( unit_id );

CREATE TABLE visitation (
    vst_session_id INTEGER NOT NULL,
    vst_visitor_id INTEGER NOT NULL,
    vst_date_visit DATE NOT NULL,
    vst_first_name VARCHAR2(45 CHAR),
    vst_last_name  VARCHAR2(45 CHAR) NOT NULL,
    vst_phone      INTEGER NOT NULL
);

ALTER TABLE visitation ADD CONSTRAINT visitation_pk PRIMARY KEY ( vst_session_id );

ALTER TABLE consumable
    ADD CONSTRAINT csa_ivt_fk FOREIGN KEY ( ivt_id )
        REFERENCES inventory ( ivt_id );

ALTER TABLE consumable
    ADD CONSTRAINT csa_uom_fk FOREIGN KEY ( unit_of_measurement_unit_id )
        REFERENCES unit_of_measurement ( unit_id );

ALTER TABLE external
    ADD CONSTRAINT external_visitation_fk FOREIGN KEY ( vst_session_id )
        REFERENCES visitation ( vst_session_id );

ALTER TABLE internal
    ADD CONSTRAINT internal_visitation_fk FOREIGN KEY ( vst_session_id )
        REFERENCES visitation ( vst_session_id );

ALTER TABLE inventory
    ADD CONSTRAINT "INVENTORY_LAB._ASSISTANT_FK" FOREIGN KEY ( "LAB._ASSISTANT_student_id" )
        REFERENCES "LAB._ASSISTANT" ( student_id );

ALTER TABLE tool
    ADD CONSTRAINT tool_inventory_fk FOREIGN KEY ( ivt_id )
        REFERENCES inventory ( ivt_id );

ALTER TABLE tool_rent
    ADD CONSTRAINT "TOOL_RENT_LAB._ASSISTANT_FK" FOREIGN KEY ( "LAB._ASSISTANT_student_id" )
        REFERENCES "LAB._ASSISTANT" ( student_id );

ALTER TABLE tool_rent
    ADD CONSTRAINT tool_rent_tool_fk FOREIGN KEY ( tool_ivt_id )
        REFERENCES tool ( ivt_id );

ALTER TABLE tool_rent
    ADD CONSTRAINT tool_rent_visitation_fk FOREIGN KEY ( visitation_vst_session_id )
        REFERENCES visitation ( vst_session_id );

