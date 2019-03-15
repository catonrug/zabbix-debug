/* show the number of unsent values */
select count(*) from proxy_history where id > (select nextid from ids where table_name = 'proxy_history');

/* list unsent values, grouped by itemid and sorted by amount of unsent data */
select itemid,count(*) from proxy_history where id > (select nextid from ids where table_name = 'proxy_history') group by itemid order by count(*);

/* delete all schedule LLD cycles for the proxy server */
delete from proxy_history where itemid in (select itemid from items where flags=1);
