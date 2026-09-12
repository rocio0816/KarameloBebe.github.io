alter table public.club_miembros
  alter column user_id drop not null,
  add column if not exists edad_bebe text;

drop policy if exists "Cada miembro puede registrar sus datos" on public.club_miembros;
create policy "Visitantes pueden registrar sus datos"
  on public.club_miembros
  for insert
  to anon, authenticated
  with check (user_id is null or auth.uid() = user_id);