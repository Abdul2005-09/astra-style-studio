do $$
declare
  rec record;
  v_using text;
  v_check text;
  v_sql text;
begin
  for rec in
    select schemaname, tablename, policyname, qual, with_check
    from pg_policies
    where schemaname = 'public'
      and (
        coalesce(qual, '') ilike '%auth.uid()%'
        or coalesce(qual, '') ilike '%has_role(%'
        or coalesce(with_check, '') ilike '%auth.uid()%'
        or coalesce(with_check, '') ilike '%has_role(%'
      )
  loop
    v_using := rec.qual;
    v_check := rec.with_check;

    if v_using is not null then
      v_using := replace(v_using,
        'has_role(auth.uid(), ''admin''::app_role)',
        '(select public.has_role((select auth.uid()), ''admin''::app_role))');
      v_using := replace(v_using, 'auth.uid()', '(select auth.uid())');
    end if;

    if v_check is not null then
      v_check := replace(v_check,
        'has_role(auth.uid(), ''admin''::app_role)',
        '(select public.has_role((select auth.uid()), ''admin''::app_role))');
      v_check := replace(v_check, 'auth.uid()', '(select auth.uid())');
    end if;

    if v_using is not null and v_check is not null then
      v_sql := format('alter policy %I on %I.%I using (%s) with check (%s)',
        rec.policyname, rec.schemaname, rec.tablename, v_using, v_check);
    elsif v_using is not null then
      v_sql := format('alter policy %I on %I.%I using (%s)',
        rec.policyname, rec.schemaname, rec.tablename, v_using);
    elsif v_check is not null then
      v_sql := format('alter policy %I on %I.%I with check (%s)',
        rec.policyname, rec.schemaname, rec.tablename, v_check);
    else
      continue;
    end if;

    execute v_sql;
  end loop;
end $$;
