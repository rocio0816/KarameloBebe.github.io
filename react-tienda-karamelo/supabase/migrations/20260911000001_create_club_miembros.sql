create table if not exists public.club_miembros (
  user_id uuid primary key references auth.users(id) on delete cascade,
  nombre text not null check (char_length(trim(nombre)) between 2 and 120),
  correo text not null,
  fecha_nacimiento_bebe date,
  acepta_comunicaciones boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists club_miembros_correo_lower_idx
  on public.club_miembros (lower(correo));

alter table public.club_miembros enable row level security;

drop policy if exists "Cada miembro puede ver sus datos" on public.club_miembros;
create policy "Cada miembro puede ver sus datos"
  on public.club_miembros
  for select
  to authenticated
  using (auth.uid() = user_id);

drop policy if exists "Cada miembro puede registrar sus datos" on public.club_miembros;
create policy "Cada miembro puede registrar sus datos"
  on public.club_miembros
  for insert
  to authenticated
  with check (auth.uid() = user_id);

drop policy if exists "Cada miembro puede actualizar sus datos" on public.club_miembros;
create policy "Cada miembro puede actualizar sus datos"
  on public.club_miembros
  for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

drop policy if exists "Cada miembro puede eliminar sus datos" on public.club_miembros;
create policy "Cada miembro puede eliminar sus datos"
  on public.club_miembros
  for delete
  to authenticated
  using (auth.uid() = user_id);