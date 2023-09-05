use marks;

select * from student_details as s 
left join grace_marks as g on s.category = g.category;

drop procedure if exists calc;

DELIMITER //
create procedure calc()
BEGIN
  declare sno int;
  declare tm int;
  declare gmperc int;
  declare fm int;
  declare done boolean default false;
  declare g char;

  declare cur cursor for 
  select s.srno, s.totalMarks, g.graceMark from student_details as s 
  left join grace_marks as g on s.category = g.category;

  declare continue handler for not found set done = True;
  open cur;

  calc_grade: loop
    if (done = True) then leave calc_grade;
    end if;

    fetch cur into sno, tm, gmperc;
    if (gmperc is not null) then 
      set fm := tm * (1 + gmperc / 100);
    else 
      set fm := tm;
    end if;

    if (fm >= 300) then
      set g = 'S';
    else 
      set g = 'A';
    end if;
  
    update student_details set
    finalMarks = fm,
    grade = g
    where srno = sno;
  end loop;
END // 
Delimiter ;

call calc();

select studentName, finalMarks - totalMarks as `Grace Marks` from student_details 
where finalMarks > 70 * 350 / 100;

select * from student_details where year(doa) = 2022
and category is not null;

