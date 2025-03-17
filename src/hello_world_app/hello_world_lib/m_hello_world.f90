module m_hello_world
   implicit none(type, external)

   private

   public :: hello_world

   type :: greeting
      character(len=:), allocatable :: message
   end type

   type :: audience
      character(len=:), allocatable :: name
   end type
   
contains

   function hello_world() result(res)
      character(len=:), allocatable :: res

      type(greeting) :: greet 
      type(audience) :: who 

      greet = greeting(message = 'Hello') 
      who%name = 'world'
      
      res = greet%message // ', ' // who%name // '!'
   end function hello_world

end module m_hello_world
