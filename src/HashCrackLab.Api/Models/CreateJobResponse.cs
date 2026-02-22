namespace HashCrackLab.Api.Models
{
    public class CreateJobResponse
    {
        public long JobId { get; set; }
        public string HashHex { get; set; } = "";
        public string Status { get; set; } = "";
    }
}
