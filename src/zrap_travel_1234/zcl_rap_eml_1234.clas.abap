CLASS zcl_rap_eml_1234 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_eml_1234 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
***** Begin example of read entity ****
    " Step 1 - Read example
*    READ ENTITIES OF ZI_RAP_Travel_1234
*        ENTITY Travel
*            FROM VALUE #( ( TravelUUID = 'CFCC02B022D529731800B7E67A915E06' ) )
*            RESULT data(travels).


    "Step 2 - Read with specific fields
*    READ ENTITIES OF ZI_RAP_Travel_1234
*       ENTITY travel
*         FIELDS ( AgencyID CustomerID )
*       WITH VALUE #( ( TravelUUID = 'CFCC02B022D529731800B7E67A915E06' ) )
*       RESULT DATA(travels).

    "Step 3 - Read ALL fields
*    READ ENTITIES OF ZI_RAP_Travel_1234
*       ENTITY travel
*         ALL FIELDS
*       WITH VALUE #( ( TravelUUID = 'CFCC02B022D529731800B7E67A915E06' ) )
*       RESULT DATA(travels).
*
*    out->write( travels ).
*
*     " step 4 - READ By Association, by following the association defined in the behavior definition
*    READ ENTITIES OF ZI_RAP_Travel_1234
*      ENTITY travel BY \_Booking
*        ALL FIELDS WITH VALUE #( ( TravelUUID = 'CFCC02B022D529731800B7E67A915E06' ) )
*      RESULT DATA(bookings).
*
*    out->write( bookings ).

    " step 5 - Unsuccessful READ
*    READ ENTITIES OF ZI_RAP_Travel_1234
*      ENTITY travel
*        ALL FIELDS WITH VALUE #( ( TravelUUID = '11111111111111111111111111111111' ) )
*      RESULT DATA(travels)
*      FAILED DATA(failed)
*      REPORTED DATA(reported).
*
*    out->write( travels ).
*    out->write( failed ).    " complex structures not supported by the console output
*    out->write( reported ).  " complex structures not supported by the console output

***** End example of read entity ****

***** Begin example of modify entity ****
    "Step 6 - Modify Update
*    MODIFY ENTITIES OF ZI_RAP_Travel_1234
*        ENTITY Travel
*            UPDATE
*                SET FIELDS WITH VALUE
*                    #( ( TravelUUID = 'CFCC02B022D529731800B7E67A915E06'
*                         Description = 'I like RAP Development') )
*            FAILED DATA(failed)
*            REPORTED DATA(reported).
*
*    COMMIT ENTITIES
*        RESPONSE OF ZI_RAP_Travel_1234
*        FAILED DATA(failed_commit)
*        REPORTED DATA(reported_commit).
*
*    out->write( 'Update done' ).

    "Step 7 Modify Create
*    MODIFY ENTITIES OF ZI_RAP_Travel_1234
*        ENTITY Travel
*            CREATE
*                SET FIELDS WITH VALUE
*                    #( ( %cid = 'MyContentID_1'
*                         AgencyID = '70002'
*                         CustomerID = '14'
*                         BeginDate = cl_abap_context_info=>get_system_date(  )
*                         EndDate = cl_abap_context_info=>get_system_date(  ) + 10
*                         Description = 'I like Rap Development ') )
*
*        MAPPED DATA(mapped)
*        FAILED DATA(failed)
*        REPORTED DATA(reported).
*
*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*        RESPONSE OF ZI_RAP_Travel_1234
*        FAILED DATA(failed_commit)
*        REPORTED DATA(reported_commit).
*
*    out->write( 'Record created' ).

    " step 8 - MODIFY Delete
    MODIFY ENTITIES OF ZI_RAP_Travel_1234
      ENTITY travel
        DELETE FROM
          VALUE
            #( ( TravelUUID  = '667DD2DAE9E91EEDB4E33ED40DC1B44E' ) )

     FAILED DATA(failed)
     REPORTED DATA(reported).

    COMMIT ENTITIES
      RESPONSE OF ZI_RAP_Travel_1234
      FAILED     DATA(failed_commit)
      REPORTED   DATA(reported_commit).

    out->write( 'Record Deleted' ).
***** End example of modify entity ****

  ENDMETHOD.
ENDCLASS.
