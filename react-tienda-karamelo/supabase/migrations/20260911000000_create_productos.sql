create table if not exists public.productos (
  id text primary key,
  name text not null,
  category text not null,
  price numeric(10, 2) not null check (price >= 0),
  image_url text not null,
  short_description text not null,
  full_description text not null,
  sizes text[] not null default '{}',
  genders text[] not null default '{}',
  girl_colors jsonb not null default '[]'::jsonb,
  boy_colors jsonb not null default '[]'::jsonb,
  stock integer not null default 0 check (stock >= 0),
  active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.productos enable row level security;

drop policy if exists "Productos activos visibles publicamente" on public.productos;
create policy "Productos activos visibles publicamente"
  on public.productos
  for select
  to anon, authenticated
  using (active = true);

insert into public.productos (
  id, name, category, price, image_url, short_description, full_description,
  sizes, genders, girl_colors, boy_colors, stock
)
values
(
  'body-larga',
  'Body de manga larga',
  'bodys',
  75,
  'https://lh3.googleusercontent.com/aida-public/AB6AXuAIIdPlPpJm704Vvfll1XQGKqthprzKZYYgWK55nsYSSYJ1U0lrTUi2Hk5Ule3HMU89Rr21QeWeNVkzYfuybVBrK7qYZ8wzk8gec1Pf0FjIdxzKZ8DhgTjA-WChD6WUL_YV9dQuI1j0-AZVksx4r51a0Gt4v1kfa0gxk3IruV5FxTSYCA51GbGrE06xj7d2IEjMQEnlnk93ydUfw14McSu6K81I8r8BLp0Emsa1fAU9X0rszkpSWdQXxw',
  'Body suave con broches reforzados en la entrepierna, ideal para proteger los bracitos y mantenerlo abrigado con algodón Pima.',
  'Confeccionado en 100% algodón Pima peruano extra suave. Diseñado pensando en la máxima comodidad del bebé, con cuello elástico extensible y broches inferiores libres de níquel.',
  array['RN', '3 MESES', '6 MESES', '12 MESES', '18 MESES', '24 MESES'],
  array['niña', 'niño'],
  '[{"name":"Rosado","hex":"#F9A8D4"},{"name":"Lila","hex":"#E9D5FF"},{"name":"Amarillo","hex":"#FEF08A"},{"name":"Anaranjado","hex":"#FED7AA"},{"name":"Blanco","hex":"#FFFFFF"}]'::jsonb,
  '[{"name":"Celeste","hex":"#BAE6FD"},{"name":"Verde","hex":"#BBF7D0"},{"name":"Amarillo","hex":"#FEF08A"},{"name":"Plomo","hex":"#E2E8F0"},{"name":"Blanco","hex":"#FFFFFF"}]'::jsonb,
  20
),
(
  'body-corta',
  'Body de manga corta',
  'bodys',
  65,
  'https://lh3.googleusercontent.com/aida-public/AB6AXuAEZmEb4c_2x1QGZIh9Z1iErO3fWSqHoLh6b4SR2mwOEaI11iUsRggH73qoBTzTlnSR1lU3jQLPlQwAdJYH0UHBDSiIuCDq-qu6tKNY2DNVs8txyivD2ej1qzaEvrhHXXEo4OluuJy4K2p7nD0jVp4mrP2OGGnaGIopHRSHMdMWevzeY6jluJOK5mFXEzNBBFLFSOy0NQNpUfxw94rOpdM2KrlVatuWftb2FTmYecZBuHwwJ8h61f-ugw',
  'Prenda básica fresca y transpirable, perfecta para días cálidos o como primera capita protectora.',
  'Nuestra prenda más versátil. Hecha con algodón Pima sedoso para mantener fresca la piel del bebé durante el día o la siesta.',
  array['RN', '3 MESES', '6 MESES', '12 MESES', '18 MESES', '24 MESES'],
  array['niña', 'niño'],
  '[{"name":"Rosado","hex":"#F9A8D4"},{"name":"Lila","hex":"#E9D5FF"},{"name":"Amarillo","hex":"#FEF08A"},{"name":"Anaranjado","hex":"#FED7AA"},{"name":"Blanco","hex":"#FFFFFF"}]'::jsonb,
  '[{"name":"Celeste","hex":"#BAE6FD"},{"name":"Verde","hex":"#BBF7D0"},{"name":"Amarillo","hex":"#FEF08A"},{"name":"Plomo","hex":"#E2E8F0"},{"name":"Blanco","hex":"#FFFFFF"}]'::jsonb,
  20
),
(
  'busos-algodon',
  'Busos de algodón',
  'busos',
  80,
  'https://lh3.googleusercontent.com/aida-public/AB6AXuCQsUgOs8OZdVpux2qV0NT3YXrnZAsB8WtQlyAcC9_eHjCRPGRJ77-YkVsiXMK9XgMiVzJm9OS7nS3It2jh9Bvrxn0X5WfPUzEB-ORykBQBDTJ3hZtmz-8i3CXYZXk-6S6RKQjIRsOiWpXNgA_5zkr5azUZl7No-9YgTd_UwCND1NHyw4-X6duzsRojK4iwe-J8UPnybCXaXoKqn7JjLcaCVu_utxvBXz7ewVrOwJmgUt43f70OFjHZAg',
  'Pantaloncitos joggers cómodos con pretina elástica ancha que no aprieta la pancita del bebé.',
  'Pantalones tipo jogger confeccionados en algodón Pima de máxima suavidad, con puños anatómicos y pretina elástica delicada.',
  array['RN', '3 MESES', '6 MESES', '12 MESES', '18 MESES', '24 MESES'],
  array['niña', 'niño'],
  '[{"name":"Rosado","hex":"#F9A8D4"},{"name":"Lila","hex":"#E9D5FF"},{"name":"Amarillo","hex":"#FEF08A"},{"name":"Anaranjado","hex":"#FED7AA"},{"name":"Blanco","hex":"#FFFFFF"}]'::jsonb,
  '[{"name":"Celeste","hex":"#BAE6FD"},{"name":"Verde","hex":"#BBF7D0"},{"name":"Amarillo","hex":"#FEF08A"},{"name":"Plomo","hex":"#E2E8F0"},{"name":"Blanco","hex":"#FFFFFF"}]'::jsonb,
  20
),
(
  'shorts-algodon',
  'Shorts de algodón',
  'shorts',
  60,
  'https://lh3.googleusercontent.com/aida-public/AB6AXuADJj8kQ-RP7Mz4mxBB6m0LCUh-0TsLvi0o8C2WvktSMtX7Mw4sRYQcVyIX_OnaPOzTy12NeT43zUbF8pqDHM0_leZXNKgzZ3TpyYCLwU0iSMEYEERNvvVOcZmxexcPHA1Wnhqsb6K6-gTmAHkYOSaNhJnvuOoPfDLED8Ic0fx3vtEvbsphu0CMfsOOk7MsO_L9y0FEPIbWN7N9hP7aOIP-BPuZLLmhCoaacpvdfHxdYwmbUQp0F1LQvA',
  'Shorts frescos, ligeros y holgados para juego activo y días soleados sin rozaduras.',
  'Shorts de corte anatómico holgado diseñados para acomodar perfectamente el pañal sin ajustar los muslitos.',
  array['RN', '3 MESES', '6 MESES', '12 MESES', '18 MESES', '24 MESES'],
  array['niña', 'niño'],
  '[{"name":"Rosado","hex":"#F9A8D4"},{"name":"Lila","hex":"#E9D5FF"},{"name":"Amarillo","hex":"#FEF08A"},{"name":"Anaranjado","hex":"#FED7AA"},{"name":"Blanco","hex":"#FFFFFF"}]'::jsonb,
  '[{"name":"Celeste","hex":"#BAE6FD"},{"name":"Verde","hex":"#BBF7D0"},{"name":"Amarillo","hex":"#FEF08A"},{"name":"Plomo","hex":"#E2E8F0"},{"name":"Blanco","hex":"#FFFFFF"}]'::jsonb,
  20
)
on conflict (id) do update set
  name = excluded.name,
  category = excluded.category,
  price = excluded.price,
  image_url = excluded.image_url,
  short_description = excluded.short_description,
  full_description = excluded.full_description,
  sizes = excluded.sizes,
  genders = excluded.genders,
  girl_colors = excluded.girl_colors,
  boy_colors = excluded.boy_colors,
  updated_at = now();