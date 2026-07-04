
--pr0:https://leetcode.com/problems/biggest-window-between-visits/
--pr1:https://leetcode.com/problems/tournament-winners/
--pr2:https://leetcode.com/problems/longest-winning-streak/
--pr3:https://leetcode.com/problems/top-three-wineries/description/

-- Create table If Not Exists Person (Id int, Email varchar(255));
-- Truncate table Person;
-- insert into Person (id, email) values ('1', 'john@example.com');
-- insert into Person (id, email) values ('2', 'bob@example.com');
-- insert into Person (id, email) values ('3', 'john@example.com');

delete from Person where id in (
    with cte as (
        select *,
            dense_rank() over(partition by email order by id) as rnk
        from person 
    )
    select id
    from cte
    where rnk != 1
);

select * from Person;
