create table if not exists hash_jobs (
  job_id              bigserial primary key,
  hash_hex            char(64) not null,
  algo                text not null,
  charset             text not null,
  max_len             int not null,
  status              text not null, -- running | solved | expired
  created_at_utc      timestamptz not null default now(),
  solved_at_utc       timestamptz null,
  solved_plaintext    text null,
  solved_by_worker_id text null
);

create unique index if not exists ux_hash_jobs_hash_hex on hash_jobs(hash_hex);
create index if not exists ix_hash_jobs_status on hash_jobs(status);

create table if not exists hash_job_chunks (
  chunk_id             bigserial primary key,
  job_id               bigint not null references hash_jobs(job_id) on delete cascade,
  range_start          bigint not null, -- inclusive
  range_end            bigint not null, -- exclusive
  claimed_by_worker_id text null,
  claimed_at_utc       timestamptz null,
  completed_at_utc     timestamptz null,
  found_match          boolean not null default false
);

create index if not exists ix_chunks_claim on hash_job_chunks (claimed_at_utc, completed_at_utc, chunk_id);
create index if not exists ix_chunks_job on hash_job_chunks (job_id);