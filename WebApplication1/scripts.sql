ALTER proc USP_INS_INVENTARIO(@COD_CIA varchar(50), 
							   @COMPANIA_VENTA_3 varchar(50), 
							   @ALMACEN_VENTA varchar(50), 
							   @TIPO_MOVIMIENTO varchar(50), 
							   @TIPO_DOCUMENTO varchar(50), 
							   @NRO_DOCUMENTO varchar(50), 
							   @COD_ITEM_2 varchar(50), 
							   @PROVEEDOR varchar(50),
							   @ALMACEN_DESTINO varchar(50),
							   @CANTIDAD varchar(50),
							   @COMPANIA_DESTINO varchar(50),
							   @COSTO_UNITARIO varchar(50),
							   @DOC_REF_1 varchar(50),
							   @DOC_REF_2 varchar(50),
							   @FECHA_TRANSACCION varchar(50),
							   @MOTIVO varchar(50),
							   @PRECIO_UNITARIO varchar(50),
							   @TIPO_DOC_REF varchar(50),
							   @UM_ITEM_3 varchar(50),
							   @NRO_NOTA varchar(50),
							   @ROWVERSION varchar(50),
							   @USUARIO varchar(50),
							   @MONEDA varchar(50),
							   @COSTO_UNITARIO_ME varchar(50),
							   @COS_UNIT_EST varchar(50),
							   @COS_UNIT_ME_EST varchar(50),
							   @HORA_TRANSACCION varchar(50),
							   @F_ORDENCOMPRA varchar(50),
							   @C_SEC_OC varchar(50),
							   @C_SEC_DET_OC varchar(50),
							   @TIPO_DOC_REF_2 varchar(50),
							   @OBSERVACION varchar(50),
							   @FECHA_VALORIZACION varchar(50),
							   @USUARIO_VALORIZA varchar(50),
							   @FACTOR varchar(50),
							   @COSTOS_ADICIONALES varchar(50),
							   @T_CAMBIO_VALORIZA varchar(50),
							   @PERIODO_CERRADO varchar(50),
							   @PLANILLA_CONSIGNA varchar(50),
							   @DOC_REF_3 varchar(50),
							   @INGRESO_SALIDA varchar(50),
							   @SALDO_FINAL varchar(50),
							   @FLAG_URGENTE varchar(50),
							   @DOC_REF_4 varchar(50),
							   @DOC_REF_5 varchar(50),
							   @DOC_REF_6 varchar(50),
							   @DOC_REF_7 varchar(50),
							   @DOC_REF_8 varchar(50))
as
begin



declare @respuesta table(
success bit,
message varchar(1000),
value int
)

BEGIN TRY  
    
	begin transaction;

	insert into [MOV_INVENTARIO] ([COD_CIA],
								  [COMPANIA_VENTA_3],
								  [ALMACEN_VENTA], 
								  [TIPO_MOVIMIENTO],
								  [TIPO_DOCUMENTO],
								  [NRO_DOCUMENTO],
								  [COD_ITEM_2],
								  [PROVEEDOR],
								  [ALMACEN_DESTINO],
								  [CANTIDAD],
								  [COMPANIA_DESTINO],
								  [COSTO_UNITARIO],
								  [DOC_REF_1],
								  [DOC_REF_2],
								  [FECHA_TRANSACCION],
								  [MOTIVO],
								  [PRECIO_UNITARIO],
								  [TIPO_DOC_REF],
								  [UM_ITEM_3],
								  [NRO_NOTA],
								  [ROWVERSION],
								  [USUARIO],
								  [MONEDA],
								  [COSTO_UNITARIO_ME],
								  [COS_UNIT_EST],
								  [COS_UNIT_ME_EST],
								  [HORA_TRANSACCION],
								  [F_ORDENCOMPRA],
								  [C_SEC_OC],
								  [C_SEC_DET_OC],
								  [TIPO_DOC_REF_2],
								  [OBSERVACION],
								  [FECHA_VALORIZACION],
								  [USUARIO_VALORIZA],
								  [FACTOR],
								  [COSTOS_ADICIONALES],
								  [T_CAMBIO_VALORIZA],
								  [PERIODO_CERRADO],
								  [PLANILLA_CONSIGNA],
								  [DOC_REF_3],
								  [INGRESO_SALIDA],
								  [SALDO_FINAL],
								  [FLAG_URGENTE],
								  [DOC_REF_4],
								  [DOC_REF_5],
								  [DOC_REF_6],
								  [DOC_REF_7],
								  [DOC_REF_8])
	values (@COD_CIA,
			@COMPANIA_VENTA_3,
			@ALMACEN_VENTA,
			@TIPO_MOVIMIENTO,
			@TIPO_DOCUMENTO,
			@NRO_DOCUMENTO,
			@COD_ITEM_2,
			@PROVEEDOR,
			@ALMACEN_DESTINO,
			@CANTIDAD,
			@COMPANIA_DESTINO,
			@COSTO_UNITARIO,
			@DOC_REF_1,
			@DOC_REF_2,
			@FECHA_TRANSACCION,
			@MOTIVO,
			@PRECIO_UNITARIO,
			@TIPO_DOC_REF,
			@UM_ITEM_3,
			@NRO_NOTA,
			@ROWVERSION,
			@USUARIO,
			@MONEDA,
			@COSTO_UNITARIO_ME,
			@COS_UNIT_EST,
			@COS_UNIT_ME_EST,
			@HORA_TRANSACCION,
			@F_ORDENCOMPRA,
			@C_SEC_OC,
			@C_SEC_DET_OC,
			@TIPO_DOC_REF_2,
			@OBSERVACION,
			@FECHA_VALORIZACION,
			@USUARIO_VALORIZA,
			@FACTOR,
			@COSTOS_ADICIONALES,
			@T_CAMBIO_VALORIZA,
			@PERIODO_CERRADO,
			@PLANILLA_CONSIGNA,
			@DOC_REF_3,
			@INGRESO_SALIDA,
			@SALDO_FINAL,
			@FLAG_URGENTE,
			@DOC_REF_4,
			@DOC_REF_5,
			@DOC_REF_6,
			@DOC_REF_7,
			@DOC_REF_8)

	insert into @respuesta values (1, 'Inventario registrado exitosamente',0)

	commit transaction;

END TRY  
BEGIN CATCH  
   
        declare @errorMessage varchar(1000) = ERROR_MESSAGE()
		
		insert into @respuesta values (0,@errorMessage, 0)
  
        ROLLBACK TRANSACTION;  
END CATCH;  


select * from @respuesta



end

go


create proc USP_SEL_INVENTARIO(@fechainicio varchar(20), @fechafin varchar(20), @tipoMovimiento varchar(20), @nroDocumento varchar(20))
as
begin



SELECT [COD_CIA]
      ,[COMPANIA_VENTA_3]
      ,[ALMACEN_VENTA]
      ,[TIPO_MOVIMIENTO]
      ,[TIPO_DOCUMENTO]
      ,[NRO_DOCUMENTO]
      ,[COD_ITEM_2]
      ,[PROVEEDOR]
      ,[ALMACEN_DESTINO]
      ,[CANTIDAD]
      ,[COMPANIA_DESTINO]
      ,[COSTO_UNITARIO]
      ,[DOC_REF_1]
      ,[DOC_REF_2]
      ,[FECHA_TRANSACCION]
      ,[MOTIVO]
      ,[PRECIO_UNITARIO]
      ,[TIPO_DOC_REF]
      ,[UM_ITEM_3]
      ,[NRO_NOTA]
      ,[ROWVERSION]
      ,[USUARIO]
      ,[MONEDA]
      ,[COSTO_UNITARIO_ME]
      ,[COS_UNIT_EST]
      ,[COS_UNIT_ME_EST]
      ,[HORA_TRANSACCION]
      ,[F_ORDENCOMPRA]
      ,[C_SEC_OC]
      ,[C_SEC_DET_OC]
      ,[TIPO_DOC_REF_2]
      ,[OBSERVACION]
      ,[FECHA_VALORIZACION]
      ,[USUARIO_VALORIZA]
      ,[FACTOR]
      ,[COSTOS_ADICIONALES]
      ,[T_CAMBIO_VALORIZA]
      ,[PERIODO_CERRADO]
      ,[PLANILLA_CONSIGNA]
      ,[DOC_REF_3]
      ,[INGRESO_SALIDA]
      ,[SALDO_FINAL]
      ,[FLAG_URGENTE]
      ,[DOC_REF_4]
      ,[DOC_REF_5]
      ,[DOC_REF_6]
      ,[DOC_REF_7]
      ,[DOC_REF_8]
  FROM [prueba].[dbo].[MOV_INVENTARIO]
  where (ISNULL(@fechainicio,'') = '' or CONVERT(date,[FECHA_TRANSACCION],103) >= CONVERT(date, @fechainicio))
  and (ISNULL(@fechafin,'') = '' or CONVERT(date,[FECHA_TRANSACCION],103) <= CONVERT(date, @fechafin))
  and (ISNULL(@tipoMovimiento,'')= '' or [TIPO_MOVIMIENTO] = @tipoMovimiento)
  and (ISNULL(@nroDocumento,'') = '' or [NRO_DOCUMENTO] = @nroDocumento)
   

end

go

alter proc USP_UPD_INVENTARIO(@COD_CIA varchar(50), 
							   @COMPANIA_VENTA_3 varchar(50), 
							   @ALMACEN_VENTA varchar(50), 
							   @TIPO_MOVIMIENTO varchar(50), 
							   @TIPO_DOCUMENTO varchar(50), 
							   @NRO_DOCUMENTO varchar(50), 
							   @COD_ITEM_2 varchar(50), 
							   @PROVEEDOR varchar(50),
							   @ALMACEN_DESTINO varchar(50),
							   @CANTIDAD varchar(50),
							   @COMPANIA_DESTINO varchar(50),
							   @COSTO_UNITARIO varchar(50),
							   @DOC_REF_1 varchar(50),
							   @DOC_REF_2 varchar(50),
							   @FECHA_TRANSACCION varchar(50),
							   @MOTIVO varchar(50),
							   @PRECIO_UNITARIO varchar(50),
							   @TIPO_DOC_REF varchar(50),
							   @UM_ITEM_3 varchar(50),
							   @NRO_NOTA varchar(50),
							   @ROWVERSION varchar(50),
							   @USUARIO varchar(50),
							   @MONEDA varchar(50),
							   @COSTO_UNITARIO_ME varchar(50),
							   @COS_UNIT_EST varchar(50),
							   @COS_UNIT_ME_EST varchar(50),
							   @HORA_TRANSACCION varchar(50),
							   @F_ORDENCOMPRA varchar(50),
							   @C_SEC_OC varchar(50),
							   @C_SEC_DET_OC varchar(50),
							   @TIPO_DOC_REF_2 varchar(50),
							   @OBSERVACION varchar(50),
							   @FECHA_VALORIZACION varchar(50),
							   @USUARIO_VALORIZA varchar(50),
							   @FACTOR varchar(50),
							   @COSTOS_ADICIONALES varchar(50),
							   @T_CAMBIO_VALORIZA varchar(50),
							   @PERIODO_CERRADO varchar(50),
							   @PLANILLA_CONSIGNA varchar(50),
							   @DOC_REF_3 varchar(50),
							   @INGRESO_SALIDA varchar(50),
							   @SALDO_FINAL varchar(50),
							   @FLAG_URGENTE varchar(50),
							   @DOC_REF_4 varchar(50),
							   @DOC_REF_5 varchar(50),
							   @DOC_REF_6 varchar(50),
							   @DOC_REF_7 varchar(50),
							   @DOC_REF_8 varchar(50))
as
begin



declare @respuesta table(
success bit,
message varchar(1000),
value int
)

BEGIN TRY  
    
	begin transaction;

	update [MOV_INVENTARIO] set   [PROVEEDOR] = @PROVEEDOR,
								  [ALMACEN_DESTINO] = @ALMACEN_DESTINO,
								  [CANTIDAD] = @CANTIDAD,
								  [COMPANIA_DESTINO] = @COMPANIA_DESTINO,
								  [COSTO_UNITARIO] = @COSTO_UNITARIO,
								  [DOC_REF_1]= @DOC_REF_1,
								  [DOC_REF_2]= @DOC_REF_2,
								  [FECHA_TRANSACCION] = @FECHA_TRANSACCION,
								  [MOTIVO] = @MOTIVO,
								  [PRECIO_UNITARIO] = @PRECIO_UNITARIO,
								  [TIPO_DOC_REF] = @TIPO_DOC_REF,
								  [UM_ITEM_3] = @UM_ITEM_3,
								  [NRO_NOTA] = @NRO_NOTA,
								  [ROWVERSION] = @ROWVERSION,
								  [USUARIO] = @USUARIO,
								  [MONEDA] = @MONEDA,
								  [COSTO_UNITARIO_ME] = @COSTO_UNITARIO_ME,
								  [COS_UNIT_EST] = @COS_UNIT_EST,
								  [COS_UNIT_ME_EST] = @COS_UNIT_ME_EST,
								  [HORA_TRANSACCION] = @HORA_TRANSACCION,
								  [F_ORDENCOMPRA] = @F_ORDENCOMPRA,
								  [C_SEC_OC] = @C_SEC_OC,
								  [C_SEC_DET_OC] = @C_SEC_DET_OC,
								  [TIPO_DOC_REF_2] = @TIPO_DOC_REF_2,
								  [OBSERVACION] = @OBSERVACION,
								  [FECHA_VALORIZACION] = @FECHA_VALORIZACION,
								  [USUARIO_VALORIZA] = @USUARIO_VALORIZA,
								  [FACTOR] = @FACTOR,
								  [COSTOS_ADICIONALES] = @COSTOS_ADICIONALES,
								  [T_CAMBIO_VALORIZA] = @T_CAMBIO_VALORIZA,
								  [PERIODO_CERRADO] = @PERIODO_CERRADO,
								  [PLANILLA_CONSIGNA] = @PLANILLA_CONSIGNA,
								  [DOC_REF_3] = @DOC_REF_3,
								  [INGRESO_SALIDA] = @INGRESO_SALIDA,
								  [SALDO_FINAL] = @SALDO_FINAL,
								  [FLAG_URGENTE] = @FLAG_URGENTE,
								  [DOC_REF_4] = @DOC_REF_4,
								  [DOC_REF_5] = @DOC_REF_5,
								  [DOC_REF_6] = @DOC_REF_6,
								  [DOC_REF_7] = @DOC_REF_7,
								  [DOC_REF_8] = @DOC_REF_8
	where   [COD_CIA] = @COD_CIA
			and [COMPANIA_VENTA_3] = @COMPANIA_VENTA_3
			and [ALMACEN_VENTA] = @ALMACEN_VENTA
			and [TIPO_MOVIMIENTO] = @TIPO_MOVIMIENTO
			and [TIPO_DOCUMENTO] = @TIPO_DOCUMENTO
			and [NRO_DOCUMENTO] = @NRO_DOCUMENTO
			and [COD_ITEM_2] = @COD_ITEM_2
	

	insert into @respuesta values (1, 'Inventario actualizado exitosamente',0)

	commit transaction;

END TRY  
BEGIN CATCH  
   
        declare @errorMessage varchar(1000) = ERROR_MESSAGE()
		
		insert into @respuesta values (0,@errorMessage, 0)
  
        ROLLBACK TRANSACTION;  
END CATCH;  


select * from @respuesta



end