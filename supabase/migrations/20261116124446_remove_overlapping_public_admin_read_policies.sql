drop policy if exists "Admins manage inventory" on public.inventory;
create policy "Admins insert inventory" on public.inventory
  for insert to authenticated
  with check ((select public.has_role((select auth.uid()), 'admin'::public.app_role)));
create policy "Admins update inventory" on public.inventory
  for update to authenticated
  using ((select public.has_role((select auth.uid()), 'admin'::public.app_role)))
  with check ((select public.has_role((select auth.uid()), 'admin'::public.app_role)));
create policy "Admins delete inventory" on public.inventory
  for delete to authenticated
  using ((select public.has_role((select auth.uid()), 'admin'::public.app_role)));

drop policy if exists "Admins manage images" on public.product_images;
create policy "Admins insert images" on public.product_images
  for insert to authenticated
  with check ((select public.has_role((select auth.uid()), 'admin'::public.app_role)));
create policy "Admins update images" on public.product_images
  for update to authenticated
  using ((select public.has_role((select auth.uid()), 'admin'::public.app_role)))
  with check ((select public.has_role((select auth.uid()), 'admin'::public.app_role)));
create policy "Admins delete images" on public.product_images
  for delete to authenticated
  using ((select public.has_role((select auth.uid()), 'admin'::public.app_role)));

drop policy if exists "Admins manage variants" on public.product_variants;
create policy "Admins insert variants" on public.product_variants
  for insert to authenticated
  with check ((select public.has_role((select auth.uid()), 'admin'::public.app_role)));
create policy "Admins update variants" on public.product_variants
  for update to authenticated
  using ((select public.has_role((select auth.uid()), 'admin'::public.app_role)))
  with check ((select public.has_role((select auth.uid()), 'admin'::public.app_role)));
create policy "Admins delete variants" on public.product_variants
  for delete to authenticated
  using ((select public.has_role((select auth.uid()), 'admin'::public.app_role)));
