use hotel;

DELIMITER //
create procedure bill_em()
BEGIN
  declare nr int;
  declare price int;
  declare tot int;
  declare bid int;
  declare done boolean default false;


  declare cur cursor for 
  select b.billID, b.nor, r.price from bill as b 
  inner join rooms as r on b.accTypeID = r.typeID;

  declare continue handler for not found set done = True;

  open cur;

  read_loop: loop 
    if (done = True) then leave read_loop;
    end if;

    fetch cur into bid, nr, price;
    set tot := nr * price;

    update bill set
    total = tot
    where billID = bid;
  end loop;

END// 
DELIMITER ;

call bill_em();

select * from bill where nor = (select max(nor) from bill);

select * from bill where dob between '2021-08-01' and '2021-12-31';


