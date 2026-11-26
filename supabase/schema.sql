-- Jalankan di Supabase: SQL Editor > New query > Run
create table if not exists public.tugas(
  id bigint primary key,
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  mk int, judul text not null, dl timestamptz, pri text, bobot int,
  st text default 'belum', nilai numeric, ins text, note text, link text,
  ver int default 0, sent_at timestamptz, dirty boolean default false,
  files jsonb default '[]', log jsonb default '[]', updated_at timestamptz default now());
alter table public.tugas enable row level security;
create policy "tugas milik sendiri" on public.tugas for all
  using (user_id = auth.uid()) with check (user_id = auth.uid());

insert into storage.buckets (id, name, public) values ('tugas-files','tugas-files',false)
  on conflict (id) do nothing;
create policy "file read own" on storage.objects for select
  using (bucket_id='tugas-files' and (storage.foldername(name))[1]=auth.uid()::text);
create policy "file insert own" on storage.objects for insert
  with check (bucket_id='tugas-files' and (storage.foldername(name))[1]=auth.uid()::text);
create policy "file update own" on storage.objects for update
  using (bucket_id='tugas-files' and (storage.foldername(name))[1]=auth.uid()::text);
create policy "file delete own" on storage.objects for delete
  using (bucket_id='tugas-files' and (storage.foldername(name))[1]=auth.uid()::text);
