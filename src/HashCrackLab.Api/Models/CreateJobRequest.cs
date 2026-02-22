namespace HashCrackLab.Api.Models
{
    public sealed class CreateJobRequest
    {
        public string Secret { get; set; } = "";
        public int MaxLen { get; set; } = 6;
        public int ChunkSize { get; set; } = 200_000;
    }
}
