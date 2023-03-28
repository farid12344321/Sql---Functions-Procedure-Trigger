
--create function SayHelloWorld()
--returns nvarchar(50)
--as
--BEGIN
--	return 'Hello World'
--END

--select dbo.SayHelloWorld()




create function dbo.writeWord(@word nvarchar(20))
returns nvarchar(50)
as
BEGIN
	return @word
END

declare @word nvarchar(20) = 'P135'

select dbo.writeWord(@word)


create function dbo.writeWordWithParametr(@word nvarchar(20),@source nvarchar(20))
returns nvarchar(50)
as
BEGIN
	return @word + @source
END

select dbo.writeWordWithParametr('Shaiq','P135') as 'Data'




create function dbo.sumOfNumbers(@num1 int,@num2 int)
returns int
as
BEGIN
	return @num1 + @num2
END

select dbo.sumOfNumbers(5,10)



create function dbo.getCustomerCount()
returns int
as
BEGIN
	declare @count int
	select @count = COUNT(*) from Customers
	return @count
END
select dbo.getCustomerCount()




create function dbo.getCustomerAvarageAgeById(@id int)
returns int
as
BEGIN
	declare @avgAge int
	select @avgAge = AVG(Age) from Customers where İd > @id
	return @avgAge
END

select * from Customers

select dbo.getCustomerAvarageAgeById(4)



create procedure usp_SayHelloWorld
as
BEGIN
	print 'Hello World'
END

exec usp_SayHelloWorld



create procedure usp_sumOfNums

@num1 int,
@num2 int
as
BEGIN
	print @num1 + @num2
END

exec usp_sumOfNums 5,8



create procedure usp_addCustomer
@name nvarchar(50),
@surname nvarchar(50),
@age int
as
BEGIN
	insert into Customers([Name],[Surname],[Age])
	values (@name,@surname,@age)
END

exec usp_addCustomer 'Eli','Talibov',21 







create procedure usp_deleteCustomer
@id int
as
BEGIN
	delete from Customers where İd = @id
END

exec usp_deleteCustomer 3



create procedure usp_deleteCustomerAndShowDatas
@id int
as
BEGIN
	delete from Customers where İd = @id
	select * from Customers
END

exec usp_deleteCustomerAndShowDatas 7






--create table UserLogs(
--	[Id] int primary key identity(1,1),
--	[UserID] int,
--	[Operation] nvarchar(10),
--	[Date] datetime
--)

--create trigger trg_insertUser on Users
--after insert 
--as
--BEGIN
--	insert into UserLogs([UserId],[Operation],[Date])
--	select Id,'Insert',GETDATE() from inserted
--END




--create procedure usp_insertUser
--@name nvarchar(20),
--@age int
--as
--BEGIN
--	insert into Users([Name],[Age])
--	values (@name,@age)
--END


exec usp_insertUser 'Ceyhun',23


create trigger trg_deleteUser on Users
after delete 
as
BEGIN
	insert into UserLogs([UserId],[Operation],[Date])
	select Id,'Delete',GETDATE() from deleted
END


delete from Users where Id = 1




create trigger trg_updateUser on Users
after update 
as
BEGIN
	insert into UserLogs([UserId],[Operation],[Date])
	select Id,'Update',GETDATE() from deleted
END

update Users
set [Age] = 30 where Id = 3