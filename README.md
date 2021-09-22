# LABOTARIUM TOOL RENT DATABASE DESIGN

## CONTENT

# Table of Contents
1. [RULES AND ASSUMPTIONS](#RULES-AND-ASSUMPTIONS)
2. [PROCEDURE](#Procedure)
3. [ERD AND SCHEMA](#ERD-AND-SCHEMA)
4. [TABLE EXAMPLE](#TABLE-EXAMPLE)
5. [REPORT VIEW](#REPORT-VIEWS)

## RULES AND ASSUMPTIONS

* there are 4 main table for tool rents schema :

   a. **TOOLS**

1. In this table contains tool and material. it classified by tools and consumables materials.
2. stock avaliable for tools just one stock in laboratorium each tools.
3. Every tools have daily rent cost for rental and insured cost if any demaged or lost when rent. 
4. Every tools may be rent someday, but if it avaliable (when not rented).
5. Consumable materials is material that its quantity will decreased when used.
6. Consumable materials have quantity unit (unit of measurement).
7. COnsumable materials can'ts be rented or sold to other (used for laboratorium purpose only).

   b. **Laboratorium Assistants** 

1. Contains data of laboratorium assistant.
2. Lab. Assistant responsible for maintain laboratory inventory.
3. Every assistants must be responsible for each or more tools in laboratorium. 

   c. **Visits**
    
1. Contain data for visitor (name, ID, phone, etc) in laboratorium.
2. Visitor divided by internal (university) and external parties.
3. visitor id can contain student id, employee id or industrial id for external.
4. Internal is academic community internal university (student, lecturer, staff, etc.).
5. External is contain personal and industrial.
6. Industry party must attach identity for reference name and address.
7. For personal must attach id number in visitor id and address.
8. Every visitor can rent a tool in laboratorium if avaliable.

   d. **Tool Rents**
   
1. Visitor can rent one or more tools.
2. Rent cost is calculated from rent rate multiple by total of rent day.
3. If it's lost or damaged then rent rate = (reporting date - rent date) + insured value.
4. Internal visitor have no rent rate(rent cost=0), but insured value can be applied if any damaged or lost tools.
5. When visitor is returning tools must delivered and accepted by laboratorium assistant.


### Procedure

![Figure 1.1](https://github.com/boxside/TOOL_RENT_SCHEMA/blob/main/figure/prosedur.jpeg)

## ERD AND SCHEMA

ERD

![Figure 2.1](https://github.com/boxside/TOOL_RENT_SCHEMA/blob/main/figure/Logical.png)


TABLE SCHEMA

![Figure 2.2](https://github.com/boxside/TOOL_RENT_SCHEMA/blob/main/figure/Relational_11.png)

## TABLE CONSTRAINT

## TABLE EXAMPLE

INVENTORIES


| IVT_ID | IVT_NAME             | IVT_DESCRIPTION            | LAB._ASSISTANT_student_id |
|--------|----------------------|----------------------------|---------------------------|
| 11002  | Gelas Beaker 1000ml  |                            | 3334150002                |
| 11003  | Gelas Beaker 250ml   |                            | 3334150002                |
| 11004  | Gelas Beaker 50ml    |                            | 3334150002                |
| 21001  | Muffle Furnace       | Max temp. 1400*C           | 3334150001                |
| 21002  | Stir Casting Furnace | Max temp. 1000*C & RPM 900 | 3334150001                |
| 21003  | Thermocouple Hi-Temp | Cap. 0-1500*C              | 3334150001                |
| 21004  | Crusible 1L          | Cap. 1000ML                | 3334150003                |
| 22001  | Ethanol 96%          | Merck                      | 3334150003                |
| 22002  | Pasir besi           |                            | 3334150003                |
| 22003  | Pasir Silika         |                            | 3334150003                |
| 22004  | Scrap Alumunium      |                            | 3334150003                |
| 22005  | Sieve 30#            |                            | 3334150004                |
| 22006  | Sieve 60#            |                            | 3334150004                |
| 22007  | Sieve 100#           |                            | 3334150004                |
| 22008  | Sieve 10#            |                            | 3334150004                |
| 11001  | Gelas Beaker 100ml   | pyrex                      | 3334150002                |

CONSUMABLES

| IVT_ID | CSA_QUANTITY | UNIT_OF_MEASUREMENT_UNIT_ID |
|--------|--------------|-----------------------------|
| 22001  | 2000         | 5                           |
| 22002  | 10           | 1                           |
| 22003  | 15           | 1                           |
| 22004  | 5            | 1                           |

UNIT_OF_MEASUREMENTS

| UNIT_ID | DESCRIPTION                  | UNIT_NAME |
|---------|------------------------------|-----------|
| 1       | unit of mass(kilogram)       | kg        |
| 2       | unit of mass(gram)           | g         |
| 3       | unit of mass(metric tonnage) | MT        |
| 4       | unit of volume(liter)        | L         |
| 5       | unit of volume(mililiter)    | mL        |
| 6       | unit                         | Pcs       |
| 7       | unit of length(centimeter)   | cm        |
| 8       | unit of length(meter)        | M         |
| 9       | unit of length(milimeter)    | mm        |

TOOLS


| IVT_ID | TOL_RENT_RATE_DAILY | TOL_INSURED_VALUE |
|--------|---------------------|-------------------|
| 21003  | 75000               | 450000            |
| 21004  | 25000               | 125000            |
| 22005  | 10000               | 180000            |
| 22006  | 10000               | 180000            |
| 22007  | 15000               | 200000            |
| 22008  | 15000               | 230000            |
| 11001  | 15000               | 75000             |
| 11002  | 25000               | 80000             |
| 11003  | 15000               | 55000             |
| 11004  | 15000               | 55000             |
| 21001  | 2400000             | 100000000         |
| 21002  | 1000000             | 75000000          |

LAB. ASSISTANTS

| STUDENT_ID | FIRST_NAME | LAST_NAME       | JOB                  |
|------------|------------|-----------------|----------------------|
| 3334150002 | Annan      | Fernandi        | Bendahara            |
| 3334150006 | Abi        | Masul           | Humas                |
| 3334150001 | Fikri      | Fadillah        | Peralatan            |
| 3334150003 | Titan      | Huzaimawardanni | Sekretaris           |
| 3334150004 | Andrian    | Akhmad          | Praktikum            |
| 3334150005 |            | Saputra         | Eksternal            |
| 3334150007 | Ridwan     | Kurniawan       | Assisten Koordinator |

VISITORS

| VST_SESSION_ID | VST_VISITOR_ID | VST_DATE_VISIT | VST_FIRST_NAME | VST_LAST_NAME  | VST_PHONE   |
|----------------|----------------|----------------|----------------|----------------|-------------|
| 081018001      | 1902080002     | 08-Oct-2018    | Adithya        | Pratama        | 89754288328 |
| 091018001      | 3334150230     | 09-Oct-2018    |                | Rheza          | 88821394192 |
| 121018001      | 1010980001     | 12-Oct-2018    |                | Suryadi        | 82317412382 |
| 121018002      | 2201100001     | 12-Oct-2018    | Annisa         | Salsabilla     | 85777428391 |
| 131018001      | 3334150231     | 13-Oct-2018    | Yordan         | V              | 89654312342 |
| 121218001      | 3275012721     | 12-Dec-2018    |                | PT Davindo J S | 81238219311 |

INTERNALS

| VST_SESSION_ID | INT_STATUS |
|----------------|------------|
| 081018001      | Dosen      |
| 091018001      | Mahasiswa  |
| 121018001      | Dosen      |
| 121018002      | Staff      |
| 131018001      | Mahasiswa  |

EXTERNALS

| VST_SESSION_ID | EXT_REFERENCE_NAME | EXT_REFERENCE_ID | EXT_ADDRESS |
|----------------|--------------------|------------------|-------------|
| 121218001      | Agus S             | 3275012721       | Bekasi      |

TOOL_RENTS

| DATE_RENT   | DATE_RETURNED | RENT_COST | CONDITION    | TOOL_IVT_ID | VISITATION_VST_SESSION_ID | LAB._ASSISTANT_student_id |
|-------------|---------------|-----------|--------------|-------------|---------------------------|---------------------------|
| 08-Oct-2018 | 10-Oct-2018   | 0         | ok           | 21004       | 081018001                 | 3334150002                |
| 09-Oct-2018 | 16-Oct-2018   | 0         | ok           | 22007       | 091018001                 | 3334150003                |
| 12-Oct-2018 | 12-Oct-2018   | 0         | ok           | 21003       | 121018001                 | 3334150002                |
| 13-Oct-2018 | 15-Oct-2018   | 0         | ok           | 21003       | 131018001                 | 3334150001                |
| 12-Oct-2018 | 13-Oct-2018   | 80000     | crack/broken | 11002       | 121018002                 | 3334150006                |
| 13-Oct-2018 | 15-Oct-2018   | 0         | ok           | 21002       | 131018001                 | 3334150001                |
| 12-Dec-2018 | 13-Dec-2018   | 2400000   | ok           | 21001       | 121218001                 | 3334150001                |

## REPORT VIEWS

TOOL RENT REPORT

    CREATE VIEW  "TOOL_RENT_REPORT" AS 
      (
    select a.DATE_RENT "Date Rented", 
       a.DATE_RETURNED "Date Returned",
       c.VST_LAST_NAME || ',' || c.VST_FIRST_NAME "Borrower", 
       b.IVT_NAME "Tool Returned",
       a.CONDITION "Condition",
       a.RENT_COST "Rent Cost",
       d.LAST_NAME || ',' || d.FIRST_NAME "Checked by"

    from tool_rent a
    inner join inventory b on a.TOOL_IVT_ID = b.IVT_ID
    inner join visitation c on a.VISITATION_VST_SESSION_ID = c.VST_SESSION_ID
    inner join "LAB._ASSISTANT" d on a."LAB._ASSISTANT_student_id" = d.STUDENT_ID)

Result

| Date Rented | Date Returned | Borrower          | Tool Returned        | Condition    | Rent Cost | Checked by            |
|-------------|---------------|-------------------|----------------------|--------------|-----------|-----------------------|
| 12-Oct-2018 | 13-Oct-2018   | Salsabilla,Annisa | Gelas Beaker 1000ml  | crack/broken | 80000     | Masul,Abi             |
| 12-Dec-2018 | 13-Dec-2018   | PT Davindo J S,   | Muffle Furnace       | ok           | 2400000   | Fadillah,Fikri        |
| 13-Oct-2018 | 15-Oct-2018   | V,Yordan          | Stir Casting Furnace | ok           | 0         | Fadillah,Fikri        |
| 13-Oct-2018 | 15-Oct-2018   | V,Yordan          | Thermocouple Hi-Temp | ok           | 0         | Fadillah,Fikri        |
| 12-Oct-2018 | 12-Oct-2018   | Suryadi,          | Thermocouple Hi-Temp | ok           | 0         | Fernandi,Annan        |
| 08-Oct-2018 | 10-Oct-2018   | Pratama,Adithya   | Crusible 1L          | ok           | 0         | Fernandi,Annan        |
| 09-Oct-2018 | 16-Oct-2018   | Rheza,            | Sieve 100#           | ok           | 0         | Huzaimawardanni,Titan |

INVENTORY REPORT

    CREATE VIEW "INVENTORY_REPORT" AS 
      (
    select a.IVT_ID "Item ID",
       a.IVT_NAME "Item Name",
       a.IVT_DESCRIPTION "description",
       d.LAST_NAME || ',' || d.FIRST_NAME "Responsible by",
       b.TOL_RENT_RATE_DAILY "Rent Rate Daily",
       b.TOL_INSURED_VALUE "Insured Value",
       c.CSA_QUANTITY "Quantity",
       e.UNIT_NAME "Unit"

    from inventory a
    left join tool b on a.IVT_ID = b.IVT_ID
    left join consumable c on a.IVT_ID = c.IVT_ID
    left join "LAB._ASSISTANT" d on a."LAB._ASSISTANT_student_id" = d.STUDENT_ID
    left join UNIT_OF_MEASUREMENT e on c.UNIT_OF_MEASUREMENT_UNIT_ID = e.UNIT_ID)



RESULT

| Item ID | Item Name            | description                | Responsible by        | Rent Rate Daily | Insured Value | Quantity | Unit |
|---------|----------------------|----------------------------|-----------------------|-----------------|---------------|----------|------|
| 21003   | Thermocouple Hi-Temp | Cap. 0-1500*C              | Fadillah,Fikri        | 75000           | 450000        |          |      |
| 21004   | Crusible 1L          | Cap. 1000ML                | Huzaimawardanni,Titan | 25000           | 125000        |          |      |
| 22005   | Sieve 30#            |                            | Akhmad,Andrian        | 10000           | 180000        |          |      |
| 22006   | Sieve 60#            |                            | Akhmad,Andrian        | 10000           | 180000        |          |      |
| 22007   | Sieve 100#           |                            | Akhmad,Andrian        | 15000           | 200000        |          |      |
| 22008   | Sieve 10#            |                            | Akhmad,Andrian        | 15000           | 230000        |          |      |
| 11001   | Gelas Beaker 100ml   | pyrex                      | Fernandi,Annan        | 15000           | 75000         |          |      |
| 11002   | Gelas Beaker 1000ml  |                            | Fernandi,Annan        | 25000           | 80000         |          |      |
| 11003   | Gelas Beaker 250ml   |                            | Fernandi,Annan        | 15000           | 55000         |          |      |
| 11004   | Gelas Beaker 50ml    |                            | Fernandi,Annan        | 15000           | 55000         |          |      |
| 21001   | Muffle Furnace       | Max temp. 1400*C           | Fadillah,Fikri        | 2400000         | 100000000     |          |      |
| 21002   | Stir Casting Furnace | Max temp. 1000*C & RPM 900 | Fadillah,Fikri        | 1000000         | 75000000      |          |      |
| 22003   | Pasir Silika         |                            | Huzaimawardanni,Titan |                 |               | 15       | kg   |
| 22002   | Pasir besi           |                            | Huzaimawardanni,Titan |                 |               | 10       | kg   |
| 22004   | Scrap Alumunium      |                            | Huzaimawardanni,Titan |                 |               | 5        | kg   |
| 22001   | Ethanol 96%          | Merck                      | Huzaimawardanni,Titan |                 |               | 2000     | mL   |

VISITOR REPORT

    CREATE VIEW  "VISITATION_REPORT" AS 
      (
    select TO_CHAR(a.VST_SESSION_ID,'099999999') "Session ID",
       a.VST_VISITOR_ID "Visitor ID",
       a.VST_DATE_VISIT "Date",
       a.VST_LAST_NAME || ',' || a.VST_FIRST_NAME "Visitor",
       a.VST_PHONE "Phone Number",
       b.INT_STATUS "Status",
       c.EXT_REFERENCE_NAME "Reference Name",
       c.EXT_REFERENCE_ID "Reference ID",
       c.EXT_ADDRESS "Address"

    from visitation a
    left join internal b on a.VST_SESSION_ID = b.VST_SESSION_ID 
    left join external c on a.VST_SESSION_ID  = c.VST_SESSION_ID )
    
RESULT

| Session ID | Visitor ID | Date        | Visitor           | Phone Number | Status    | Reference Name | Reference ID | Address |
|------------|------------|-------------|-------------------|--------------|-----------|----------------|--------------|---------|
| 081018001  | 1902080002 | 08-Oct-2018 | Pratama,Adithya   | 89754288328  | Dosen     |                |              |         |
| 091018001  | 3334150230 | 09-Oct-2018 | Rheza,            | 88821394192  | Mahasiswa |                |              |         |
| 121018001  | 1010980001 | 12-Oct-2018 | Suryadi,          | 82317412382  | Dosen     |                |              |         |
| 121018002  | 2201100001 | 12-Oct-2018 | Salsabilla,Annisa | 85777428391  | Staff     |                |              |         |
| 131018001  | 3334150231 | 13-Oct-2018 | V,Yordan          | 89654312342  | Mahasiswa |                |              |         |
| 121218001  | 3275012721 | 12-Dec-2018 | PT Davindo J S,   | 81238219311  |           | Agus S         | 3275012721   | Bekasi  |


```python

```
