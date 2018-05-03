using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace ProyectoX1.Models
{
    public class BD
    {
        private SqlConnection Conectar()
        {
            string ConnectionString = @"Server=.;Database=BDDProyecto;Trusted_Connection=True;";
            SqlConnection Coneccion = new SqlConnection(ConnectionString);
            Coneccion.Open();
            return Coneccion;
        }

        private void Desconectar(SqlConnection Conect)
        {
            Conect.Close();
        }

        public bool CargarEncontrado(Encontrado UnEncontrado)
        {

            bool SeSubio = false;
            SqlConnection Conexion = Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandText = "CargarEncontrado";
            Consulta.CommandType = System.Data.CommandType.StoredProcedure;
            Consulta.Parameters.AddWithValue("@idusuario", UnEncontrado.IdUsuario);
            Consulta.Parameters.AddWithValue("@idcategoria", UnEncontrado.IdCategoria);
            Consulta.Parameters.AddWithValue("@nombreencontrado", UnEncontrado.NombreEncontrado);
            Consulta.Parameters.AddWithValue("@fechaencontrado", UnEncontrado.FechaEncontrado);
            Consulta.Parameters.AddWithValue("@lugarencontrado", UnEncontrado.LugarEncontrado);
            Consulta.Parameters.AddWithValue("@imagenencontrado", UnEncontrado.ImagenEncontrado);
            Consulta.Parameters.AddWithValue("@descripcionencontrado", UnEncontrado.DescripcionEncontrado);
            Consulta.Parameters.AddWithValue("@activo", UnEncontrado.Activo);

            int afectados = Consulta.ExecuteNonQuery();

            if (afectados == 1)
            {

                SeSubio = true;
            }

            Desconectar(Conexion);
            return SeSubio;
        }
        public bool CargarPerdido(Perdido UnPerdido)
        {

            bool SeSubio = false;
            SqlConnection Conexion = Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandText = "CargarEncontrado";
            Consulta.CommandType = System.Data.CommandType.StoredProcedure;
            Consulta.Parameters.AddWithValue("@idusuario", UnPerdido.IdUsuario);
            Consulta.Parameters.AddWithValue("@idcategoria", UnPerdido.IdCategoria);
            Consulta.Parameters.AddWithValue("@nombreperdido", UnPerdido.NombrePerdido);
            Consulta.Parameters.AddWithValue("@fechaperdido", UnPerdido.FechaPerdido);
            Consulta.Parameters.AddWithValue("@lugarperdido", UnPerdido.LugarPerdido);
            Consulta.Parameters.AddWithValue("@imagenperdido", UnPerdido.ImagenPerdido);
            Consulta.Parameters.AddWithValue("@descripcionperdido", UnPerdido.DescripcionPerdido);
            Consulta.Parameters.AddWithValue("@activo", UnPerdido.Activo);

            int afectados = Consulta.ExecuteNonQuery();

            if (afectados == 1)
            {

                SeSubio = true;
            }

            Desconectar(Conexion);
            return SeSubio;
        }

        public List<Encontrado> BuscarEncontrado()
        {
            Encontrado Encontrados = new Encontrado();
            List<Encontrado> Encontrados = new List<Encontrado>();

            SqlConnection Conexion = Conectar();
            SqlCommand Consulta = Conexion.CreateCommand();
            Consulta.CommandText = "BuscarEncontrado";
            Consulta.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataReader dataReader = Consulta.ExecuteReader();
            while (dataReader.Read())
            {
                Encontrados.IdUsuario = dataReader["TituloPrincipal"].ToString();
                Encontrados.Foto = dataReader["ImagenPrincipal"].ToString();

                Encontrados.Add(Encontrados);
            }
            Desconectar(Conexion);
            return ListaInfo;
        }
    }
}