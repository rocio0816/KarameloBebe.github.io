alter table public.club_miembros
  drop constraint if exists club_miembros_pkey;

alter table public.club_miembros
  add column if not exists id uuid default gen_random_uuid(),
  add column if not exists edad_bebe text;

update public.club_miembros
set id = gen_random_uuid()
where id is null;

alter table public.club_miembros
  alter column id set not null,
  alter column user_id drop not null;

alter table public.club_miembros
  add constraint club_miembros_pkey primary key (id);

drop policy if exists "Cada miembro puede registrar sus datos" on public.club_miembros;
create policy "Visitantes pueden registrar sus datos"
  on public.club_miembros
  for insert
  to anon, authenticated
  with check (user_id is null or auth.uid() = user_id);