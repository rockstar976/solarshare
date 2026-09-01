-- ============================================================
-- SolarShare MVP – Supabase Schema (FIXED VERSION)
-- Paste this ENTIRE file in SQL Editor and click RUN
-- ============================================================

-- Step 1: Drop old tables safely
drop table if exists notifications cascade;
drop table if exists transactions cascade;
drop table if exists market_listings cascade;
drop table if exists profiles cascade;

-- Step 2: Drop old trigger/function
drop trigger if exists on_auth_user_created on auth.users;
drop function if exists public.handle_new_user();

-- ============================================================
-- 1. PROFILES (linked to auth.users via UUID)
-- ============================================================
create table profiles (
  id            uuid primary key references auth.users(id) on delete cascade,
  name          text not null default 'New User',
  role          text not null default 'Consumer',
  flat_no       text not null default 'TBD',
  meter_id      text not null default 'TBD',
  discom        text not null default 'TBD',
  balance       numeric(10,2) default 150.00,
  surplus       numeric(10,2) default 0.0,
  avatar_color  text default '22c55e',
  created_at    timestamptz default now()
);

-- ============================================================
-- 2. MARKET LISTINGS (with location + rating columns)
-- ============================================================
create table market_listings (
  id            text primary key,
  seller_id     uuid references profiles(id) on delete set null,
  seller_name   text not null,
  units         numeric(10,2) not null,
  price         numeric(10,2) not null,
  distance      text not null default '0.5km',
  location      text default 'Society',
  rating        numeric(3,1) default 4.8,
  avatar_url    text,
  status        text default 'active',
  created_at    timestamptz default now()
);

-- ============================================================
-- 3. TRANSACTIONS (columns match the app exactly)
-- ============================================================
create table transactions (
  id            text primary key,
  user_id       uuid references profiles(id) on delete cascade,
  type          text not null,
  title         text not null default '',
  kwh           numeric(10,2) not null,
  price_per_kwh numeric(10,2) default 0,
  amount        numeric(10,2) not null,
  hash          text not null default '',
  date_label    text default 'Recent',
  counterparty  text not null default '',
  status        text default 'Completed',
  created_at    timestamptz default now()
);

-- ============================================================
-- 4. NOTIFICATIONS
-- ============================================================
create table notifications (
  id            text primary key,
  user_id       uuid references profiles(id) on delete cascade,
  type          text not null,
  title         text not null,
  message       text not null,
  is_read       boolean default false,
  created_at    timestamptz default now()
);

-- ============================================================
-- AUTO-CREATE PROFILE ON SIGNUP (Trigger)
-- ============================================================
create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, name, role, flat_no, meter_id, discom, balance, surplus)
  values (
    new.id,
    coalesce(new.raw_user_meta_data->>'name', 'New User'),
    coalesce(new.raw_user_meta_data->>'role', 'Consumer'),
    coalesce(new.raw_user_meta_data->>'flat_no', 'TBD'),
    coalesce(new.raw_user_meta_data->>'meter_id', 'TBD'),
    coalesce(new.raw_user_meta_data->>'discom', 'TBD'),
    150.00,
    case when coalesce(new.raw_user_meta_data->>'role', 'Consumer') = 'Prosumer'
         then round((random() * 8 + 2)::numeric, 1)
         else 0.00 end
  );
  return new;
end;
$$ language plpgsql security definer;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- ============================================================
-- ROW LEVEL SECURITY
-- ============================================================
alter table profiles        enable row level security;
alter table transactions    enable row level security;
alter table notifications   enable row level security;
alter table market_listings enable row level security;

-- Profiles
create policy "profiles_select" on profiles for select using (auth.uid() = id);
create policy "profiles_update" on profiles for update using (auth.uid() = id);

-- Transactions
create policy "txns_select" on transactions for select using (auth.uid() = user_id);
create policy "txns_insert" on transactions for insert with check (auth.uid() = user_id);
create policy "txns_delete" on transactions for delete using (auth.uid() = user_id);

-- Notifications
create policy "notif_select" on notifications for select using (auth.uid() = user_id);
create policy "notif_insert" on notifications for insert with check (auth.uid() = user_id);
create policy "notif_update" on notifications for update using (auth.uid() = user_id);

-- Market Listings (anyone can read, auth users can write)
create policy "listings_select" on market_listings for select using (true);
create policy "listings_insert" on market_listings for insert with check (auth.uid() is not null);
create policy "listings_update" on market_listings for update using (auth.uid() is not null);

-- ============================================================
-- REALTIME (run these one by one if they error)
-- ============================================================
alter publication supabase_realtime add table market_listings;
alter publication supabase_realtime add table transactions;
alter publication supabase_realtime add table notifications;
