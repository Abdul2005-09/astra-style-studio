alter table public.store_settings alter column whatsapp_number set default '919344868741';
update public.store_settings set whatsapp_number = '919344868741' where whatsapp_number = '919361617869';