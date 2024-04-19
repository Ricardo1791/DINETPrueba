using Dapper;
using Microsoft.VisualBasic;
using System.Data.SqlClient;
using System.Numerics;
using WebApplication1.Interfaces;
using WebApplication1.Models;

namespace WebApplication1.Repositories
{
    public class MovInventarioRepository : IMovInventarioRepository
    {

        private readonly IConfiguration configuration;

        public MovInventarioRepository(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public async Task<Respuesta<int>> actualizarMovInventario(MovInventarioDTO model)
        {
            var sql = "EXEC USP_UPD_INVENTARIO @COD_CIA,@COMPANIA_VENTA_3,@ALMACEN_VENTA,@TIPO_MOVIMIENTO,@TIPO_DOCUMENTO,@NRO_DOCUMENTO,@COD_ITEM_2,@PROVEEDOR,@ALMACEN_DESTINO,@CANTIDAD,@COMPANIA_DESTINO,@COSTO_UNITARIO,@DOC_REF_1,@DOC_REF_2,@FECHA_TRANSACCION,@MOTIVO,@PRECIO_UNITARIO,@TIPO_DOC_REF,@UM_ITEM_3,@NRO_NOTA,@ROWVERSION,@USUARIO,@MONEDA,@COSTO_UNITARIO_ME,@COS_UNIT_EST,@COS_UNIT_ME_EST,@HORA_TRANSACCION,@F_ORDENCOMPRA,@C_SEC_OC,@C_SEC_DET_OC,@TIPO_DOC_REF_2,@OBSERVACION,@FECHA_VALORIZACION,@USUARIO_VALORIZA,@FACTOR,@COSTOS_ADICIONALES,@T_CAMBIO_VALORIZA,@PERIODO_CERRADO,@PLANILLA_CONSIGNA,@DOC_REF_3,@INGRESO_SALIDA,@SALDO_FINAL,@FLAG_URGENTE,@DOC_REF_4,@DOC_REF_5,@DOC_REF_6,@DOC_REF_7,@DOC_REF_8";

            var parametros = new
            {
                model.COD_CIA,
                model.COMPANIA_VENTA_3,
                model.ALMACEN_VENTA,
                model.TIPO_MOVIMIENTO,
                model.TIPO_DOCUMENTO,
                model.NRO_DOCUMENTO,
                model.COD_ITEM_2,
                model.PROVEEDOR,
                model.ALMACEN_DESTINO,
                model.CANTIDAD,
                model.COMPANIA_DESTINO,
                model.COSTO_UNITARIO,
                model.DOC_REF_1,
                model.DOC_REF_2,
                model.FECHA_TRANSACCION,
                model.MOTIVO,
                model.PRECIO_UNITARIO,
                model.TIPO_DOC_REF,
                model.UM_ITEM_3,
                model.NRO_NOTA,
                model.ROWVERSION,
                model.USUARIO,
                model.MONEDA,
                model.COSTO_UNITARIO_ME,
                model.COS_UNIT_EST,
                model.COS_UNIT_ME_EST,
                model.HORA_TRANSACCION,
                model.F_ORDENCOMPRA,
                model.C_SEC_OC,
                model.C_SEC_DET_OC,
                model.TIPO_DOC_REF_2,
                model.OBSERVACION,
                model.FECHA_VALORIZACION,
                model.USUARIO_VALORIZA,
                model.FACTOR,
                model.COSTOS_ADICIONALES,
                model.T_CAMBIO_VALORIZA,
                model.PERIODO_CERRADO,
                model.PLANILLA_CONSIGNA,
                model.DOC_REF_3,
                model.INGRESO_SALIDA,
                model.SALDO_FINAL,
                model.FLAG_URGENTE,
                model.DOC_REF_4,
                model.DOC_REF_5,
                model.DOC_REF_6,
                model.DOC_REF_7,
                model.DOC_REF_8
            };

            using var connection = new SqlConnection(configuration.GetConnectionString("DefaultConnection"));

            var respuesta = await connection.QueryAsync<Respuesta<int>>(sql, parametros);

            return respuesta.First();
        }

        public async Task<List<MovInventarioDTO>> listarMovInventario(MovInventarioFiltroDTO model)
        {
            var sql = "EXEC USP_SEL_INVENTARIO @fechainicio,@fechafin,@tipoMovimiento,@nroDocumento";

            var parametros = new
            {
                model.fechainicio,
                model.fechafin,
                model.tipoMovimiento,
                model.nroDocumento
            };

            using var connection = new SqlConnection(configuration.GetConnectionString("DefaultConnection"));

            var respuesta = await connection.QueryAsync<MovInventarioDTO>(sql, parametros);

            return respuesta.ToList();
        }

        public async Task<Respuesta<int>> registrarMovInventario(MovInventarioDTO model)
        {
            var sql = "EXEC USP_INS_INVENTARIO @COD_CIA,@COMPANIA_VENTA_3,@ALMACEN_VENTA,@TIPO_MOVIMIENTO,@TIPO_DOCUMENTO,@NRO_DOCUMENTO,@COD_ITEM_2,@PROVEEDOR,@ALMACEN_DESTINO,@CANTIDAD,@COMPANIA_DESTINO,@COSTO_UNITARIO,@DOC_REF_1,@DOC_REF_2,@FECHA_TRANSACCION,@MOTIVO,@PRECIO_UNITARIO,@TIPO_DOC_REF,@UM_ITEM_3,@NRO_NOTA,@ROWVERSION,@USUARIO,@MONEDA,@COSTO_UNITARIO_ME,@COS_UNIT_EST,@COS_UNIT_ME_EST,@HORA_TRANSACCION,@F_ORDENCOMPRA,@C_SEC_OC,@C_SEC_DET_OC,@TIPO_DOC_REF_2,@OBSERVACION,@FECHA_VALORIZACION,@USUARIO_VALORIZA,@FACTOR,@COSTOS_ADICIONALES,@T_CAMBIO_VALORIZA,@PERIODO_CERRADO,@PLANILLA_CONSIGNA,@DOC_REF_3,@INGRESO_SALIDA,@SALDO_FINAL,@FLAG_URGENTE,@DOC_REF_4,@DOC_REF_5,@DOC_REF_6,@DOC_REF_7,@DOC_REF_8";

            var parametros = new
            {
                model.COD_CIA ,
                model.COMPANIA_VENTA_3 ,
                model.ALMACEN_VENTA ,
                model.TIPO_MOVIMIENTO ,
                model.TIPO_DOCUMENTO ,
                model.NRO_DOCUMENTO ,
                model.COD_ITEM_2 ,
                model.PROVEEDOR ,
                model.ALMACEN_DESTINO ,
                model.CANTIDAD ,
                model.COMPANIA_DESTINO ,
                model.COSTO_UNITARIO ,
                model.DOC_REF_1 ,
                model.DOC_REF_2 ,
                model.FECHA_TRANSACCION ,
                model.MOTIVO ,
                model.PRECIO_UNITARIO ,
                model.TIPO_DOC_REF ,
                model.UM_ITEM_3 ,
                model.NRO_NOTA ,
                model.ROWVERSION ,
                model.USUARIO ,
                model.MONEDA ,
                model.COSTO_UNITARIO_ME ,
                model.COS_UNIT_EST ,
                model.COS_UNIT_ME_EST ,
                model.HORA_TRANSACCION ,
                model.F_ORDENCOMPRA ,
                model.C_SEC_OC ,
                model.C_SEC_DET_OC ,
                model.TIPO_DOC_REF_2 ,
                model.OBSERVACION ,
                model.FECHA_VALORIZACION ,
                model.USUARIO_VALORIZA ,
                model.FACTOR ,
                model.COSTOS_ADICIONALES ,
                model.T_CAMBIO_VALORIZA ,
                model.PERIODO_CERRADO ,
                model.PLANILLA_CONSIGNA ,
                model.DOC_REF_3 ,
                model.INGRESO_SALIDA ,
                model.SALDO_FINAL ,
                model.FLAG_URGENTE ,
                model.DOC_REF_4 ,
                model.DOC_REF_5 ,
                model.DOC_REF_6 ,
                model.DOC_REF_7 ,
                model.DOC_REF_8 
            };

            using var connection = new SqlConnection(configuration.GetConnectionString("DefaultConnection"));

            var respuesta = await connection.QueryAsync<Respuesta<int>>(sql, parametros);

            return respuesta.First();
        }
    }
}
