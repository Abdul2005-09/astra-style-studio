create or replace function public.has_role(_user_id uuid, _role public.app_role)
returns boolean
language sql
stable
security definer
set search_path = public
as $function$
  select _user_id = (select auth.uid())
     and exists (
       select 1
       from public.user_roles
       where user_id = _user_id
         and role = _role
     );
$function$;

revoke execute on function public.has_role(uuid, public.app_role) from public, anon;
grant execute on function public.has_role(uuid, public.app_role) to authenticated, service_role;

revoke execute on function public.admin_exists() from public, anon;
grant execute on function public.admin_exists() to authenticated, service_role;

revoke execute on function public.handle_new_user() from public, anon, authenticated;
revoke execute on function public.create_inventory_rows() from public, anon, authenticated;

create index if not exists cart_items_product_id_idx on public.cart_items(product_id);
create index if not exists order_items_product_id_idx on public.order_items(product_id);
create index if not exists wishlists_product_id_idx on public.wishlists(product_id);
