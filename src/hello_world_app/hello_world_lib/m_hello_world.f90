module m_hello_world
   implicit none(type, external)

   private

   public :: hello_world

contains

   function hello_world() result(res)
      character(len=:), allocatable :: res

      res = 'Hello, world!'
   end function hello_world

end module m_hello_world
