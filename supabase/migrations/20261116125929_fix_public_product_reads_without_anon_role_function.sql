alter policy "Public reads active products"
on public.products
using (status = any (array['active'::text, 'sold_out'::text]));

drop policy if exists "Admins read all products" on public.products;
create policy "Admins read all products"
on public.products
for select
to authenticated
using ((select public.has_role((select auth.uid()), 'admin'::public.app_role)));
