namespace HashCrackLab.Api.Data
{
    public interface IJobRepository
    {
        Task<long> CreateJobAsync(CancellationToken cancellationToken);

    }
}
