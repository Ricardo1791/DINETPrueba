namespace WebApplication1.Models
{
    public class Respuesta<T>
    {
        public bool success { get; set; }
        public string message { get; set; }
        public T data { get; set; }
    }
}
