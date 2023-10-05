namespace FinanzasAdmin.Servicios
{
    public interface ISercicioUsuarios
    {
        int ObtenerUsuarioId();
    }

    public class ServicioUsuarios: ISercicioUsuarios
    {
        public int ObtenerUsuarioId()
        {
            return 1;
        }
    }
}
