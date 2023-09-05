use dis;

drop procedure if exists calc;
DELIMITER //
create procedure calc()
BEGIN
  declare id int;
  declare dis int;
  declare prc int;
  declare fprc int;
  declare done boolean default false;

  declare cur cursor for 
  select c.cid, c.price, d.discount from customer as c 
  inner join discount as d on d.category = c.category;

  declare continue handler for not found set done = true;

  open cur;

  read_loop: loop 
    if (done = True) then leave read_loop;
    end if;

    fetch cur into id, prc, dis;
    set fprc := prc * (1 - dis / 100);

    update customer set pad = fprc
    where cid = id;

  end loop;
END// 
DELIMITER ;

call calc();

select name, price - pad as `discount availed` from customer where price > 2000;

select * from customer where year(dop) = 2021 and pad < 2000;
